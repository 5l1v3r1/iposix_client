package mx.com.banco.azteca.whiteboard.decoder;

import java.io.StringReader;
import javax.json.Json;
import javax.json.JsonException;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;
import mx.com.banco.azteca.whiteboard.pojo.Figure;

/**
 * @author Carlos Cuaya Xinto
 */
public class FigureDecoder implements Decoder.Text<Figure> {

    @Override
    public Figure decode(String string) throws DecodeException {
        JsonObject jsonObject = Json.createReader(new StringReader(string)).
                                                                readObject();
        Figure figure = new Figure(jsonObject);
        System.out.println("return figure: " + figure);
        return figure;
    }

    @Override
    public boolean willDecode(String string) {
        try {
            Json.createReader(new StringReader(string)).readObject();
        } catch (JsonException je) {
            System.out.println("return false ");
            System.out.println("json reader exception: " + je);
            return false;
        }
        System.out.println("return true ");
        return true;
    }

    @Override
    public void init(EndpointConfig ec) {
        System.out.println("init decode");
    }

    @Override
    public void destroy() {
        System.out.println("destroy decode");
    }

}
