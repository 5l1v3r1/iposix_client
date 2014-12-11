package mx.com.banco.azteca.digitalizacion.model;

public class Pagina {

    private int NoPagina;
    private int IdDocImx;
    private int DocImx;
    private String NombreDocumento;
    private String RutaHtmlImagen;

    public Pagina(int IdDocImx, int DocImx, String NombreDocumento, String RutaHtmlImagen) {
        this.IdDocImx = IdDocImx;
        this.DocImx = IdDocImx;
        this.NombreDocumento = NombreDocumento;
        this.RutaHtmlImagen = RutaHtmlImagen;
    }

    public int getNoPagina() {
        return NoPagina;
    }

    public void setNoPagina(int NoPagina) {
        this.NoPagina = NoPagina;
    }

    public int getDocImx() {
        return DocImx;
    }

    public void setDocImx(int DocImx) {
        this.DocImx = DocImx;
    }

    public int getIdDocImx() {
        return IdDocImx;
    }

    public void setIdDocImx(int IdDocImx) {
        this.IdDocImx = IdDocImx;
    }

    public String getNombreDocumento() {
        return NombreDocumento;
    }

    public void setNombreDocumento(String NombreDocumento) {
        this.NombreDocumento = NombreDocumento;
    }

    public String getRutaHtmlImagen() {
        return RutaHtmlImagen;
    }

    public void setRutaHtmlImagen(String RutaHtmlImagen) {
        this.RutaHtmlImagen = RutaHtmlImagen;
    }

    @Override
    public String toString() {
        return NoPagina + "," + NombreDocumento + "," + IdDocImx + "," + DocImx + "," + RutaHtmlImagen;
    }
}
