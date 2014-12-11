/**
 * @author acertum
 */
package utils;

import java.util.Properties;
import java.io.FileInputStream;
import java.util.HashMap;
public class Propiedades {
    
    private static String rutaArichivosTexto;
    private static String rutaImagenes;
   
    // System.getProperty("user.dir") +
    private static final String FICHERO_CONFIGURACION = "C:/RESPALDOS2/DB.properties";
    private static HashMap propiedades;
     
    static {
    try{

        FileInputStream f;
        f = new FileInputStream(FICHERO_CONFIGURACION);
        Properties propiedadesTemporales = new Properties();
        propiedadesTemporales.load(f);
        f.close();
        propiedades = new HashMap(propiedadesTemporales);
       }catch (Exception e){
            System.out.println(e.getCause());

        }
    
    }

    /**
     * @return the rutaImagenesString
     */
    public static String getProp(String prop) {
        return propiedades.get(prop).toString() ;
    }



}
