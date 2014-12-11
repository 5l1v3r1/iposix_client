package mx.com.banco.azteca.migration.document.util;

import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;

/**
 * @author Carlos Cuaya Xinto
 */
public class Log4jInit {
    
    
    
    public static void init(){
        //This is the root logger provided by log4j
        Logger rootLogger = Logger.getRootLogger();
        rootLogger.setLevel(Level.DEBUG);

        //Define log pattern layout
        PatternLayout layout = new PatternLayout("%d{ISO8601} [%t] %-5p %c %x - %m%n");

        //Add console appender to root logger
        rootLogger.addAppender(new ConsoleAppender(layout));
        
    }

}
