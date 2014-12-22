package mx.com.banco.azteca.migration.document.model;

/**
 * @author Carlos Cuaya Xinto
 */
public class Document {
    
    //row key
    private Integer expImx;//EXPIMX
    private String  account;//IMX01
            
    //data
    private Integer country;
    private Integer canal;
    private Integer branch;
    private Integer folio;
    private String  personName;
    private String  personLastname;
    private String  personSecondLastname;
    private Integer productId;
    private String  documentName;
    private Integer documentTypeId;
    private String  workstation;
    private Integer digitalCanalId;
    private Integer digitalBranchId;
    private String  user;
    private String  imagePath;
    private String  imageSize;
    
    public Integer getExpImx() {
        return expImx;
    }

    public void setExpImx(Integer expImx) {
        this.expImx = expImx;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public Integer getCountry() {
        return country;
    }

    public void setCountry(Integer country) {
        this.country = country;
    }

    public Integer getCanal() {
        return canal;
    }

    public void setCanal(Integer canal) {
        this.canal = canal;
    }

    public Integer getBranch() {
        return branch;
    }

    public void setBranch(Integer branch) {
        this.branch = branch;
    }

    public Integer getFolio() {
        return folio;
    }

    public void setFolio(Integer folio) {
        this.folio = folio;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public String getPersonLastname() {
        return personLastname;
    }

    public void setPersonLastname(String personLastname) {
        this.personLastname = personLastname;
    }

    public String getPersonSecondLastname() {
        return personSecondLastname;
    }

    public void setPersonSecondLastname(String personSecondLastname) {
        this.personSecondLastname = personSecondLastname;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    public Integer getDocumentTypeId() {
        return documentTypeId;
    }

    public void setDocumentTypeId(Integer documentTypeId) {
        this.documentTypeId = documentTypeId;
    }

    public String getWorkstation() {
        return workstation;
    }

    public void setWorkstation(String workstation) {
        this.workstation = workstation;
    }

    public Integer getDigitalCanalId() {
        return digitalCanalId;
    }

    public void setDigitalCanalId(Integer digitalCanalId) {
        this.digitalCanalId = digitalCanalId;
    }

    public Integer getDigitalBranchId() {
        return digitalBranchId;
    }

    public void setDigitalBranchId(Integer digitalBranchId) {
        this.digitalBranchId = digitalBranchId;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getImageSize() {
        return imageSize;
    }

    public void setImageSize(String imageSize) {
        this.imageSize = imageSize;
    }

    @Override
    public String toString() {
        return  "Document{" + "expImx=" + expImx + ", account=" + account + 
                ", country=" + country + ", canal=" + canal + 
                ", branch=" + branch + ", folio=" + folio + 
                ", personName=" + personName + 
                ", personLastname=" + personLastname + 
                ", personSecondLastname=" + personSecondLastname + 
                ", productId=" + productId + ", documentName=" + documentName + 
                ", documentTypeId=" + documentTypeId + 
                ", workstation=" + workstation + 
                ", digitalCanalId=" + digitalCanalId + 
                ", digitalBranchId=" + digitalBranchId + ", user=" + user + 
                ", imagePath=" + imagePath + ", imageSize=" + imageSize + '}';
    }

}
