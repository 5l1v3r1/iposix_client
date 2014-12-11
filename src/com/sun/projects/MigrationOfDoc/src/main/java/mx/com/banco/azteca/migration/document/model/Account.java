package mx.com.banco.azteca.migration.document.model;

/**
 * @author Carlos Cuaya Xinto
 */
public class Account {
    
    private String expimx;
    private String appimxName;
    private String account;
    private String secondAccount;

    public String getExpimx() {
        return expimx;
    }

    public void setExpimx(String expimx) {
        this.expimx = expimx;
    }

    public String getAppimxName() {
        return appimxName;
    }

    public void setAppimxName(String appimxName) {
        this.appimxName = appimxName;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getSecondAccount() {
        return secondAccount;
    }

    public void setSecondAccount(String secondAccount) {
        this.secondAccount = secondAccount;
    }

    @Override
    public String toString() {
        return "Account{" + "expimx=" + expimx + ", appimxName=" + appimxName + 
               ", account=" + account + ", secondAccount=" + secondAccount + '}';
    }

}
