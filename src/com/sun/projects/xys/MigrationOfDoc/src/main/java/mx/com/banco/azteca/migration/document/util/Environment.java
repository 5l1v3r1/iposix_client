package mx.com.banco.azteca.migration.document.util;

/**
 * @author B249461
 */
public enum Environment {
    
    DEVELOPMENT("development"),
    TEST("test"),
    PRODUCTION("production");
    
    private final String value;
    
    private Environment(String value){
        this.value = value;
    }
    
    public String getValue(){
        return this.value;
    }
}
