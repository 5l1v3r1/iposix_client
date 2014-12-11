package mx.com.banco.azteca.digitalizacion.dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import mx.com.banco.azteca.digitalizacion.util.Log;

public class ConexionBD {

    private static DataSource ds = null;
    private static String vlStrNombrePool = "";
    private static String vlstrNombreAplicacion = "";
    private static boolean vlblActivarTrace = false;

    /**
     *
     * @param vlstrNombreAplicacion
     */
    public void setNombreAplicacion(String vlstrNombreAplicacion) {
        ConexionBD.vlstrNombreAplicacion = vlstrNombreAplicacion;
    }

    /**
     *
     * @param vlblActivarTrace
     * Activar trace
     */
    public void setActivarTrace(boolean vlblActivarTrace) {
        ConexionBD.vlblActivarTrace = vlblActivarTrace;
    }

    /**
     *
     * @param vlStrNombrePool
     * Nombre del pool de conexiones a utilizar
     */
    public void setNombrePool(String vlStrNombrePool) {
        ConexionBD.vlStrNombrePool = vlStrNombrePool;
    }

    public String getEsquema() {
        return "IMAX";
    }

    public static synchronized Connection ConectaBD() throws SQLException, Exception {

        Log ErrorLog = new Log();

        try {


            if (vlblActivarTrace) {
                System.out.println("==================================================================");
                System.out.println("Aplicacion >>>>>>>> " + vlstrNombreAplicacion);
                System.out.println("Pool       >>>>>>>> " + vlStrNombrePool);
                System.out.println("==================================================================");
            }
            Context initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:/comp/env");

            if (vlblActivarTrace) {
                System.out.println("==================================================================");
                System.out.println("verificamos el valor del DataSource ds antes del if " + ds);
            }

            if (ds == null) {
                ds = (DataSource)envCtx.lookup("jdbc/" + vlStrNombrePool);
            }

            if (vlblActivarTrace) {
                System.out.println("==================================================================");
                System.out.println("verificamos el valor del DataSource ds despues del if " + ds);
            }

        } catch (Exception e) {
            ErrorLog.grabaLog(vlstrNombreAplicacion, "ConexionBD.ConectaBD", e);
        }
        
        return ds.getConnection();
    }
}
