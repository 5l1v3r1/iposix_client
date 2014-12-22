package mx.com.banco.azteca.migration.document.util;

import java.util.Arrays;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 * @author Carlos Cuaya Xinto
 */
public class PrintObject {
    
    private static final Logger log;
    
    private static StringBuilder sb;
    
    static {
        log = Logger.getLogger(PrintObject.class);
    }
    
    public static <K,V> void  printMap(String name, Map<K,V> map){
        sb = new StringBuilder();
        
            for (Map.Entry<K, V> entry : map.entrySet()) {          
                sb.append("[ ");
                sb.append(entry.getKey());
                sb.append(" -> ");
                sb.append(entry.getValue());
                sb.append("] \n");
            }
            log.debug("MAP " + name + ": " + sb.toString());
        
    }
    
    public static void printArray(String name, Object[] array) { 
            log.debug("ARRAY " + name + " : " + Arrays.toString(array));
    }

}
