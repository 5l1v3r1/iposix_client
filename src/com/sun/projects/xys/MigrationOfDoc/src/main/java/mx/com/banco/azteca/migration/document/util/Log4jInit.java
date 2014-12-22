package mx.com.banco.azteca.migration.document.util;

import java.io.IOException;
import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.DailyRollingFileAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;

/**
 * @author Carlos Cuaya Xinto
 */
public class Log4jInit {
    
    private static final EnvironmentFile environmentFile;
    private static final String PATTERN;
    private static final String DATE_PATTERN;
    private static final String LOG_FILE;
      
    static {
        environmentFile = EnvironmentFile.getEnvironmentFile();
        /**
         * %d date
         * %t thread
         * %p priority of logging
         * %C fully qualified class
         * %n line separator
         * %L line number
         * %m message
         */
        PATTERN = environmentFile.getProperty("log4j.pattern");
        DATE_PATTERN = environmentFile.getProperty(
                                            "log4j.daily.rolling.date.pattern");
        
        if (environmentFile.getEnvironment() == Environment.DEVELOPMENT)
            LOG_FILE = environmentFile.getProperty("log4j.dev.log.file.path");
        else if (environmentFile.getEnvironment() == Environment.TEST)
            LOG_FILE = environmentFile.getProperty("log4j.test.log.file.path");
        else LOG_FILE = environmentFile.getProperty("log4j.prod.log.file.path");
        
    }
    
    public static void init(){
                
        //This is the root logger provided by log4j
        Logger rootLogger = Logger.getRootLogger();
        
        //< DEBUG < INFO < WARN < ERROR < FATAL < OFF
         //it would print all the messages
   /*     if (environmentFile.getEnvironment() == Environment.PRODUCTION)
                rootLogger.setLevel(Level.INFO);
        else
                rootLogger.setLevel(Level.DEBUG);
*/
        //Define log pattern layout
        PatternLayout layout = new PatternLayout(PATTERN);
        ConsoleAppender ca   = new ConsoleAppender(layout);
        ca.setThreshold(Level.INFO);
        //Add console appender to root logger
        rootLogger.addAppender(ca);
        
        try {
            //write to a file
            DailyRollingFileAppender drfa = new DailyRollingFileAppender(
                                                layout, LOG_FILE, DATE_PATTERN);
            drfa.setThreshold(Level.DEBUG);
            rootLogger.addAppender(drfa);
        } catch (IOException ioex) {
            System.out.println("create file log error: " + LOG_FILE + ioex);
        }
    }

}
