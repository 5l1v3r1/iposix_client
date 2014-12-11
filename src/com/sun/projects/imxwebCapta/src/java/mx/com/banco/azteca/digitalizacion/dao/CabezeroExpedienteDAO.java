package mx.com.banco.azteca.digitalizacion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import mx.com.banco.azteca.digitalizacion.util.Log;
import mx.com.banco.azteca.digitalizacion.util.TiempoEjecucion;

public class CabezeroExpedienteDAO {

    private TiempoEjecucion timeEjecuta = new TiempoEjecucion();
    private Log ErrLog = new Log();
    private Connection conDB = null;
    private boolean vlblActivaTrace = false;
    private String vlstrEsquema = "";

    /**
     *
     * @param Conexion de base de datos
     */
    public void setDBOrigen(Connection conDB) {
        this.conDB = conDB;
    }

    /**
     *
     * @param Activa Trace
     */
    public void setVlblActivaTrace(boolean vlblActivaTrace) {
        this.vlblActivaTrace = vlblActivaTrace;
    }

    /**
     *
     * @param Esquema de base de datos
     */
    public void setEsquema(String vlstrEsquema) {
        this.vlstrEsquema = vlstrEsquema;
    }

    public ArrayList<String[]> getCabezeroExpedienteCredito(String llave) throws SQLException {
        System.out.println("Entro al getCabezeroo*******************");
        CallableStatement cs = null;
        ResultSet rs = null;
        String fecha = "";
        ArrayList<String[]> arrResultado = new ArrayList<String[]>();

        try {

            //cs = conDB.prepareCall("{? = call " + vlstrEsquema + ".PQDGIMAXVISOR.FNDGCREDCABEZERO('160851006189')}");
            //cs = conDB.prepareCall("{? = call " + vlstrEsquema + ".PQDGIMAXVISOR.FNDGCREDCABEZERO(?)}");
            System.out.println("prepareCall: " + "{? = call " + vlstrEsquema + ".PQDGIMAXVISOR.FNDGCAPTACABEZERO(?)}");
             System.out.println("llave " + llave);
            cs = conDB.prepareCall("{? = call " + vlstrEsquema + ".PQDGIMAXVISOR.FNDGCAPTACABEZERO(?)}");
            cs.registerOutParameter(1, -10);
            cs.setString(2, llave);
            //cs.setString(2, "1-2-6677-20283");

            if (vlblActivaTrace) {
                timeEjecuta.setNombreStored(vlstrEsquema + ".PQDGIMAXVISOR.FNDGCAPTACABEZERO");
                timeEjecuta.setInicio(Calendar.getInstance());
            }

            if (cs.execute()) {
                rs = cs.getResultSet();
            } else {
                rs = (ResultSet) cs.getObject(1);
            }
            
            //ResultSetMetaData rsmd = rs.getMetaData();
            //int columnCount = rsmd.getColumnCount();
            // The column count starts from 1
            /*
            for (int i = 1; i < columnCount + 1; i++ ) {
              String name = rsmd.getColumnName(i);
              System.out.println("column name " + name );
            }*/

            while (rs.next()) {
                System.out.println("****" + rs.getString(1).trim() + " | " + rs.getString(2).trim() + " | " + rs.getString(3).trim() + " | " + rs.getString(4).trim());
                String[] strRegistro = new String[5];
                strRegistro[0] = rs.getString(1).trim();//llave
                strRegistro[1] = rs.getString(2).trim();//cliente unico
                fecha = rs.getString(3).trim();
                if (fecha.length() > 12)
                  strRegistro[2] = (fecha.substring(0, 4) + "-" + fecha.substring(4, 6) + "-" + fecha.substring(6, 8));
                else {
                  strRegistro[2] = ("20" + fecha.substring(0, 2) + "-" + fecha.substring(2, 4) + "-" + fecha.substring(4, 6));
                }
                strRegistro[3] = rs.getString(4).trim();//nombre
                strRegistro[4] = rs.getString(5).trim();//ID_GABINETE
                arrResultado.add(strRegistro);
            }

            if (vlblActivaTrace) {
                timeEjecuta.setFin(Calendar.getInstance());
                System.out.println(timeEjecuta.strMideTiempo());
            }

        } catch (Exception e) {            
            ErrLog.grabaLog("imxwebCredito", "CabezeroExpedienteDAO.getCabezeroExpedienteCredito", e);

        } finally {
            try {

                if (cs != null) {
                    cs.close();
                    cs = null;
                }

                if (rs != null) {
                    rs.close();
                    rs = null;
                }

            } catch (SQLException e) {
                ErrLog.grabaLog("imxwebCredito", "CabezeroExpedienteDAO.getCabezeroExpedienteCredito finally SQLException", e);
            }
        }
        System.out.println("arrResultado size : " + arrResultado.size());
        return arrResultado;
    }
}
