package mx.com.banco.azteca.migration.document.starter;

import java.util.Date;
import java.util.List;
import mx.com.banco.azteca.migration.document.dao.DigwebDao;
import mx.com.banco.azteca.migration.document.model.Account;
import mx.com.banco.azteca.migration.document.model.Document;
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
public class StartMigration {
    
    private static final Logger log = Logger.getLogger(StartMigration.class);
    
    //log4j loader
    static {
         Log4jInit.init();
    }
    
    public static void main(String[] args) throws SchedulerException{
        
        List<Account> accounts = DigwebDao.getAccountsforMigration();
        for (Account account : accounts) {
            List<Document> documents = DigwebDao.getExistingDocuments(account.getAccount());
            log.info("documents -> " + documents);
        }
        
       // log.info("Hello sun!! -> " + DigwebDao.getAccountsforMigration());
        
        JobDetailImpl jobDetail = new JobDetailImpl();
        jobDetail.setName("job example");
        jobDetail.setJobClass(HelloJob.class);
        
        //configure the scheduler time
    	SimpleTriggerImpl trigger = new SimpleTriggerImpl();
        trigger.setName("trigger name");
    	trigger.setStartTime(new Date(System.currentTimeMillis()));
    	trigger.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
    	trigger.setRepeatInterval(6000);
 
    	//schedule it
    	Scheduler scheduler = new StdSchedulerFactory().getScheduler();
    	scheduler.start();
    	scheduler.scheduleJob(jobDetail, trigger);
        
        
        log.info("See you later sun!!");
        
    }

}
