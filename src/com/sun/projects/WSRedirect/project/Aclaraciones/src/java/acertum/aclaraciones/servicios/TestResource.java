/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package acertum.aclaraciones.servicios;

import java.net.URISyntaxException;
import java.net.URL;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

/**
 * REST Web Service
 *
 * @author B246583
 */

@Path("/test")
public class TestResource {

    @GET
    @Produces("text/html")
    public Response getHtml() throws URISyntaxException {
    java.net.URI location = new java.net.URI("http://10.53.26.142:8080/DigitalizacionServlet?idExpDig="+15+"&idDocDig="+15);
    return Response.seeOther(location).build();

    }

}
