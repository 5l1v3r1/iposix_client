/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acertum.servicios;

import acertum.verificadocumentos.dao.DatosDto;
import acertum.verificadocumentos.dao.SolicitaDoctosDAO;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;

import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;
import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

/**
 * REST Web Service
 *
 * @author B246583
 */
@Path("/docreq")
public class VerificaDocs {
    final static Logger log = Logger.getLogger(VerificaDocs.class);
    
    /** Creates a new instance of VerificaDocs */
    public VerificaDocs() {
    }

    /**
     * Retrieves representation of an instance of VerificaDocs.VerificaDocs
     * @return an instance of javax.ws.rs.core.Response
     */
    @GET
    @Produces("application/json")
    public Response getJson(@QueryParam("idProd") int idProducto,
                            @QueryParam("subprod") int subproducto,
                            @QueryParam("etapa") int etapa,
                            @QueryParam("idPais") int idPais,
                            @QueryParam("idCanal") int idCanal,
                            @QueryParam("idSuc") int idSucursal,
                            @QueryParam("folio") int folio) {
        DatosDto entradas = new DatosDto();
        entradas.setEtapa(etapa);
        entradas.setFolio(folio);
        entradas.setIdCanal(idCanal);
        entradas.setIdPais(idPais);
        entradas.setIdProducto(idProducto);
        entradas.setIdSucursal(idSucursal);
        entradas.setSubproducto(subproducto);
        //JSONObject jsonObject = new JSONObject();
        SolicitaDoctosDAO dao = new SolicitaDoctosDAO();
        List<List<Object>> array = dao.getDocumentos(entradas);
        String respuesta = "";

        JSONArray listid = new JSONArray();
        JSONArray listnombre = new JSONArray();
        JSONObject obj = new JSONObject();

        if (!(array.size() == 0)) {
            for (int i = 0; i < array.size(); i++) {
                //jsonObject.append("id", array.get(i).get(0).toString());
                //jsonObject.append("nombre", array.get(i).get(1).toString());

                listid.put(array.get(i).get(0));
                listnombre.put(array.get(i).get(1));

            }
            log.info("Documentos requeridos: \n"
                    + listid +" \n "
                    + listnombre);
            
            try {
                obj.put("id", listid);
                obj.put("nombre", listnombre);
            } catch (Exception e) {
                e.printStackTrace();
            }
            respuesta = "" + obj;

        } else {
            try {
                obj.put("resp", "componente digitalizado");
            } catch (Exception e) {
                e.printStackTrace();
            }
            respuesta = "" + obj;
        }
        return Response.status(200).entity(obj).build();
    }
}
