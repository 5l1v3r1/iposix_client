/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package utils;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.impl.provider.entity.JSONRootElementProvider;
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
    Logger log = Logger.getLogger("RedireccionaServicios.class");
    String delimParams = "\\|";
    String delimPares = ":";
    String[] parametros;
    String[] cAux1;
    ArrayList llave = new ArrayList();
    ArrayList valor = new ArrayList();
    Datos datos = new Datos();
    public String recibirParametros(Parametros params){
        String estado = "";
            log.info("cliente unico: " + params.getIdPais() + params.getIdCanal() + params.getIdSucursal() + params.getIdFolio());
            log.info("cadenaparametros " + params.getParametros());
            log.info("base64 " + params.getImagen64());
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
            log.info("llaves-> " + llave);
            log.info("valor-> " + valor);

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
                    recurso = servidor+"Acertum/service/almacena";
                    break;
                case 3:
                    log.info("invocando servicio Aclaraciones");
                    recurso = servidor+"/Aclaraciones/service/insert";
                    break;
                case 4: recurso = servidor+"Opercapta/service/insert";
                default:
            }

            for(int i = 0; i<llave.size();i++){
                jso.put(llave.get(i).toString(),valor.get(i).toString());
            }
            log.log(Level.INFO, "jso contiene:{0}", jso.toString());
        } catch (JSONException ex) {
            System.out.println("Error in this block!!");
            Logger.getLogger(RedireccionaServicios.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        ClassLoader old = Thread.currentThread().getContextClassLoader();
        Thread.currentThread().setContextClassLoader(this.getClass().getClassLoader());
        try {
            
            ClientConfig config = new DefaultClientConfig();
           config.getClasses().add(JSONRootElementProvider.class);
           
           
            
            Client client = Client.create(config);
            
            
            
            log.log(Level.INFO, "client: {0}", client);
            WebResource webResource = client.resource(UriBuilder.fromUri("http://localhost:8080/Aclaraciones/service/insert").build());
            log.log(Level.INFO, "webResource: {0}", webResource);
               //webResource = client.resource(recurso);
               // ClientResponse response2 = webResource.accept("application/json").type(MediaType.APPLICATION_JSON).method("POST", ClientResponse.class, jso.toString());
             String input = "{\"idCanal\":1," +
"\"idSucursal\":100," +
"\"idPais\":27," +
"\"idFolio\":12345," +
"\"idTipoProd\":3," +
"\"imagen64\":\"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\"," +
"\"parametros\":\"nombre:ISRAEL|aPaterno:PEREZ|aMaterno:LOPEZ|idTipoDocto:11|workstation:WS_SFIN01|idCanalDig:1|idSucursalDig:100|usuario:111111|correo:pp@yahoo.com.mx|cuentaAhorro:8768|idFolioAclaracion:123|idCteAclaracion:12345\"}" ;
/*
            WebResource.Builder builder = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON);//.post(ClientResponse.class,jso.toString());
            log.log(Level.INFO, "builder: {0}", builder);
            log.log(Level.INFO, "jso: {0}", jso);
            log.log(Level.INFO, "ClientResponse.class {0}", ClientResponse.class);
             
            builder.post(ClientResponse.class,input);*/
            ClientResponse response = webResource.accept("application/json")
                .type("application/json").post(ClientResponse.class, input);
        } finally {
          Thread.currentThread().setContextClassLoader(old);
        }
        
            
           // builder.post();
            //log.log(Level.INFO, "response2: {0}", response2);
            /*
            if (response2.getStatus() != 200) {
                throw new RuntimeException("Failed : HTTP error code : " + response2.getStatus());
            }
        return response2.getEntity(String.class);*/
            return "ok";
    }
}

