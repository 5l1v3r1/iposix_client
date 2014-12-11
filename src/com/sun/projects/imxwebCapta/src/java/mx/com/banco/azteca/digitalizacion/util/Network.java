package mx.com.banco.azteca.digitalizacion.util;

import java.net.InetAddress;

public class Network {

    private boolean vlblActivaTrace = false;
    private Log ErrLog = new Log();

    /**
     *
     * @param Activa Trace
     */
    public void setVlblActivaTrace(boolean vlblActivaTrace) {
        this.vlblActivaTrace = vlblActivaTrace;
    }

    public String getIpServidorApp() {
        String strResult = "";
        try {
            InetAddress thisIp = InetAddress.getLocalHost();
            strResult = thisIp.getHostName();
            strResult = strResult + " " + thisIp.getHostAddress();
            if (vlblActivaTrace) {
                System.out.println("Direccion IP del servidor de aplicaciones: " + thisIp.getHostAddress());
            }
        } catch (Exception e) {            
            ErrLog.grabaLog("DigitalizacionWeb", "Network.getIpServidorApp Exception", e);
        }
        return strResult;
    }
}
