package mx.com.banco.azteca.chatroom.endpoint;

import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 * @author B249461
 */
@ServerEndpoint(value = "/chat")
public class ChatServerEndPoint {

    /*
    private static final Set<Session> sessions;

    static {
        sessions = Collections.synchronizedSet(new HashSet<Session>());
    }

    @OnOpen
    public void onOpen(Session session) {
        System.out.println("open session: " + session.getId());
        System.out.println("session.getMaxIdleTimeout(): " + session.getMaxIdleTimeout());
        sessions.add(session);
    }
*/
    @OnMessage
    public void bradcastFigure(String message, Session userSession) {
        //System.out.println("Message received: " + message + ", from :" + 
        //                   userSession.getId());
        
        /*    
        synchronized (sessions) {
            Iterator<Session> iter = sessions.iterator();
            
            while (iter.hasNext()) {
                Session session = iter.next();
                if (session.isOpen()) {
                    System.out.println("Sending to " + session.getId());
                    session.getAsyncRemote().sendText(message);
                } else {
                    System.out.println("close in loop: " + session.getId());
                    sessions.remove(session);
                }
                
            }
        }   */
         for (Session session : userSession.getOpenSessions()) {
            if (session.isOpen())
                session.getAsyncRemote().sendText(message);
        }
    }
/*
    @OnClose
    public void onClose(Session session) {
        System.out.println("close session: " + session.getId());
        sessions.remove(session);
    }
*/
}
