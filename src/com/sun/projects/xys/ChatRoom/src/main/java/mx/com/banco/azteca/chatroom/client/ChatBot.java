package mx.com.banco.azteca.chatroom.client;

import java.io.StringReader;
import java.net.URI;
import java.net.URISyntaxException;
import javax.json.Json;
import javax.json.JsonObject;

/**
 * @author Carlos Cuaya Xinto
 */
public class ChatBot {
    
    public static void main(String[] args) throws URISyntaxException, 
                                                  InterruptedException {
        System.out.println("Helloooooo!!! Sunnn!!!!");
        final String endpointURI = "ws://localhost:1630/chatroom/chat";
        final ChatClientEndpoint clientEndpoint = new ChatClientEndpoint(
                                                        new URI(endpointURI));
        clientEndpoint.addMessageHandler(new ChatClientEndpoint.MessageHandler() {

            @Override
            public void handleMessage(String message) {
                JsonObject jsonObject = 
                      Json.createReader(new StringReader(message)).readObject();
                String username = jsonObject.getString("user");
                if(!username.equals("bot")){
                    clientEndpoint.sendMessage(getMessage("hello " + username +
                                                          ", como estas?"));
                    //other dirty bot logic goes here
                }
            }
        });
        
        while(true) {
            clientEndpoint.sendMessage(getMessage("hi theree!!"));
            Thread.sleep(10000);
        }
    }
    
    private static String getMessage(String message) {
        return Json.createObjectBuilder().add("user", "bot")
                                         .add("message", message)
                                         .build().toString();
    }
}
