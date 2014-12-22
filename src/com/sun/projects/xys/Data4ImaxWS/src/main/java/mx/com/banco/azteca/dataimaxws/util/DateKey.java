package mx.com.banco.azteca.dataimaxws.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Carlos Cuaya Xinto
 */
public class DateKey {
    
    private static final SimpleDateFormat formatter;
    
    static {
        formatter = new SimpleDateFormat("yyyyMMdd");
    }
   
    
    public static boolean hasFormatYYYYMMDD(String dateString){

        try {
            formatter.parse(dateString);
        } catch (ParseException pex) {
            System.err.println("Error at parse the date: " + pex );
            return false;
        }
        return true;
    }
    
    public static String getCurrentDateAsString() {
        String currentDate;
        
        currentDate = formatter.format(new Date());
        
        return currentDate;
    }

}
