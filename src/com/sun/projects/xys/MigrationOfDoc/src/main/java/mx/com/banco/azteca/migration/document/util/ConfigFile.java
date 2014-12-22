package mx.com.banco.azteca.migration.document.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.apache.log4j.Logger;

/**.
 * @author Carlos Cuaya Xinto
 */
public class ConfigFile {
    
    private static final Logger log;
    private static final EnvironmentFile environmentFile;
    
    private static ConfigFile configFile;
    
    private Properties properties;
    
    static {       
        log = Logger.getLogger(ConfigFile.class);
        environmentFile = EnvironmentFile.getEnvironmentFile();
        
    }
    
    public static ConfigFile getConfigFile(){
        if (configFile == null ) configFile = new ConfigFile();
        
        return configFile;
    }
   
    private ConfigFile() {
        loadProperties();
    }
    
    private void loadProperties() {
        log.info("ENVIRONMENT: " + environmentFile.getEnvironment());
        
        String configFilePath = environmentFile.getConfigFilePath();
        log.debug("configFilePath: " + configFilePath);
        
        properties = new Properties();
        
        InputStream inputStream = getClass().getClassLoader().
                                  getResourceAsStream(configFilePath);
        
        
        try {
            properties.load(inputStream);
            
        } catch (IOException ioex) {
            log.error("configuration file loading error: " + ioex);
        }
        
    }
    
    public String getProperty(String key){
        return properties.getProperty(key);
    }
    
    public int getIntProperty(String key){
         int value = 0;
         try {
             value = Integer.parseInt(properties.getProperty(key));
         } catch (NumberFormatException e) {
             log.error("Cast string to integer error:" + e);
         }
         
        return value;
    }
    
}
