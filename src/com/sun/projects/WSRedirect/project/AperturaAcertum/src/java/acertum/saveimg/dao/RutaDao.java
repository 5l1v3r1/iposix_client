package acertum.saveimg.dao;

import acertum.conexion.DataSource;
import acertum.saveimg.dto.InsTresTablasDto;
import acertum.saveimg.dto.PaginaDto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.sql.Statement;
import oracle.jdbc.OracleTypes;
import org.apache.log4j.Logger;

public class RutaDao {
        final static Logger log = Logger.getLogger(RutaDao.class);
	public String insertarRegistro(PaginaDto datos)throws Exception{
		String codigo ="Ruta obtenida correctamente";
                CallableStatement cs = null;
		Connection conn = null;
                Statement statement = null;
                ResultSet rs = null;
        
        try {
            conn = DataSource.getInstance().getConnection();
            statement = conn.createStatement();
            cs = conn.prepareCall("call DIGBB.PQDG_DOCUMENTOS.PADG_INS_PAGINA(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, datos.getIdProducto());
            cs.setInt(2, datos.getIdGabinete());
            cs.setInt(3, datos.getIdTipoDocto());
            cs.setString(4, datos.getWorkstation());
            cs.setString(5, datos.getUsuario());
            cs.setInt(6, datos.getIdPaisCU());
            cs.setInt(7, datos.getIdCanalCU());
            cs.setInt(8, datos.getIdSucursalCU());
            cs.setInt(9, datos.getFolioCU());
            cs.setString(10, datos.getFechaAlta());
            cs.setString(11, datos.getTamImagen());
            cs.registerOutParameter(12, OracleTypes.VARCHAR);
            cs.registerOutParameter(13, OracleTypes.VARCHAR);
            cs.registerOutParameter(14, OracleTypes.INTEGER);
            cs.execute();            
            datos.setRuta(cs.getString(12));
            datos.setRutaNom(cs.getString(13));
            datos.setCorrecto(cs.getInt(14));
           
        }catch(SQLException e){
        	e.printStackTrace();
        	codigo = "Error en la consulta" + e;
        }finally{
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return codigo;
	}
	
	public String insertarRegistroTresTablas(InsTresTablasDto ittdatos)throws Exception{
		String codigo =  "";
		CallableStatement cs = null;
		Connection conn = null;
                Statement statement = null;
                ResultSet rs = null;
        
        try {
             log.info("\n################################################\n"
                      +"# DIGBB.PQDG_DOCUMENTOS.PADG_ALMACENA_DOCUMENTO #\n"
                      +"#################################################");
            conn = DataSource.getInstance().getConnection();
            statement = conn.createStatement();
            cs = conn.prepareCall("call DIGBB.PQDG_DOCUMENTOS.PADG_ALMACENA_DOCUMENTO(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setInt(1, ittdatos.getIdPais());
            cs.setInt(2, ittdatos.getIdCanal());
            cs.setInt(3, ittdatos.getIdSucursal());
            cs.setInt(4, ittdatos.getIdFolio());
            cs.setString(5, ittdatos.getNombre());
            cs.setString(6, ittdatos.getaPaterno());
            cs.setString(7, ittdatos.getaMaterno());
            cs.setInt(8, ittdatos.getIdTipoProd());
            cs.setInt(9, ittdatos.getIdTipoDocto());
            cs.setString(10, ittdatos.getWorkstation());
            cs.setInt(11, ittdatos.getIdCanalDig());
            cs.setInt(12, ittdatos.getIdSucursalDig());
            cs.setString(13, ittdatos.getUsuario());
            //cs.setString(14, ittdatos.getCorreo());
            cs.setString(14, ittdatos.getTamImagen());
            //cs.setString(16, ittdatos.getCuentaAhorro());
            cs.registerOutParameter(15, OracleTypes.VARCHAR);
            log.info("ejecutando query...");
            cs.executeQuery();
            log.info("query ejecutada");
            ittdatos.setRuta(cs.getString(15));
            log.info("ruta: " + cs.getString(15) );
            if(cs.getString(15) != null ){
                codigo = "Insercion a DB correcta";
                log.info("Insercion a DB correcta");
            }else{
                codigo = "No se pudo hacer la insercion, falta de parametros, ruta de documento no generada";
                log.error("No se pudo hacer la insercion, falta de parametros, ruta de documento no generada");
            }
        }catch(SQLException e){
            codigo = "SQL Exception al insertar en PQDG_DOCUMENTOS.PADG_ALMACENA_DOCUMENTO [ " + e+" ]";
            log.error("Exception SQL: " + e);
        	
        }finally{
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return codigo;
	}
	
}
