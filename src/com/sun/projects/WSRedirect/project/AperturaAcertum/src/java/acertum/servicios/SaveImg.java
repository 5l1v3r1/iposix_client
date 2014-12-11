/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package acertum.servicios;

import acertum.saveimg.dao.TransfImg;
import acertum.saveimg.dto.InsTresTablasDto;
import acertum.saveimg.dto.PaginaDto;
import java.io.IOException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.Response;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

/**
 * REST Web Service
 *
 * @author B246583
 */

@Path("/saveimg")
public class SaveImg {

    /** Creates a new instance of SaveImg */
    public SaveImg() {
    }

    /**
     * Retrieves representation of an instance of acertum.servicios.SaveImg
     * @return an instance of javax.ws.rs.core.Response
     */
                PaginaDto entradas = new PaginaDto();
		@POST
		@Consumes("application/json")
                @Produces("application/json")
		public Response setObjeto(InsTresTablasDto entradas) throws IOException, JSONException {
                    String estado ="";
			JSONObject jso = new JSONObject();
			TransfImg service = new TransfImg();
                        System.err.println("this is a message");
			if(service.creaImg(entradas)){
	            //return Response.status(200).entity("estado de la insercion: Correcta.").build();
                            //jso.put("Respuesta", "insercion correcta");
                            estado = "estado de la insercion: Correcta.";

	        }else{
	        	//return Response.status(400).entity("estado de la insercion: Falló").build();
                            //jso.put("Respuesta", "La inserción falló");
                            estado = "estado de la insercion: Fallo. this is written";
	        }
                return Response.ok().entity(estado).build();
		}
}
