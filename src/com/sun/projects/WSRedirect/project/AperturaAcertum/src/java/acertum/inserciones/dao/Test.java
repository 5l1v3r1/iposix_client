/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package acertum.inserciones.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import acertum.conexion.DataSource;
import acertum.inserciones.dto.RetDocumentoDto;
import java.sql.SQLException;
import java.util.ArrayList;
import oracle.jdbc.OracleTypes;
import org.apache.log4j.Logger;

/**
 *
 * @author B246583
 */
public class Test {
    Logger log = Logger.getLogger("Test.class");
    public List<List<Object>> RetDocumento(RetDocumentoDto rddto) {
			CallableStatement cs = null;
			Connection conn = null;
                        Statement statement = null;
                        ResultSet rs = null;
                        List<Object> obj1 = null;
			List<List<Object>> obj2 = null;
	        try {
	        conn = DataSource.getInstance().getConnection();
                statement = conn.createStatement();
	            cs = conn.prepareCall("{ call DIGBB.PQDG_CONSULTAS.PADG_RET_DOCUMENTO(?,?,?,?,?)}");
	            cs.setInt(1, rddto.getIdProducto());
            cs.setString(2, rddto.getValor1());
            cs.setString(3, rddto.getValor2());
            cs.setString(4, rddto.getValor4());
            cs.setString(5, rddto.getValor5());
            cs.setString(7, rddto.getValor6());

	            cs.registerOutParameter(5, OracleTypes.CURSOR);
	            cs.execute();
                    obj2 = new ArrayList<List<Object>>();
                    if(cs.getObject(5)!= null){
	            rs = (ResultSet)cs.getObject(5);
	            while (rs.next()) {
	            	 obj1 = new ArrayList<Object>();
	            	 obj1.add(rs.getInt(("FIID_TIPO_DOCTO")));
	            	 obj1.add(rs.getString(("FCNOMBRE")));
	            	 obj1.add(rs.getString(("FCNOMBREPAGINA")));
	            	 obj1.add(rs.getString("FCRUTA"));
                         obj2.add(obj1);
	            }
                    }else{
                        obj2 = null;
                    }
	        } catch (SQLException e) {
	            log.info("Error SQL RetDocumento " + e);
	        } catch (Exception e) {
	            log.info("Error SQL RetDocumento " + e);	       
	        }finally {
	            if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
                    if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {e.printStackTrace();}
	        }
	        return obj2;
		}


}
