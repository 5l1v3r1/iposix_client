package mx.com.banco.azteca.migration.document.model;

/**
 * @author Carlos Cuaya Xinto
 */
public class Document {
    
    private String idDocImx;
    private String nomDocImx;
    private String pagImx;
    private String rutImx;
    private String usuarioImx;
    private String wsImx;

    public String getIdDocImx() {
        return idDocImx;
    }

    public void setIdDocImx(String idDocImx) {
        this.idDocImx = idDocImx;
    }

    public String getNomDocImx() {
        return nomDocImx;
    }

    public void setNomDocImx(String nomDocImx) {
        this.nomDocImx = nomDocImx;
    }

    public String getPagImx() {
        return pagImx;
    }

    public void setPagImx(String pagImx) {
        this.pagImx = pagImx;
    }

    public String getRutImx() {
        return rutImx;
    }

    public void setRutImx(String rutImx) {
        this.rutImx = rutImx;
    }

    public String getUsuarioImx() {
        return usuarioImx;
    }

    public void setUsuarioImx(String usuarioImx) {
        this.usuarioImx = usuarioImx;
    }

    public String getWsImx() {
        return wsImx;
    }

    public void setWsImx(String wsImx) {
        this.wsImx = wsImx;
    }

    @Override
    public String toString() {
        return "Document{" + "idDocImx=" + idDocImx + 
               ", nomDocImx=" + nomDocImx + ", pagImx=" + pagImx + 
               ", rutImx=" + rutImx + ", usuarioImx=" + usuarioImx + 
               ", wsImx=" + wsImx + '}';
    }
    
}
