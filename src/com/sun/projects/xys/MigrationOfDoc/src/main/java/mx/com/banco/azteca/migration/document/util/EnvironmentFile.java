package mx.com.banco.azteca.migration.document.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * @author Carlos Cuaya Xinto
 */
public class EnvironmentFile {
    
    private static EnvironmentFile environmentFile;
     
    private Properties  properties;
    private Environment environment;
    private String configFilePath;
    
    public static EnvironmentFile getEnvironmentFile(){
        if (environmentFile == null ) environmentFile = new EnvironmentFile();
        
        return environmentFile;
    }
   
    private EnvironmentFile() {
        loadProperties();
    }
    
    private void loadProperties() {
        
        final String ENVIRONMENT_NAME;
        
        String environmentName;
        
        
        configFilePath = "mx/com/banco/azteca/migration/document/config/" +
                         "environment.properties";
        
        properties = new Properties();
        
        InputStream inputStream = getClass().getClassLoader().
                                  getResourceAsStream(configFilePath);
        
        
        try {
            properties.load(inputStream);
            
            ENVIRONMENT_NAME = getProperty("environment");
            
            environmentName = Environment.PRODUCTION.getValue();
            
            if (environmentName.equalsIgnoreCase(ENVIRONMENT_NAME)) {
                environment = Environment.PRODUCTION;
                configFilePath = getProperty("prod.conf.file.path");
            }
            
            environmentName = Environment.TEST.getValue();
            
            if (environmentName.equalsIgnoreCase(ENVIRONMENT_NAME)) {
                environment = Environment.TEST;
                configFilePath = getProperty("test.conf.file.path");
            }
            
            environmentName = Environment.DEVELOPMENT.getValue();
            
            if (environmentName.equalsIgnoreCase(ENVIRONMENT_NAME)) {
                environment = Environment.DEVELOPMENT;
                configFilePath = getProperty("dev.conf.file.path");
                
            }
            
        } catch (IOException ioex) {
            System.out.println("Environment file loading error: " + ioex);
        }
        
    }
    
    public String getProperty(String key){
        return properties.getProperty(key);
    }
    
    public Environment getEnvironment() {
        return this.environment;
    }
    
    public String getConfigFilePath() {
        return this.configFilePath;
    }

}
