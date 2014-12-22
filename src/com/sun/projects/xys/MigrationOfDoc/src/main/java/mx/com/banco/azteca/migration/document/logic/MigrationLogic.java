package mx.com.banco.azteca.migration.document.logic;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import mx.com.banco.azteca.migration.document.dao.DigbbDao;
import mx.com.banco.azteca.migration.document.dao.DigwebDao;
import mx.com.banco.azteca.migration.document.model.Document;
import mx.com.banco.azteca.migration.document.util.ConfigFile;
import mx.com.banco.azteca.migration.document.util.Environment;
import mx.com.banco.azteca.migration.document.util.EnvironmentFile;
import mx.com.banco.azteca.migration.document.util.PrintObject;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 * @author Carlos Cuaya Xinto
 */
//this annotation helps to avoid the concurrency of jobs
@DisallowConcurrentExecution
public class MigrationLogic implements Job {
    
    private static final Logger log;
    private static final ConfigFile configFile;
    private static final EnvironmentFile environmentFile;
    
    private static final String auxOriginPath;
    private static final String auxDestinationPath;
    private static final String auxFileName;
    private static final String KB;
    
    private static final int BYTES_PER_KB;
    
    private static int executionNumber;
     
    static {
        log = Logger.getLogger(MigrationLogic.class);
        environmentFile = EnvironmentFile.getEnvironmentFile();
        configFile = ConfigFile.getConfigFile();
        
        if (environmentFile.getEnvironment() == Environment.DEVELOPMENT) {
            auxOriginPath = configFile.getProperty("migration.aux.origin.path");
            auxDestinationPath = configFile.getProperty(
                                            "migration.aux.destination.path");
            auxFileName = configFile.getProperty("migration.aux.dest.file.name");
        }else{
            auxOriginPath = "";
            auxDestinationPath = "";
            auxFileName = "";
        }
        
        
        BYTES_PER_KB = configFile.getIntProperty("migration.bytes.per.kb");
        KB = configFile.getProperty("migration.kb");
        executionNumber = 1;
    }

    @Override
    public void execute(JobExecutionContext jec) throws JobExecutionException {
        log.info("Starting migration job number " +  executionNumber);
        
        File originfile;
        File destFile;
        
        int counter = 1;
        String destinationPath;
        String destinationPathTmp = null;
        long fileSize;
        
        int expimx = -1;
        String account = "";
        int documentTypeId;
        
        Map<String,Integer> documentTypes = DigbbDao.getDocumentTypes();
        PrintObject.printMap("documentTypes", documentTypes);
        
        List<Document> documents = DigwebDao.getDocumentsforMigration();
        log.info("Documents size: " + documents.size());
         
        for (Document document : documents) {
            
            if (environmentFile.getEnvironment() == Environment.DEVELOPMENT) {
                log.debug("auxOriginPath: " + auxOriginPath);
                originfile = new File(auxOriginPath);
            } else {
                log.debug("document.getImagePath(): " + document.getImagePath());
                originfile = new File(document.getImagePath());
            }
            
            
            log.debug("Is origin a file ?: " + originfile.isFile());
            
            if (originfile.isFile()) {
                //calculate file size in KB
                fileSize = originfile.length()/BYTES_PER_KB;
                log.debug("File size: " + fileSize + KB);
                //set the size of the file
                document.setImageSize(String.valueOf(fileSize));
                
                //set document type Id given the document name
                if (documentTypes != null && 
                    documentTypes.get(document.getDocumentName()) != null) {
                    documentTypeId = documentTypes.get(
                                                    document.getDocumentName());
                }
                else {
                    log.debug("Jump because of types null: " + 
                                                    document.getDocumentName());
                    continue;
                } // jump to the next row if there is no types
                
                document.setDocumentTypeId(documentTypeId);

                destinationPathTmp = DigbbDao.saveDocumentAndGettingDestPath(
                                                                    document);
                
                log.debug("Path from DigbbDao: " + destinationPathTmp);
                log.debug("Dest path dev: " + auxDestinationPath + 
                                              counter + auxFileName);
                
                //get destination file path given the environment
                destinationPath = environmentFile.getEnvironment() == 
                                  Environment.DEVELOPMENT ?
                                    auxDestinationPath + counter + auxFileName :
                                    destinationPathTmp;
                
                if (destinationPath == null) {
                    log.debug("Jump because of destinationPath is null");
                    continue;
                }
                
                destFile = new File(destinationPath);
                
                
                try {
                    FileUtils.copyFile(originfile, destFile);
                } catch (IOException ex) {
                    log.error("File copy error: " + ex);
                    log.debug("Jump because of copy error");
                    continue;
                }
                
                log.debug("Document number: " + counter +" -> \n " + document);
                counter ++;
            } else {
                log.debug("There was a error with in the origin file: " + 
                          originfile.getAbsolutePath() );
            }
            //check the row key to update th status
            if ((expimx != document.getExpImx() || 
                !account.equals(document.getAccount())) &&
                destinationPathTmp != null && documentTypes != null) {
                log.debug("Update IMX01 where expimx= " + expimx + 
                          "and account = " + account);
                expimx = document.getExpImx();
                account = document.getAccount();   
                DigwebDao.updateAccountStatus(expimx, account);
                
            }

        }
        log.info("Migration job finished : " + executionNumber);
        executionNumber ++;
    }
}
