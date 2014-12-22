package mx.com.banco.azteca.migration.document.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.Map;
import mx.com.banco.azteca.migration.document.db.DBConnection;
import mx.com.banco.azteca.migration.document.model.Document;
import mx.com.banco.azteca.migration.document.util.ConfigFile;
import mx.com.banco.azteca.migration.document.util.PrintObject;
import org.apache.log4j.Logger;

/**
 * @author Carlos Cuaya Xinto
 */
public class DigbbDao {
    
    private static final Logger log;
    //environment properties
    private static final ConfigFile configFile;
    
    private static final String  PROCEDURE_SAVE_DOCUMENT;
    private static final String  QUERY_RETRIEVE_DOCUMENT_TYPES;
    private static final String  DOCUMENT_TYPES;
    private static final Integer DOC_TYPE_DFL;
    
    private static Connection connection;
    
    static {
        log = Logger.getLogger(DigbbDao.class);
        configFile = ConfigFile.getConfigFile();
        
        PROCEDURE_SAVE_DOCUMENT = configFile.getProperty(
                                            "digbb.save.document.procedure");
        QUERY_RETRIEVE_DOCUMENT_TYPES = configFile.getProperty(
                                            "digbb.document.types.query");
        DOCUMENT_TYPES = configFile.getProperty("digbb.doc.types");
        DOC_TYPE_DFL = configFile.getIntProperty("digbb.doc.type.def.val");
    }
    
    public static String saveDocumentAndGettingDestPath(Document document){
        CallableStatement cs = null;
        String destinationFilePath = null;
        
        try {
            connection = DBConnection.getDigBBConection();
            // connection.setAutoCommit(false);
            cs = connection.prepareCall(PROCEDURE_SAVE_DOCUMENT);
            
            cs.setInt(1,document.getCountry());//PAFIIDPAIS
            cs.setInt(2,document.getCanal());//PAFIIDCANAL
            cs.setInt(3,document.getBranch());//PAFIIDSUCURSAL
            cs.setInt(4,document.getFolio());//PAFIFOLIO
            cs.setString(5,document.getPersonName());//PAFCNOMBRE
            cs.setString(6,document.getPersonLastname());//PAFCAPARTENO
            cs.setString(7,document.getPersonSecondLastname());//PAFCAMATERNO
            cs.setInt(8,document.getProductId());//PAFIIDPRODUCTO
            cs.setInt(9,document.getDocumentTypeId());//PAFIIDTIPODOCTO
            cs.setString(10,document.getWorkstation());//PAFCWORKSTATION
            cs.setInt(11,document.getDigitalCanalId());//PAFIIDCANALDIG
            cs.setInt(12,document.getDigitalBranchId());//PAFIIDSUCURSALDIG
            cs.setString(13,document.getUser());//PAFCUSUARIO
            cs.setString(14,document.getImageSize());//PAFCTAMIMAGEN
            cs.registerOutParameter(15, Types.VARCHAR);//PAFCRUTA

            cs.execute();

            destinationFilePath = cs.getString(15);

        } catch (SQLException sqle) {
            log.error("Save document error: " + sqle);
        } finally {
            try {
                if (cs != null) cs.close();
                if (connection != null) connection.close();
                
            } catch (SQLException sqle) {
                log.error("Close connection error: " + sqle);
            }
        }

        return destinationFilePath;
    }
    
    public static Map<String,Integer> getDocumentTypes(){
        
        Map<String,Integer> documentTypes = new HashMap<>();
        Map<String,Integer> documentsFromProp;
        
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String  documentName;
        Integer documentTypeId;
        try {
            connection = DBConnection.getDigBBConection();
            preparedStatement = connection.prepareStatement(
                                                QUERY_RETRIEVE_DOCUMENT_TYPES);
            
            resultSet = preparedStatement.executeQuery();
            documentsFromProp = getDocumentsFromProp();
            
            while (resultSet.next()) { 
                documentName = resultSet.getString(1).trim();
                documentTypeId = documentsFromProp.get(documentName);
                documentTypeId = documentTypeId == null ? 
                                                  DOC_TYPE_DFL : documentTypeId;
                documentTypes.put(documentName, documentTypeId);
            }
            
        } catch (SQLException sqlex) {
            log.error("Retrieve document types error: " + sqlex);
        }finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
                
            } catch (SQLException sqle) {
                log.error("Close connection error: " + sqle);
            }
        }
            
        return documentTypes.isEmpty() ? null : documentTypes;
    }
    
    private static Map<String,Integer> getDocumentsFromProp(){
        
        Map<String,Integer> documents = new HashMap<>();
        String[] documentInfo;
        String   documentName;
        Integer  documentTypeId;
        
        log.debug("DOCUMENT_TYPES: " + DOCUMENT_TYPES);
        
        String[] documentsWithValue = DOCUMENT_TYPES.split("\\|");    
        
        PrintObject.printArray("documentsWithValue", documentsWithValue);
        
        for (String documentAndValue : documentsWithValue) {
            documentInfo = documentAndValue.split("!");
            PrintObject.printArray("documentInfo", documentInfo);
            try {
                documentName   = documentInfo[0].trim();
                documentTypeId = Integer.parseInt(documentInfo[1]);
            } catch (NumberFormatException | IndexOutOfBoundsException niex) {
                log.error("split documents from properties error: " + niex);
                continue;
            }
               
            documents.put(documentName, documentTypeId);
        }

        return documents.isEmpty() ? null : documents;
    }

}
