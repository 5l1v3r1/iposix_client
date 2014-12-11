package acertum.verificadocumentos.dao;

import acertum.conexion.Conexion;
import acertum.conexion.DataSource;
import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.internal.OracleTypes;
import org.apache.log4j.Logger;


public class SolicitaDoctosDAO {
 Logger log = Logger.getLogger("SolicitaDoctosDAO.class");
    
    public List<List<Object>> getDocumentos(DatosDto datos){
    	CallableStatement cs = null;
	Connection conn = null;
        Conexion conexion = new Conexion();
        Statement statement = null;
        ResultSet rs = null;
        List<List<Object>> obj2 = null;
        List<Object> obj1 = null;


        try {
            log.info("################################################");
            log.info("# DIGBB.PQDG_DOCUMENTOS.PADGMUESTRA_DOCUMENTOS #");
            log.info("################################################");
            try {
                conn = DataSource.getInstance().getConnection();
            } catch (IOException ex) {
                log.error(ex);
            } catch (PropertyVetoException ex) {
                log.error(ex);
            }
            statement = conn.createStatement();
            //(cs = conn.prepareCall("call MIKE.PQDG_DOCUMENTOS.PADGMUESTRA_DOCUMENTOS(?,?,?,?,?,?,?,?)");
            cs = conn.prepareCall("call DIGBB.PQDG_DOCUMENTOS.PADGMUESTRA_DOCUMENTOS(?,?,?,?,?,?,?,?)");
            cs.setInt(1, datos.getIdProducto());
            cs.setInt(2, datos.getSubproducto());
            cs.setInt(3, datos.getEtapa());
            cs.setInt(4, datos.getIdPais());
            cs.setInt(5, datos.getIdCanal());
            cs.setInt(6,datos.getIdSucursal());
            cs.setInt(7, datos.getFolio());
            cs.registerOutParameter(8,OracleTypes.CURSOR);
            cs.executeQuery();
            rs = (ResultSet)cs.getObject(8);
            obj2 = new ArrayList<List<Object>>();
            log.info("Recorriendo resultset...");
            while (rs.next()) {
            	obj1 = new ArrayList<Object>();
            	obj1.add(rs.getInt("FIID_TIPO_DOCTO"));
            	obj1.add(rs.getString("FCNOMBRE"));
            	obj2.add(obj1);
            }
            log.info("llamada call DIGBB.PQDG_DOCUMENTOS.PADGMUESTRA_DOCUMENTOS(?,?,?,?,?,?,?,?) realizada.");

        }catch(SQLException e){
        	log.error("Ecepcion - Error en la consulta: " + e);
        	e.printStackTrace();
        }catch(NullPointerException npe){
            log.info("error resultset vacio" + npe );
        }finally{
            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
            if (conn != null) try { conn.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return obj2;
    }
}
