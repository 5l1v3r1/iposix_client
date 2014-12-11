package mx.com.banco.azteca.migration.document.starter;

import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;


/**
 * @author Carlos Cuaya Xinto
 */
//this annotation helps to avoid the concurrency of jobs
@DisallowConcurrentExecution
public class HelloJob implements Job{
    
    private static final Logger log = Logger.getLogger(HelloJob.class);
    public static int instancesNumber;
    
    static {
        instancesNumber = 0;
    }
    
    public HelloJob(){
        ++instancesNumber;
    }

    @Override
    public void execute(JobExecutionContext jec) throws JobExecutionException{
        int val = instancesNumber;
        System.out.println("hellooo Sun! " + val);
        try {
            Thread.sleep(4000);
        } catch (InterruptedException ex) {
            System.out.println("ex: " + ex);
        }
        log.info("see you Sun! " + val);
    }

}
