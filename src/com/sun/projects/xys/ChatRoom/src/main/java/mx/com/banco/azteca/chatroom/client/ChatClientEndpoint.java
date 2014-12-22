package mx.com.banco.azteca.chatroom.client;

import java.io.IOException;
import java.net.URI;
import javax.websocket.ClientEndpoint;
import javax.websocket.ContainerProvider;
import javax.websocket.DeploymentException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.WebSocketContainer;

/**
 * @author Carlos Cuaya Xinto
 */
@ClientEndpoint
public class ChatClientEndpoint {
    
    private Session userSession;
    private MessageHandler handler;
    
    public ChatClientEndpoint(URI endpointURI){
        try {
            WebSocketContainer container;
            container = ContainerProvider.getWebSocketContainer();
            Session connectToServer = container.connectToServer(ChatClientEndpoint.this, endpointURI);
            connectToServer.setMaxIdleTimeout(0);
        } catch (DeploymentException | IOException ex) {
            System.err.println("exception: " + ex);
        }
    }
    
    @OnOpen
    public void onOpen(Session session) {
        this.userSession = session;
    }
    
    @OnClose
    public void onClose(Session session) {
        this.userSession = null;
    }
    
    @OnMessage
    public void onMessage(String message) {
        if (this.handler != null) this.handler.handleMessage(message);
    }
    
    public void addMessageHandler(MessageHandler handler) {
        this.handler = handler;
    }
    
    public void sendMessage(String message) {
        this.userSession.getAsyncRemote().sendText(message);
    }
    
    public static interface MessageHandler {
        public void handleMessage(String message);
    }
}
