/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package acertum.aclaraciones.servicios;
import acertum.aclaraciones.dao.TransfImg;
import acertum.aclaraciones.dto.AclaracionesDto;
import java.io.IOException;

import javax.ws.rs.Path;

import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.Response;
import org.codehaus.jettison.json.JSONString;


/**
 * REST Web Service
 *
 * @author B246583
 */

@Path("/insert")
public class ServicioAclaraciones {

    /** Creates a new instance of SaveImg */
    public ServicioAclaraciones() {
    }

    /**
     * Retrieves representation of an instance of acertum.servicios.SaveImg
     * @return an instance of javax.ws.rs.core.Response
     */
		@POST
		@Consumes("application/json")
                @Produces("application/json")
		public Response insertAclaracion(AclaracionesDto entradas) throws IOException {
			String respuesta;
			TransfImg service = new TransfImg();
			if(service.creaImg(entradas)){
                            respuesta = "1";

                        }else{
                            respuesta = "0";
                        }
                        return Response.ok().entity(respuesta).build();
		}

}
