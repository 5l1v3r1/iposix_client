package mx.com.banco.azteca.digitalizacion.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

/**
 * Clase que obtiene las propiedades de configuracion de un archivo
 * 
 * @version 1.0, 04/08/2011
 * @author Armando Osorio Hernandez
 */
public class Propiedades {

    private Log errLog = new Log();
    private int vlintTipoSisOperativo = 0;
    private String vlstrNombreAplicacion = "";
    private String vlstrPoolConexionImaxBD = "";
    private String vlstrServidorImagenes = "";
    private int vlintPtoServidorImagen = 0;
    private String vlstrRutaBaseLogs = "";
    private String vlstrCarpetaBase = "";
    private String digbbConnectionName;

    /**
     * @return digbbConnectionName that is the connection name for DIGBB user
     */
    public String getDigbbConnectionName() {
        return digbbConnectionName;
    }
    
    private boolean vlblActivaTrace = true;

    /**
     *
     * @return Activar Trace
     */
    public boolean isActivaTrace() {
        return vlblActivaTrace;
    }

    /**
     *
     * @return Puerto del servidor de imagenes
     */
    public int getPtoServidorImagen() {
        return vlintPtoServidorImagen;
    }

    /***
     *
     * @return ruta Base donde se guardan los logs de
     * la aplicacion
     */
    public String getRutaBaseLogs() {
        return vlstrRutaBaseLogs;
    }

    /**
     *
     * @return ip del servidor de imagenes
     */
    public String getServidorImagenes() {
        return vlstrServidorImagenes;
    }

    /**
     * 
     * @param vlstrNombreAplicacion
     */
    public void setNombreAplicacion(String vlstrNombreAplicacion) {
        this.vlstrNombreAplicacion = vlstrNombreAplicacion;
    }

    /**
     * 
     * @return tipo de sistema operativo
     * 0 - windows
     * 1 - Linux
     */
    public int getTipoSisOperativo() {
        return vlintTipoSisOperativo;
    }

    /**
     *
     * @return Nombre del pool de conexiones
     * esquema imax
     */
    public String getPoolConexionImaxBD() {
        return vlstrPoolConexionImaxBD;
    }


    public void obtenPoolConexiones() throws Exception {

        Properties prop = new Properties();
        InputStream isProperties = null;
        String strRutaFile = "";

        try {

            vlintTipoSisOperativo = ObtenTipoSo();

            if (vlintTipoSisOperativo == 0) {

                strRutaFile = "C:\\banco\\tnsnames\\aplicaciones\\BD.properties";

            } else {

                strRutaFile = "/usr/apache2/jakarta-tomcat-5.5.4/webapps/banco/aplicaciones/BD.properties";
            }

            isProperties = new FileInputStream(strRutaFile);
            prop.load(isProperties);
            vlstrPoolConexionImaxBD = prop.getProperty(vlstrNombreAplicacion).trim();
            digbbConnectionName     = prop.getProperty("DigVisorWebDigBB").trim();
        } catch (Exception e) {
            errLog.grabaLog(vlstrNombreAplicacion, "Propiedades.obtenConfiguracionBD Exception", e);
        }

    }

    public void obtenConfiguracion() throws Exception {

        Cripto seguridad = new Cripto();
        Properties prop = new Properties();
        InputStream isProperties = null;
        String strRutaFile = "";

        try {

            vlintTipoSisOperativo = ObtenTipoSo();

            if (vlintTipoSisOperativo == 0) {
                strRutaFile = "C:\\banco\\tnsnames\\" + vlstrNombreAplicacion + "\\" + vlstrNombreAplicacion + ".properties";
            } else {
                strRutaFile = "/usr/apache2/jakarta-tomcat-5.5.4/webapps/banco/tnsnames/" + vlstrNombreAplicacion + "/" + vlstrNombreAplicacion + ".properties";
            }

            isProperties = new FileInputStream(strRutaFile);
            prop.load(isProperties);
            seguridad.setNombreAplicacion(vlstrNombreAplicacion);

            vlstrServidorImagenes = seguridad.desEncripta(prop.getProperty("ServidorImages"), "20d1g1t4liz4c10n", "AES");
            vlintPtoServidorImagen = Integer.parseInt(seguridad.desEncripta(prop.getProperty("PuertoSvrImagenes"), "20d1g1t4liz4c10n", "AES"));
            vlstrRutaBaseLogs = seguridad.desEncripta(prop.getProperty("RutaBaseLogs"), "20d1g1t4liz4c10n", "AES");            
            vlblActivaTrace = seguridad.desEncripta(prop.getProperty("Trace"), "20d1g1t4liz4c10n", "AES").trim().equals("S") ? true : false;

        } catch (Exception e) {
            errLog.grabaLog(vlstrNombreAplicacion, "Propiedades.obtenConfiguracion Exception", e);
        }

    }

    public int ObtenTipoSo() {

        int intResult = 0;

        String sSistemaOperativo = System.getProperty("os.name").toLowerCase();

        if (!sSistemaOperativo.contains("windows")) {
            intResult = 1;
        }

        return intResult;
    }
}
