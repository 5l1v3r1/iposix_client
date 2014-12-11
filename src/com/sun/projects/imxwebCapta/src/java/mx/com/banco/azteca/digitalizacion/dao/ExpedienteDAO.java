package mx.com.banco.azteca.digitalizacion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import mx.com.banco.azteca.digitalizacion.util.Log;
import mx.com.banco.azteca.digitalizacion.util.TiempoEjecucion;

public class ExpedienteDAO {

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

    public ArrayList<String[]> getExpediente(String strProducto, String intIdGabinete, int intStatusDoc, int intStatusPag, String strServidorHttp) throws SQLException {

        CallableStatement cs = null;
        ResultSet rs = null;

        ArrayList<String[]> ArrResultado = new ArrayList<String[]>();

        int i = 0;

        try {

            cs = conDB.prepareCall("{? = call " + vlstrEsquema + ".PQDGIMAXVISOR.FNDGCREDPAGDOCTOS(?,?,?,?,?)}");
            cs.registerOutParameter(1, -10);
            cs.setString(2, strProducto);
            cs.setString(3, intIdGabinete);
            cs.setInt(4, intStatusDoc);
            cs.setInt(5, intStatusPag);
            cs.setString(6, strServidorHttp);

            if (vlblActivaTrace) {
                timeEjecuta.setNombreStored(vlstrEsquema + ".PQDGIMAXVISOR.FNDGCREDPAGDOCTOS");
                timeEjecuta.setInicio(Calendar.getInstance());
            }

            if (cs.execute()) {
                rs = cs.getResultSet();
            } else {
                rs = (ResultSet) cs.getObject(1);
            }

            while (rs.next()) {

                String[] strRegistro = new String[4];//4 es el numero de columnas que regresa la funcion FNDGCREDPAGDOCTOS

                if (!rs.getString("NOMBRE_DOCUMENTO").trim().contains("ERROR")) {

                    for (i = 0; i < 4; i++) {
                        strRegistro[i] = rs.getString(i + 1) != null ? rs.getString(i + 1).trim() : "";
                    }

                } else {

                    strRegistro[0] = "-1000";
                    strRegistro[1] = rs.getString("NOMBRE_DOCUMENTO").trim();
                    System.out.println("ExpedienteDAO.getExpediente Oracle Exception:"
                            + strProducto + " " + intIdGabinete + " " + rs.getString("PRODUCTO").trim());
                    System.out.println("ExpedienteDAO.getExpediente Oracle Exception:"
                            + "SELECT " + vlstrEsquema + ".PQDGIMAXVISOR.FNDGCREDPAGDOCTOS ('" + strProducto + "'," + intIdGabinete + "," + intStatusDoc + "," + intStatusPag + ",'" + strServidorHttp + "') FROM DUAL;");

                    ErrLog.grabaLog("ExpedienteDAO", "getExpediente Oracle Exception",
                            strProducto + " " + intIdGabinete + " " + rs.getString("PRODUCTO").trim());
                    ErrLog.grabaLog("ExpedienteDAO", "getExpediente Oracle Exception",
                            "SELECT " + vlstrEsquema + ".PQDGIMAXVISOR.FNDGCREDPAGDOCTOS ('" + strProducto + "'," + intIdGabinete + "," + intStatusDoc + "," + intStatusPag + ",'" + strServidorHttp + "') FROM DUAL;");

                }

                ArrResultado.add(strRegistro);
                strRegistro = null;
            }

            if (vlblActivaTrace) {
                timeEjecuta.setFin(Calendar.getInstance());
                System.out.println(timeEjecuta.strMideTiempo());
            }

        } catch (Exception e) {
            e.printStackTrace();
            ErrLog.grabaLog("imxwebCredito", "ExpedienteDAO.getExpediente", e);

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
                ErrLog.grabaLog("imxwebCredito", "ExpedienteDAO.getExpediente finally SQLException", e);
            }
        }

