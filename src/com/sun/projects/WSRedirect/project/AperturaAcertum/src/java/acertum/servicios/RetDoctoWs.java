/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package acertum.servicios;


import acertum.inserciones.dao.InsercionesDao;
import acertum.inserciones.dto.RetDocumentoDto;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

/**
 * REST Web Service
 *
 * @author B246583
 */

@Path("/rutasdocumentos")
public class RetDoctoWs {
   
    @GET
    @Produces("application/json")
    public Response retRutaDoc(@QueryParam("idProd") int tipoDocto,
                        @QueryParam("val1") String valor1,
                        @QueryParam("val2") String valor2,
                        @QueryParam("val3") String valor3,
                        @QueryParam("val4") String valor4,
                        @QueryParam("val5") String valor5,
                        @QueryParam("val6") String valor6) {
        String respuesta;
        RetDocumentoDto dto = new RetDocumentoDto();
        dto.setIdProducto(tipoDocto);
        dto.setValor1(valor1);
        dto.setValor2(valor2);
        dto.setValor3(valor3);
        dto.setValor4(valor4);
        dto.setValor5(valor5);
        dto.setValor6(valor6);
        JSONObject jso = new JSONObject();
        JSONArray arTipo = new JSONArray();
        JSONArray arNombre = new JSONArray();
        JSONArray arNombrePagina = new JSONArray();
        JSONArray arRuta = new JSONArray();
        InsercionesDao dao = new InsercionesDao();
        List<List<Object>> lista;
        lista = dao.RetDocumento(dto);


        if (lista.size() !=0 ){
            try {
                for (int i = 0; i < lista.size(); i++) {
                    arTipo.put(lista.get(i).get(0));
                    arNombre.put(lista.get(i).get(1));
                    arNombrePagina.put(lista.get(i).get(2));
                    arRuta.put(lista.get(i).get(3));
                }
                jso.put("tipo", arTipo);
                jso.put("desc", arNombre);
                jso.put("nombreDoc", arNombrePagina);
                jso.put("ruta", arRuta);
            } catch (JSONException ex) {
                Logger.getLogger(RetDoctoWs.class.getName()).log(Level.SEVERE, null, ex);
            }
            respuesta = jso.toString();
        }else{
            try {
                jso.put("resp", "No existen documentos digitalizados para este cliente unico");
            } catch (Exception e) {
                e.printStackTrace();
            }
            respuesta = jso.toString();
        }
        return Response.ok().entity(jso).build();
    }
}
