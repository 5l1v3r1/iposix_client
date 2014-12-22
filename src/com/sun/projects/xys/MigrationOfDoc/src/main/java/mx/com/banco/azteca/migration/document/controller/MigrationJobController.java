package mx.com.banco.azteca.migration.document.controller;

import java.util.Date;
import mx.com.banco.azteca.migration.document.logic.MigrationLogic;
import mx.com.banco.azteca.migration.document.util.ConfigFile;
import mx.com.banco.azteca.migration.document.util.Log4jInit;
import org.apache.log4j.Logger;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleTrigger;
import org.quartz.impl.JobDetailImpl;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.triggers.SimpleTriggerImpl;

/**
 * @author Carlos Cuaya Xinto
 */
public class MigrationJobController {
    
    private static final Logger log;
    private static final ConfigFile configFile;
    
    private static final String JOB_NAME;
    private static final String TRIGGER_NAME;
    private static final String QUARTZ_CONF_FILE_PATH;
    
    private static final long DELAY_TIME;
    private static final long REPEAT_INTERVAL;
    
    static {
        //log4j configuration loader
        Log4jInit.init();
        
        log = Logger.getLogger(MigrationJobController.class);  
        configFile = ConfigFile.getConfigFile();
        
        JOB_NAME = configFile.getProperty("quartz.job.name");
        TRIGGER_NAME = configFile.getProperty("quartz.trigger.name");
        QUARTZ_CONF_FILE_PATH = configFile.getProperty("quartz.conf.file.path");    
        DELAY_TIME = configFile.getIntProperty("quartz.delay.time");
        REPEAT_INTERVAL = configFile.getIntProperty("quartz.repeat.interval");
    }
    


    public static void execute() {
        
        log.debug("JOB_NAME: " + JOB_NAME);
        log.debug("TRIGGER_NAME: " + TRIGGER_NAME);
        log.debug("QUARTZ_CONF_FILE_PATH: " + QUARTZ_CONF_FILE_PATH);
        log.debug("DELAY_TIME: " + DELAY_TIME);
        log.debug("REPEAT_INTERVAL: " + REPEAT_INTERVAL);
        
        //create the MigrationLogic job
        JobDetailImpl jobDetail = new JobDetailImpl();
        jobDetail.setName(JOB_NAME);
        jobDetail.setJobClass(MigrationLogic.class);
        
        //configure the scheduler time
    	SimpleTriggerImpl trigger = new SimpleTriggerImpl();
        trigger.setName(TRIGGER_NAME);
        //first time there is a delay of two seconds
    	trigger.setStartTime(new Date(System.currentTimeMillis() + DELAY_TIME));
    	trigger.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
        //30000 = 30 sec
    	trigger.setRepeatInterval(REPEAT_INTERVAL); //miliseconds
 
    	//schedule it
    	Scheduler scheduler;
        try {
            scheduler = new StdSchedulerFactory(QUARTZ_CONF_FILE_PATH).
                                                                getScheduler();
            scheduler.start();
            scheduler.scheduleJob(jobDetail, trigger);
        } catch (SchedulerException schex) {
            log.error("Scheduler initializer error: " + schex);
        }

    }

}
