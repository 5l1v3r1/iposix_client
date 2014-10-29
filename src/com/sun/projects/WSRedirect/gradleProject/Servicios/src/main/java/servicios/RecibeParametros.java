/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servicios;


import dto.Parametros;
import javax.ws.rs.Path;

import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.codehaus.jettison.json.JSONException;
import utils.Propiedades;
import utils.RedireccionaServicios;

/**
 * REST Web Service
 * Ejecuta otros servicios del paquete DigiAcerturm
 * DigiAcertum/service/saveimg --> Apertura
 * DigiAcertum/Aclaraciones/service/insert --> Aclaraciones
 *
 * @author B246583
 */

@Path("servicio")
public class RecibeParametros {
    String servidor = Propiedades.getProp("servidorServicios");

    /**
     * recibe un json object y consume el servicio correspondiente al tipo de producto.
     * @param entradas
     * @return la respuesta en json del servicio que corresponda.
     * @throws org.codehaus.jettison.json.JSONException
     */
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response getJson(Parametros entradas) throws JSONException {

        RedireccionaServicios rs = new RedireccionaServicios();
        String resp = rs.recibirParametros(entradas);
        return Response.ok().entity(resp).build();
    }
    
    
    /*
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Parametros getJson(Parametros parms) throws JSONException {
        parms.setIdCanal(16);
        parms.setIdFolio(16);
        return parms;
    }

*/
//    @POST
//    @Produces("text/plain")
//    @Consumes("application/json")
//    public String getJson(JSONObject entradas) throws JSONException {
//
//         String recurso = "";
//         JSONObject parametros = new JSONObject();
//         Iterator k = entradas.keys();
//        String key= "";
//
//
//
//        //iterar sobre las keys del jsobject
//        while(k.hasNext()){
//            key = k.next().toString();
//            //si la key es un jsobject entonces son campos del servicio que se desea consumir
//            if(entradas.get(key)instanceof JSONObject){
//                parametros = entradas.getJSONObject(key);
//                System.out.println(parametros);
//                System.out.println("parametros en entradas--> " + parametros.length());
//            }
//            if(key.equals("producto")){
//                switch(entradas.getInt(key)){
//                    case 1: recurso = servidor+"/DigiAcertum/service/saveimg"; break;
//                    case 3: recurso = servidor+"/Aclaraciones/service/insert"; break;
//                    default:recurso = servidor+"/DigiAcertum/service/cokes" ;
//                }
//            }
//            System.out.println(key);
//        }
//
//        Client client = Client.create();
//        WebResource webResource2 = client.resource(recurso);
//	ClientResponse response2 = webResource2.accept("application/json").type(MediaType.APPLICATION_JSON).method("POST", ClientResponse.class, parametros);
//	if (response2.getStatus() != 200) {
//            throw new RuntimeException("Failed : HTTP error code : " + response2.getStatus());
//	}
//     return response2.getEntity(String.class);
//    }
    
}
