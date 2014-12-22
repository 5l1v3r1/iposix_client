package mx.com.banco.azteca.migration.document.starter;

import mx.com.banco.azteca.migration.document.controller.MigrationJobController;
import org.quartz.SchedulerException;

/**
 * @author Carlos Cuaya Xinto
 */
public class StartMigration {
    
    public static void main(String[] args) throws SchedulerException{
        
        MigrationJobController.execute();
        
    }
}
