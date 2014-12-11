/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package acertum.servicios;


import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.POST;

/**
 * REST Web Service
 *
 * @author B246583
 */

@Path("/cokes")
public class CokesResource {

    /** Creates a new instance of CokesResource */
    public CokesResource() {
    }

    /**
     * Retrieves representation of an instance of acertum.servicios.CokesResource
     * @return an instance of java.lang.String
     */
    @POST
    @Produces("application/json")
    public String getXml() {
        //TODO return proper representation object
        return "Cocas!";
    }

}
