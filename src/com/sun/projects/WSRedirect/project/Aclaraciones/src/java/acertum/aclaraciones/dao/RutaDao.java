package acertum.aclaraciones.dao;

import acertum.aclaraciones.conexion.DataSource;
import acertum.aclaraciones.dto.AclaracionesDto;
import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.sql.Statement;
import oracle.jdbc.OracleTypes;
import org.apache.log4j.Logger;

public class RutaDao {
        final static Logger log = Logger.getLogger(RutaDao.class);

	public String PqdgAclaracion(AclaracionesDto aclEntradas) throws PropertyVetoException, SQLException, IOException {
		String codigo =  "";
		CallableStatement cs = null;
		Connection conn = null;
                Statement statement = null;
                ResultSet rs = null;
                    log.info("\npreparando paquete: DIGBB.PQDG_ACLARACION.PADG_ALMACENA_ACLARACION\n ------------------datos a insertar:");
                    log.info("Folio Aclaracion: "+aclEntradas.getIdFolioAclaracion());
                    log.info("cliente aclaracion:"+aclEntradas.getIdCteAclaracion());
                    log.info("pais "+aclEntradas.getIdPais());
                    log.info("canal "+aclEntradas.getIdCanal());
                    log.info("sucursal "+aclEntradas.getIdSucursal());
                    log.info("folio "+aclEntradas.getIdFolio());
                    log.info("nombre "+aclEntradas.getNombre());
                    log.info("paterno "+aclEntradas.getaPaterno());
                    log.info("materno "+aclEntradas.getaMaterno());
                    log.info("canaldig "+aclEntradas.getIdCanalDig());
                    log.info("suc dig "+aclEntradas.getIdSucursalDig());
                    log.info("cuenta ahorro "+aclEntradas.getCuentaAhorro());
                    log.info("idproducto "+aclEntradas.getIdTipoProd());
                    log.info("tipo documento "+aclEntradas.getIdTipoDocto());
                    log.info("workstation"+aclEntradas.getWorkstation());
                    log.info("usuario: "+aclEntradas.getUsuario());
                    //log.info("ruta "+aclEntradas.getRuta());
        try {
            conn = DataSource.getInstance().getConnection();
            statement = conn.createStatement();

            cs = conn.prepareCall("call DIGBB.PQDG_ACLARACION.PADG_ALMACENA_ACLARACION(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            cs.setString(1, aclEntradas.getIdFolioAclaracion());
            cs.setString(2, aclEntradas.getIdCteAclaracion());

            cs.setInt(3, aclEntradas.getIdPais());
            cs.setInt(4, aclEntradas.getIdCanal());
            cs.setInt(5, aclEntradas.getIdSucursal());
            cs.setInt(6, aclEntradas.getIdFolio());
            cs.setString(7, aclEntradas.getNombre());
            cs.setString(8, aclEntradas.getaPaterno());
            cs.setString(9, aclEntradas.getaMaterno());
            cs.setInt(10, aclEntradas.getIdCanalDig());
            cs.setInt(11, aclEntradas.getIdSucursalDig());
            cs.setString(12, aclEntradas.getCuentaAhorro());
            cs.setInt(13, aclEntradas.getIdTipoProd());
            cs.setInt(14, aclEntradas.getIdTipoDocto());
            cs.setString(15, aclEntradas.getWorkstation());
            cs.setString(16, aclEntradas.getUsuario());
            //cs.setString(14, aclEntradas.getCorreo());
            cs.setString(17, aclEntradas.getTamImagen());
            
            cs.registerOutParameter(18, OracleTypes.VARCHAR);
            log.info("ejecucion de llamada...");
            cs.executeQuery();
            aclEntradas.setRuta(cs.getString(18));
            log.info("realizada.");
            log.info("ruta: "+cs.getString(18).toString());
            if(cs.getString(18).length() > 0 ){
                codigo = "Insercion a DB correcta";
                log.info("Insercion a DB correcta");
            }else{
                codigo = "ruta de documento no generada, no se insertaron los datos.";
                log.error("ruta de documento no generada, no se insertaron los datos");
            }
        }catch(SQLException e){
            codigo = "SQL Exception al insertar en PQDG_ACLARACION.PADG_ALMACENA_ACLARACION [ " + e+" ]";
            log.error("SQL Exception al insertar en PQDG_ACLARACION.PADG_ALMACENA_ACLARACION [ " + e+" ]");
        }finally{
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return codigo;
	}
	
}
