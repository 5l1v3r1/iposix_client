package mx.com.banco.azteca.migration.document.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mx.com.banco.azteca.migration.document.db.DBConnection;
import mx.com.banco.azteca.migration.document.model.Account;
import mx.com.banco.azteca.migration.document.model.Document;
import org.apache.log4j.Logger;

/**
 * @author Carlos Cuaya Xinto
 */
public class DigwebDao {
    
    private static final Logger log = Logger.getLogger(DigwebDao.class);
    
    private static final String NAME;
    private static final String IMX20_VALUE;
    private static Connection connection;

    static {
        NAME = "CAPTACION_WEB";
        IMX20_VALUE = "P";
    }
    
    private static String getQueryStringForGettingAcoountforMigration() {
        String query = " SELECT DIMX01.EXPIMX, DIMX01.APPIMX, " +
                       " DIMX01.IMX01, DIMX01.IMX02 " +
                       " FROM DIGWEB.IMX01 DIMX01 " +
                       " WHERE TRIM(DIMX01.APPIMX) = ? " +
                       " AND TRIM(DIMX01.IMX20) = ?";
        return query;
    }
    
    public static List<Account> getAccountsforMigration() {
        
        List<Account> accounts = new ArrayList<>();
    
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        try {
            connection = DBConnection.getDigWebConection();
            
            preparedStatement = connection.prepareStatement(
                                getQueryStringForGettingAcoountforMigration());

            preparedStatement.setString(1, NAME);
            preparedStatement.setString(2, IMX20_VALUE);
            
            resultSet = preparedStatement.executeQuery();
            
            Account account;
            
            while (resultSet.next()) {
                account = new Account();
                account.setExpimx(resultSet.getString("EXPIMX"));
                account.setAppimxName(resultSet.getString("APPIMX"));
                account.setAccount(resultSet.getString("IMX01"));
                account.setSecondAccount(resultSet.getString("IMX02"));
                accounts.add(account);
            }
            
            
        } catch (SQLException ex) {
            log.error("ex: " + ex);
        }
        
        return accounts;
    }
    
    public static List<Document> getExistingDocuments(String account){
        CallableStatement cs = null;
        ResultSet rs         = null;
        
        List<Document> documents  = new ArrayList<>();
       
        
        try {
            connection = DBConnection.getDigWebConection();
            cs = connection.prepareCall("{call DIGWEB.PQDG_DIGWEB_DIGBB" + 
                                   ".PADG_DOCUMENTOS_EXISTENTE(?,?)}");
            
            cs.setString(1, account);

            cs.registerOutParameter(2, -10);

            cs.execute();

            rs = (ResultSet) cs.getObject(2);
            
            Document document;
            
            while (rs.next()) {

                document = new Document();

                document.setIdDocImx(rs.getString("IDDOCIMX"));
                document.setNomDocImx(rs.getString("NOMDOCIMX"));
                document.setPagImx(rs.getString("PAGIMX"));
                document.setRutImx(rs.getString("RUTIMX"));
                document.setUsuarioImx(rs.getString("USUARIOIMX"));
                document.setWsImx(rs.getString("WSIMX"));

                documents.add(document);
            }

        } catch (SQLException e) {
            
        } finally {
            try {
                if (cs != null) {
                    cs.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                
            }
        }

        return documents;
    }
    

}