        return ArrResultado;
    }

    
    
    public ArrayList<String[]> getExpedienteUnico(String clienteUnico,String ip) throws SQLException {
        CallableStatement cs = null;
        ResultSet rs = null;
        
        String [] clParse = clienteUnico.split("\\-");
        
        ArrayList<String[]> ArrResultado = new ArrayList<String[]>();
        int i = 0;
        try {
            cs = conDB.prepareCall("{? = call " + vlstrEsquema + ".PQDGINDEXAEXPU.FNDGETIMAGENES(?,?,?,?,?,?,?)}");
            cs.registerOutParameter(1, -10);
            cs.setInt(2, Integer.parseInt(clParse[0]));
            cs.setInt(3, Integer.parseInt(clParse[1]));
            cs.setInt(4, Integer.parseInt(clParse[2]));
            cs.setInt(5, Integer.parseInt(clParse[3]));
            cs.setString(6, "EXPEDIENTEUNICO");
            cs.setInt(7, 1);
            cs.setString(8, ip);

            if (vlblActivaTrace) {
                timeEjecuta.setNombreStored(vlstrEsquema + ".PQDGINDEXAEXPU.FNDGETIMAGENES");
                timeEjecuta.setInicio(Calendar.getInstance());
            }

            if (cs.execute()) {
                rs = cs.getResultSet();
            } else {
                rs = (ResultSet) cs.getObject(1);
            }

            while (rs.next()) {

                String[] strRegistro = new String[4];//4 es el numero de columnas que regresa la funcion FNDGCREDPAGDOCTOS

                if (!rs.getString("FCNOMBREDOCTO").trim().contains("ERROR")) {
                    for (i = 0; i < 4; i++) {
                        strRegistro[i] = rs.getString(i + 1) != null ? rs.getString(i + 1).trim() : "";
                    }
                }
                ArrResultado.add(strRegistro);
                strRegistro = null;
            }
            if (vlblActivaTrace) {
                timeEjecuta.setFin(Calendar.getInstance());
                System.out.println(timeEjecuta.strMideTiempo());
            }
        } catch (Exception e) {
            e.printStackTrace();
            ErrLog.grabaLog("imxwebCredito", "ExpedienteDAO.getExpedienteUnico", e);
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
                ErrLog.grabaLog("imxwebCredito", "ExpedienteDAO.getExpedienteUnico finally SQLException", e);
            }
        }
        return ArrResultado;
    }
    
    public List<Object[]> getDataFromDigBB(String savingAccount,
                                           Connection digbbConnection ) 
                                                         throws SQLException {
        CallableStatement cs = null;
        ResultSet rs         = null;
      //  String []clientValues     = uniqueClient.split("-");
        
     //   System.out.println("client values: " + Arrays.toString(clientValues));
        
        List<Object[]> data  = new ArrayList<Object[]>();
       
        
        try {
            cs = digbbConnection.prepareCall("{call DIGBB.PQDG_CONSULTAS.PADG_RET_DOCUMENTO(?,?,?,?,?,?,?,?,?,?)}");
            
            cs.setNull(1, Types.INTEGER);
            cs.setString(2, savingAccount);
            cs.setString(3, "");
            cs.setString(4, "");
            cs.setString(5, "");
            cs.setString(6, "" ); 
            cs.setString(7, "");
            cs.setInt(8, 1);
            cs.setString(9,"DIGBB" );
            cs.registerOutParameter(10, -10);

            if (vlblActivaTrace) {
                timeEjecuta.setNombreStored("DIGBB.PQDG_CONSULTAS.PADG_RET_DOCUMENTO");
                timeEjecuta.setInicio(Calendar.getInstance());
            }

            if (cs.execute()) {
                rs = cs.getResultSet();
            } else {
                rs = (ResultSet) cs.getObject(10);
            }
            
            String[] strRegistro;
            while (rs.next()) {

                strRegistro = new String[8];

                for (int i = 0; i < 8; i++) {
                    strRegistro[i] = rs.getString(i + 1) != null ? 
                                     rs.getString(i + 1).trim() : "";
                }

                data.add(strRegistro);
            }
            if (vlblActivaTrace) {
                timeEjecuta.setFin(Calendar.getInstance());
                System.out.println(timeEjecuta.strMideTiempo());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            ErrLog.grabaLog("imxwebCredito", "ExpedienteDAO.getExpedienteUnico", e);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            ErrLog.grabaLog("imxwebCredito", "ExpedienteDAO.getExpedienteUnico", e);
        } finally {
            try {
                 if (rs != null) rs.close();
                
                if (cs != null)  cs.close();
                
                if ( digbbConnection != null) digbbConnection.close();
            } catch (SQLException e) {
                ErrLog.grabaLog("imxwebCredito", "ExpedienteDAO.getExpedienteUnico finally SQLException", e);
            }
        }
        
        for(Object[] row : data){
            System.out.println("row : " + Arrays.toString(row));
        }
        
        return data;
    }
    
}
