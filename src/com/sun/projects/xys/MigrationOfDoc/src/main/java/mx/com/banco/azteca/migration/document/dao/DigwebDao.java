package mx.com.banco.azteca.migration.document.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mx.com.banco.azteca.migration.document.db.DBConnection;
import mx.com.banco.azteca.migration.document.model.Document;
import mx.com.banco.azteca.migration.document.util.ConfigFile;
import org.apache.log4j.Logger;

/**
 * @author Carlos Cuaya Xinto
 */
public class DigwebDao {
    
    private static final Logger log;
    
    //environment properties
    private static final ConfigFile configFile;
    
    //query projected headers
    private static final String CONSECUTIVE_NUMBER;
    private static final String ACCOUNT;
    private static final String UNIQUE_CUSTOMER;
    private static final String PERSON_NAME;
    private static final String PERSON_LASTNAME;
    private static final String PERSON_SECOND_LASTNAME;
    private static final String DOCUMENT_NAME;
    private static final String WORKSTATION;
    private static final String DIGITAL_BRANCH_ID;
    private static final String USER;
    private static final String IMAGE_PATH;
    
    //data for query
    private static final String TOKEN;
    private static final String QUERY_DOCUMENTS_FOR_MIGRATION;
    private static final String QUERY_UPDATE_ACCOUNT_STATUS;
    private static final String APPIMX_NAME;
    private static final String MIGRATION_FLAG;
    
    //default values
    private static final Integer PRUDUCT_ID;
    private static final Integer DIGITAL_CANAL_ID;
    
    private static Connection connection;
    
    static {
        log = Logger.getLogger(DigwebDao.class);
        configFile = ConfigFile.getConfigFile();
        
        CONSECUTIVE_NUMBER = configFile.getProperty("header.consecutive.number");
        ACCOUNT = configFile.getProperty("header.account");
        UNIQUE_CUSTOMER = configFile.getProperty("header.unique.customer");
        PERSON_NAME = configFile.getProperty("header.person.name");
        PERSON_LASTNAME = configFile.getProperty("header.person.lastname"); 
        PERSON_SECOND_LASTNAME = configFile.getProperty(
                                            "header.person.second.lastname");
        DOCUMENT_NAME = configFile.getProperty("header.document.name");
        WORKSTATION = configFile.getProperty("header.workstation");
        DIGITAL_BRANCH_ID = configFile.getProperty("header.digital.branch.id");
        USER = configFile.getProperty("header.user");
        IMAGE_PATH = configFile.getProperty("header.image.path");
        PRUDUCT_ID = configFile.getIntProperty("product.id");
        DIGITAL_CANAL_ID = configFile.getIntProperty("digital.canal.id");
        TOKEN = "-";
        
        QUERY_DOCUMENTS_FOR_MIGRATION = configFile.getProperty(
                                                    "digweb.migration.query");
        QUERY_UPDATE_ACCOUNT_STATUS = configFile.getProperty(
                                            "digweb.migration.update.query");
        
        APPIMX_NAME = configFile.getProperty("appimx.name");
        MIGRATION_FLAG = configFile.getProperty("value.for.migration");
    }
    
    public static List<Document> getDocumentsforMigration() {
        
        List<Document> documents = new ArrayList<>();
    
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DBConnection.getDigWebConection();
            
            preparedStatement = connection.prepareStatement(
                                                QUERY_DOCUMENTS_FOR_MIGRATION);

            preparedStatement.setString(1, APPIMX_NAME);
            preparedStatement.setString(2, MIGRATION_FLAG);
            
            resultSet = preparedStatement.executeQuery();

            Document document;
            String[] ccbf;
            Integer  country;
            Integer  canal;
            Integer  branch;
            Integer  folio;
            Integer  digitalBranchId;
            
            while (resultSet.next()) {
                
                document = new Document();
                //get the unique customer to split in 
                //country, canal, branch, folio
                String uniqueCustomer = resultSet.getString(UNIQUE_CUSTOMER);
                ccbf = uniqueCustomer.split(TOKEN);
                
                try {
                    country         = Integer.parseInt(ccbf[0]);
                    canal           = Integer.parseInt(ccbf[1]);
                    branch          = Integer.parseInt(ccbf[2]);
                    folio           = Integer.parseInt(ccbf[3]);
                    digitalBranchId = resultSet.getInt(DIGITAL_BRANCH_ID);
                } catch (IndexOutOfBoundsException | NumberFormatException ine){
                    log.error("Split unique customer error: " + ine );
                    // jump to the next row because there is a unique customer,
                    // product id or digital branch id no valid
                    continue; 
                }
                
                document.setExpImx(resultSet.getInt(CONSECUTIVE_NUMBER));
                document.setAccount(resultSet.getString(ACCOUNT));
                
                document.setCountry(country);
                document.setCanal(canal);
                document.setBranch(branch);
                document.setFolio(folio);
                document.setPersonName(resultSet.getString(PERSON_NAME));
                document.setPersonLastname(resultSet.getString(PERSON_LASTNAME));
                document.setPersonSecondLastname(resultSet.getString(
                                                       PERSON_SECOND_LASTNAME));
                document.setProductId(PRUDUCT_ID);
                document.setDocumentName(
                                    resultSet.getString(DOCUMENT_NAME).trim());
                document.setWorkstation(resultSet.getString(WORKSTATION));
                document.setDigitalCanalId(DIGITAL_CANAL_ID);
                document.setDigitalBranchId(digitalBranchId);
                document.setUser(resultSet.getString(USER));
                document.setImagePath(resultSet.getString(IMAGE_PATH));

                documents.add(document);
            }
            
            
        } catch (SQLException sqlex) {
            log.error("Migration query error: " + sqlex);
        }finally {
            try {
                if (resultSet != null) resultSet.close();
                
                if (preparedStatement != null) preparedStatement.close();
                               
                if (connection != null) connection.close();
                
            } catch (SQLException sqle) {
                log.error("Close connection error: " + sqle);
            }
        }
        
        return documents;
    }
    
    public static void updateAccountStatus(int expimx, String account){
        
        PreparedStatement preparedStatement = null;
        
        try {
            connection = DBConnection.getDigWebConection();
            preparedStatement = connection.prepareStatement(
                                                QUERY_UPDATE_ACCOUNT_STATUS);
            
            preparedStatement.setInt(1, expimx);
            preparedStatement.setString(2, account);
            
            int result = preparedStatement.executeUpdate();
            
            log.debug("update result: " + result);
            
        } catch (SQLException sqlex) {
            log.error("updating account error: " + sqlex);
        }finally {
            try {
                
                if (preparedStatement != null) preparedStatement.close();
                
                if (connection != null) connection.close();
   
            } catch (SQLException sqle) {
                log.error("Close connection error: " + sqle);
            }
        }
  
    }
  
}
