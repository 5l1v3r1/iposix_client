package acertum.inserciones.dao;

import acertum.conexion.DataSource;
import acertum.inserciones.dto.AcertumDto;

import acertum.inserciones.dto.DocumentoDto;
import acertum.inserciones.dto.ExpedienteComunDto;
import acertum.inserciones.dto.RegIdCorreoDto;
import acertum.inserciones.dto.RetDocumentoDto;
import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleTypes;

public class InsercionesDao {

    Logger log = Logger.getLogger("InsercionesDao.class");

    public InsercionesDao() {
    }
    //Inserta en la tabla Expediente �nico.

    public int insertaExpedienteComun(ExpedienteComunDto dto) throws Exception {
        CallableStatement cs = null;
        Connection conn = null;
        Statement statement = null;
        try {
            conn = DataSource.getInstance().getConnection();
            statement = conn.createStatement();
            cs = conn.prepareCall("{ call DIGBB.PQDG_DOCUMENTOS.PADG_INS_EXPCOMUN(?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt(1, dto.getIdPais());
            cs.setInt(2, dto.getIdCanal());
            cs.setInt(3, dto.getIdSucursal());
            cs.setInt(4, dto.getFolio());
            cs.setString(5, dto.getNombre());
            cs.setString(6, dto.getaPaterno());
            cs.setString(7, dto.getaMaterno());
            cs.setInt(8, dto.getIdCanalDig());
            cs.setInt(9, dto.getIdSucursalDig());
            cs.registerOutParameter(10, OracleTypes.INTEGER);
            cs.registerOutParameter(11, OracleTypes.DATE);
            cs.registerOutParameter(12, OracleTypes.INTEGER);
            cs.execute();
            dto.setIdGabinete(cs.getInt(10));
            dto.setFechaAlta(cs.getDate(11).toString());
            dto.setCorrecto(cs.getInt(12)); //1 si se realizo la operaci�n de manera satisfactoria y 0 si no se pudo completar la operaci�n.

        } catch (SQLException e) {
            log.info("Error getGabineteExpComun ");
            return 0;
        } finally {
            //if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return dto.getCorrecto();
    }

    //se necesitara para rellenar un campo del siguiente Stored Procedure (SP)
    public int regresaIdCorreo(RegIdCorreoDto ricdto) throws Exception {
        CallableStatement cs = null;
        Connection conn = null;
        Statement statement = null;
        ResultSet rs = null;
        try {
            conn = DataSource.getInstance().getConnection();
            statement = conn.createStatement();
            cs = conn.prepareCall("{ DIGBB.PQDG_VALIDACIONES.PQDG_VALIDACIONES(?,?)}");
            cs.setInt(1, ricdto.getIdCorreo());
            cs.registerOutParameter(2, OracleTypes.INTEGER);
            cs.execute();
            ricdto.setIdProducto(cs.getInt(2));

        } catch (SQLException e) {
            log.info("Error SQL getIdCorreo ");

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return ricdto.getIdProducto();
    }

    //Inserta en la tabla Acertum
    public int insertaAcertum(AcertumDto adto) throws Exception {
        CallableStatement cs = null;
        Connection conn = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            conn = DataSource.getInstance().getConnection();
            statement = conn.createStatement();
            cs = conn.prepareCall("{ call DIGBB.PQDG_DOCUMENTOS01.PADG_INS_ACERTUM(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt(1, adto.getIdGabinete());
            cs.setInt(2, adto.getIdPais());
            cs.setInt(3, adto.getIdCanal());
            cs.setInt(4, adto.getIdSucursal());
            cs.setInt(5, adto.getFolio());
            cs.setInt(6, adto.getCanalDig());
            cs.setInt(7, adto.getIdSucursalDig());
            cs.setInt(8, adto.getIdCorreo());
            cs.setString(9, adto.getCuentaAhorro());
            cs.setString(10, adto.getCorreo());
            cs.registerOutParameter(11, OracleTypes.INTEGER);
            cs.execute();
            adto.setCorrecto(cs.getInt(11));
        } catch (SQLException e) {
            log.info("Error SQL InsertaAcertum ");

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return adto.getCorrecto();
    }

    //Inserta en la tabla de DOCUMENTO.
    public int insertaDocumento(DocumentoDto ddto) throws Exception {
        CallableStatement cs = null;
        Connection conn = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            conn = DataSource.getInstance().getConnection();
            statement = conn.createStatement();
            cs = conn.prepareCall("{ call DIGBB.PQDG_DOCUMENTOS01.PADG_INS_DOCUMENTO(?,?,?,?)}");
            cs.setInt(1, ddto.getIdProducto());
            cs.setInt(2, ddto.getIdGabinete());
            cs.setInt(3, ddto.getIdTipoProducto());
            cs.registerOutParameter(4, OracleTypes.INTEGER);
            cs.execute();
            ddto.setCorrecto(cs.getInt(4));
        } catch (SQLException e) {
            log.info("Error SQL Documento ");

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }
        return ddto.getCorrecto();
    }

    //Indica que documentos ya se tienen digitalizados por cliente unico
    public List<List<Object>> RetDocumento(RetDocumentoDto rddto) {
        CallableStatement cs = null;
        Connection conn = null;
        Statement statement = null;
        //conexion = new Conexion();
        ResultSet rs = null;
        List<Object> obj1 = null;
        List<List<Object>> obj2 = null;
        try {
            log.info("\n###########################################\n"
                      +"# DIGBB.PQDG_CONSULTAS.PADG_RET_DOCUMENTO #\n"
                      +"###########################################");
            conn = DataSource.getInstance().getConnection();
            statement = conn.createStatement();
            cs = conn.prepareCall("call DIGBB.PQDG_CONSULTAS.PADG_RET_DOCUMENTO(?,?,?,?,?,?,?,?)");
            cs.setInt(1, rddto.getIdProducto());
            cs.setString(2, rddto.getValor1());
            cs.setString(3, rddto.getValor2());
            cs.setString(4, rddto.getValor3());
            cs.setString(5, rddto.getValor4());
            cs.setString(6, rddto.getValor5());
            cs.setString(7, rddto.getValor6());
            cs.registerOutParameter(8, OracleTypes.CURSOR);
            log.info("Ejecutando query...");
            cs.executeQuery();
            log.info("callable statement: "+cs.toString());
            obj2 = new ArrayList<List<Object>>();
            if (cs.getObject(8) != null) { //>0
                rs = (ResultSet) cs.getObject(8);
                log.info("resultset");
                while (rs.next()) {
                    obj1 = new ArrayList<Object>();
                    obj1.add(rs.getInt(("FIID_TIPO_DOCTO")));
                    obj1.add(rs.getString(("FCNOMBRE")));
                    obj1.add(rs.getString(("FCNOMBREPAGINA")));
                    obj1.add(rs.getString("FCRUTA"));
                    obj2.add(obj1);
                }
            }else{
                log.info("Callable Statement vacio.");
            }
        } catch (IOException ex) {
            Logger.getLogger(InsercionesDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (PropertyVetoException ex) {
            Logger.getLogger(InsercionesDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException npe) {
            log.info("Nullpointer Exception" + npe);
        } catch (SQLException e) {
            log.info("Error SQL RetDocumento " + e);

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }
        log.info("Consutando por documentos digitalizados de cliente unico:" + rddto.getClienteUnico());
        return obj2;
    }
}
