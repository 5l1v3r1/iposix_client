package acertum.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.apache.log4j.Logger;

public class Conexion {
    final static Logger log = Logger.getLogger(Conexion.class);
    public Connection conexion;
    String cadSql = "";
    
    
    
    public Connection crearConexion() throws SQLException {
        if (conexion == null) {
            try {
                DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
                cadSql = "jdbc:oracle:thin:@10.51.230.96:1521/DIGBDRHDES";
                conexion = DriverManager.getConnection(cadSql,"MIKE","MIKE");
                log.info("Conexion a BD Digitalizacion Creada");
                log.info("Cadena de Conexion : " + cadSql);
            } catch (SQLException sqlException) {
                log.error("Error en la conexion a la DB: " + sqlException.toString());
            }
        }
        return conexion;
    }
    
    public void cerrarConexion() {
        try {
            conexion.close();
            conexion = null;
            log.info("Conexion Oracle cerrada!!");
        } catch (SQLException e) {
            e.printStackTrace();
            log.error("Error al cerrar la conexion!!" + e.toString());
        }
    }
    
    
	
}
