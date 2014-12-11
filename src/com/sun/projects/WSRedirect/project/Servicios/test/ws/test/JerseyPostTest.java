package ws.test;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class JerseyPostTest {
    
    public static void main(String[] args) {

    try {
        Client client = Client.create();

        WebResource webResource = client.resource("http://localhost:8080/Aclaraciones/service/insert");

        String input = "{\"idCanal\":1," +
"\"idSucursal\":100," +
"\"idPais\":27," +
"\"idFolio\":12345," +
"\"idTipoProd\":3," +
"\"imagen64\":\"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\"," +
"\"parametros\":\"nombre:ISRAEL|aPaterno:PEREZ|aMaterno:LOPEZ|idTipoDocto:11|workstation:WS_SFIN01|idCanalDig:1|idSucursalDig:100|usuario:111111|correo:pp@yahoo.com.mx|cuentaAhorro:8768|idFolioAclaracion:123|idCteAclaracion:12345\"}" ;

        // POST method
        ClientResponse response = webResource.accept("application/json")
                .type("application/json").post(ClientResponse.class, input);

        // check response status code
        if (response.getStatus() != 200) {
            throw new RuntimeException("Failed : HTTP error code : "
                    + response.getStatus());
        }

        // display response
        String output = response.getEntity(String.class);
        System.out.println("Output from Server .... ");
        System.out.println(output + "\n");
    } catch (Exception e) {
        e.printStackTrace();
    }

}

}
