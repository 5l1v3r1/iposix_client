package mx.com.banco.azteca.migration.document.db;

import java.sql.Connection;
import java.sql.SQLException;
import mx.com.banco.azteca.migration.document.util.ConfigFile;
import snaq.db.DBPoolDataSource;

/**
 * @author Carlos Cuaya Xinto
 */
public class DBConnection {
    
    private static DBPoolDataSource diggwebds;
    private static DBPoolDataSource digbbds;
    private static final ConfigFile configFile;
    
    static {
        configFile = ConfigFile.getConfigFile();
    }
    
    private static void digwebInit() {
        diggwebds = new DBPoolDataSource();
        diggwebds.setName(configFile.getProperty("digweb.pooldsname"));
        diggwebds.setDescription(configFile.getProperty("digweb.description"));
        diggwebds.setDriverClassName(configFile.getProperty("digweb.driver"));
        diggwebds.setUrl(configFile.getProperty("digweb.url"));
        diggwebds.setUser(configFile.getProperty("digweb.user"));
        diggwebds.setPassword(configFile.getProperty("digweb.password"));
        diggwebds.setMinPool(configFile.getIntProperty("digweb.minpool"));
        diggwebds.setMaxPool(configFile.getIntProperty("digweb.maxpool"));
        diggwebds.setMaxSize(configFile.getIntProperty("digweb.maxpool"));
        //seconds
        diggwebds.setIdleTimeout(
                            configFile.getIntProperty("digweb.idletimeout"));
        diggwebds.setValidationQuery(
                            configFile.getProperty("digweb.validationquery"));
    }
    
    private static void digbbInit() {
        digbbds = new DBPoolDataSource();
        digbbds.setName(configFile.getProperty("digbb.pooldsname"));
        digbbds.setDescription(configFile.getProperty("digbb.description"));
        digbbds.setDriverClassName(configFile.getProperty("digbb.driver"));
        digbbds.setUrl(configFile.getProperty("digbb.url"));
        digbbds.setUser(configFile.getProperty("digbb.user"));
        digbbds.setPassword(configFile.getProperty("digbb.password"));
        digbbds.setMinPool(configFile.getIntProperty("digbb.minpool"));
        digbbds.setMaxPool(configFile.getIntProperty("digbb.maxpool"));
        digbbds.setMaxSize(configFile.getIntProperty("digbb.maxpool"));
        //  seconds.
        digbbds.setIdleTimeout(configFile.getIntProperty("digbb.idletimeout"));  
        digbbds.setValidationQuery(
                            configFile.getProperty("digbb.validationquery"));
        
    } 
     
    public static Connection getDigWebConection() throws SQLException {
        if(diggwebds == null) digwebInit();
        
        return diggwebds.getConnection();
    }
    
    public static Connection getDigBBConection() throws SQLException {
        if(digbbds == null) digbbInit();
        
        return digbbds.getConnection();
    }

}
