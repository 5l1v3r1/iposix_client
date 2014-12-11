package acertum.aclaraciones.conexion;



import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.dbcp.BasicDataSource;
import props.Propiedades;

public class DataSource {

    private static DataSource datasource;
    private BasicDataSource ds;

    private DataSource() throws IOException, SQLException, PropertyVetoException, Exception {
        ds = new BasicDataSource();
        ds.setDriverClassName(Propiedades.getProp("driver"));
        ds.setUsername(Propiedades.getProp("user"));
        ds.setPassword(Propiedades.getProp("password"));
        //ds.setUrl("jdbc:oracle:thin:@10.51.230.96:1521/DIGBDRHDES");
        ds.setUrl(Propiedades.getProp("url"));
     // the settings below are optional -- dbcp can work with defaults
        ds.setMinIdle(1);
        ds.setMaxIdle(5);
        ds.setMaxOpenPreparedStatements(10);

    }

    public static DataSource getInstance() throws IOException, SQLException, PropertyVetoException{
        if (datasource == null) {
            try {
                datasource = new DataSource();
            } catch (Exception ex) {
                Logger.getLogger(DataSource.class.getName()).log(Level.SEVERE, null, ex);
            }
            return datasource;
        } else {
            return datasource;
        }
    }

    public Connection getConnection() throws SQLException {
        return this.ds.getConnection();
    }

}