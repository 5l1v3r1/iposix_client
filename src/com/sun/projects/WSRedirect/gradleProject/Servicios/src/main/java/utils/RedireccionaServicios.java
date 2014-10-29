/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package utils;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import dto.Datos;
import dto.Parametros;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriBuilder;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

/**
 *
 * @author B246583
 */
public class RedireccionaServicios {
    String servidor = Propiedades.getProp("servidorServicios");
    String recurso = "";
    static final Logger log = Logger.getLogger("RedireccionaServicios.class");
    String delimParams = "\\|";
    String delimPares = ":";
    String[] parametros;
    String[] cAux1;
    ArrayList llave = new ArrayList();
    ArrayList valor = new ArrayList();
    Datos datos = new Datos();
    public String recibirParametros(Parametros params){

            log.log(Level.INFO, "cliente unico: {0}{1}{2}{3}", 
                    new Object[]{params.getIdPais(), params.getIdCanal(), 
                        params.getIdSucursal(), params.getIdFolio()});
            log.log(Level.INFO, "cadenaparametros {0}", params.getParametros());
            log.log(Level.INFO, "base64 {0}", params.getImagen64());
            JSONObject jso = new JSONObject();
            parametros = params.getParametros().split(delimParams);
        try {
            llave.clear();
            valor.clear();
            for (String p : parametros) {
                cAux1 = p.split(delimPares);
                llave.add(cAux1[0]);
                valor.add(cAux1[1]);
            }
            log.log(Level.INFO, "llaves-> {0}", llave);
            log.log(Level.INFO, "valor-> {0}", valor);

            jso.put("idPais", params.getIdPais());
            jso.put("idCanal", params.getIdCanal());
            jso.put("idSucursal", params.getIdSucursal());
            jso.put("idFolio", params.getIdFolio());
            jso.put("imagen64", params.getImagen64());
            jso.put("idTipoProd", params.getIdTipoProd());

            switch (params.getIdTipoProd()) {
                case 1:
                    log.info("invocando servicio Expediente unico");
                    recurso = servidor + "/AperturaAcertum/service/saveimg";
                    break;
                case 2:
                    log.info("invocando servicio Acertum");
                    recurso = servidor+"/Acertum/service/almacena";
                    break;
                case 3:
                    log.info("invocando servicio Aclaraciones");
                    recurso = servidor+"/Aclaraciones/service/insert";
                    break;
                case 4: recurso = servidor+"/OperCapta/service/insert";
                default:
            }

            for(int i = 0; i<llave.size();i++){
                jso.put(llave.get(i).toString(),valor.get(i).toString());
            }
            log.log(Level.INFO, "jso contiene:{0}", jso.toString());
        } catch (JSONException ex) {
            System.out.println("Error in this block!!");
            Logger.getLogger(RedireccionaServicios.class.getName()).log(
                                                        Level.SEVERE, null, ex);
        }
                   
            Client client = Client.create();

            log.log(Level.INFO, "client: {0}", client);
            WebResource webResource = client.resource(UriBuilder.fromUri(recurso).build());
            log.log(Level.INFO, "webResource: {0}", webResource);
               //webResource = client.resource(recurso);
               // ClientResponse response2 = webResource.accept("application/json").type(MediaType.APPLICATION_JSON).method("POST", ClientResponse.class, jso.toString());

            WebResource.Builder builder = webResource.type(
                                          MediaType.APPLICATION_JSON).accept(
                                          MediaType.APPLICATION_JSON);
            
            log.log(Level.INFO, "builder: {0}", builder);
            log.log(Level.INFO, "jso: {0}", jso);
            log.log(Level.INFO, "ClientResponse.class {0}", 
                                 ClientResponse.class);
             
            ClientResponse response = builder.post(ClientResponse.class,
                                                   jso.toString());
            
           /*  = webResource.accept("application/json")
                .type("application/json").post(ClientResponse.class, jso.toString());
*/
        
            
            
            if (response.getStatus() != 200) {
                throw new RuntimeException("Failed : HTTP error code : " + 
                                            response.getStatus());
            }
        return response.getEntity(String.class);
    }
}

