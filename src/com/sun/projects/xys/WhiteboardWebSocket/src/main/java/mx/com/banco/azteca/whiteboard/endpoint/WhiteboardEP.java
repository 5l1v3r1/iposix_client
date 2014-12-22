package mx.com.banco.azteca.whiteboard.endpoint;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import mx.com.banco.azteca.whiteboard.decoder.FigureDecoder;
import mx.com.banco.azteca.whiteboard.encoder.FigureEncoder;
import mx.com.banco.azteca.whiteboard.pojo.Figure;

/**
 * @author B249461
 */
@ServerEndpoint(value = "/whiteb", encoders = {FigureEncoder.class},
        decoders = {FigureDecoder.class})
public class WhiteboardEP {

    private static final Set<Session> peers;

    static {
        peers = Collections.synchronizedSet(new HashSet<Session>());
    }

    @OnOpen
    public void onOpen(Session peer) {
        System.out.println("open session: " + peer);
        System.out.println("session.getMaxIdleTimeout(): " + peer.getMaxIdleTimeout());
        peers.add(peer);
    }

    @OnMessage
    public void bradcastFigure(Figure figure, Session session) {
        System.out.println("broadcastFigure: " + figure);
        
        synchronized (peers) {
            Iterator<Session> iter = peers.iterator();
            
            while (iter.hasNext()) {
                Session peer = iter.next();
                if (!peer.equals(session) && peer.isOpen()) {
                    try {
                        peer.getBasicRemote().sendObject(figure);
                    } catch (IOException | EncodeException ex) {
                        System.out.println("getBasicRemote exception: " + ex);
                    }
                }

            }
            
        }
        
    }

    @OnClose
    public void onClose(Session peer) {
        System.out.println("close session: " + peer);
        peers.remove(peer);
    }

}
