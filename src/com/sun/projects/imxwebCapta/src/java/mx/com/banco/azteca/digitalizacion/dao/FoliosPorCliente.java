package mx.com.banco.azteca.digitalizacion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import mx.com.banco.azteca.digitalizacion.util.Log;
import mx.com.banco.azteca.digitalizacion.util.TiempoEjecucion;

public class FoliosPorCliente {

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

    public ArrayList<String[]> getFoliosPorCliente(String clienteUnico) throws SQLException {
        System.out.println("Entro al getFoliosPorCliente*******************");
        CallableStatement cs = null;
        ResultSet rs = null;
        ArrayList<String[]> arrResultado = new ArrayList<String[]>();

        try {

            //cs = conDB.prepareCall("{? = call " + vlstrEsquema + ".PQDGIMAXVISOR.FNDGCREDCABEZERO('160851006189')}");
            //cs = conDB.prepareCall("{? = call " + vlstrEsquema + ".PQDGIMAXVISOR.FNDGCREDCABEZERO(?)}");
            cs = conDB.prepareCall("{? = call " + vlstrEsquema + ".PQDGIMAXCASAEMPVISOR.FNDGCASAEMPGETFOLIOS(?)}");
            cs.registerOutParameter(1, -10);
            cs.setString(2, clienteUnico);
            //cs.setString(2, "1-3-8992-12421");

            if (vlblActivaTrace) {
                timeEjecuta.setNombreStored(vlstrEsquema + ".PQDGIMAXCASAEMPVISOR.FNDGCASAEMPCABEZERO");
                timeEjecuta.setInicio(Calendar.getInstance());
            }

            if (cs.execute()) {
                rs = cs.getResultSet();
            } else {
                rs = (ResultSet) cs.getObject(1);
            }

            while (rs.next()) {
                System.out.println("****" + rs.getString(1).trim() + " | " + rs.getString(2).trim() + " | " + rs.getString(3).trim() + " | " + rs.getString(4).trim());
                String[] strRegistro = new String[5];
                strRegistro[0] = rs.getString(1).trim();//llave
                strRegistro[1] = rs.getString(2).trim();//cliente unico
                strRegistro[2] = rs.getString(3).trim();//folio
                strRegistro[3] = rs.getString(4).trim();//nombre
                //strRegistro[4] = rs.getString(5).trim();//folio con identificacion oficial o identificacion oficial del cliente
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

        return arrResultado;
    }
}
