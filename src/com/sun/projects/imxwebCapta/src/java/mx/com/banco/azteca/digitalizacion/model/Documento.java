package mx.com.banco.azteca.digitalizacion.model;

import java.util.ArrayList;

public class Documento {

    private int NoDocumentoExpe;
    private String NombreDocumento;
    private int IdDocImx;
    private int DocImx;
    private ArrayList<Pagina> Paginas;
    private int numeroPaginas = 0;

    public Documento() {
        Paginas = new ArrayList<Pagina>();
    }

    public Documento(String NombreDocumento, int IdDocImx, int DocImx) {
        this();
        this.NombreDocumento = NombreDocumento;
        this.IdDocImx = IdDocImx;
        this.DocImx = DocImx;

    }

    public void agregaPagina(Pagina pagina) {
        pagina.setNoPagina(++numeroPaginas);
        Paginas.add(pagina);
    }

    public int getDocImx() {
        return DocImx;
    }

    public void setDocImx(int DocImx) {
        this.DocImx = DocImx;
    }

    public int getNoDocumentoExpe() {
        return NoDocumentoExpe;
    }

    public void setNoDocumentoExpe(int NoDocumentoExpe) {
        this.NoDocumentoExpe = NoDocumentoExpe;
    }

    public int getNumeroPaginas() {
        return numeroPaginas;
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

    public ArrayList<Pagina> getPaginas() {
        return Paginas;
    }


    @Override
    public String toString() {

        StringBuilder printPaginas = new StringBuilder();

        printPaginas.append("================================================================");
        printPaginas.append("\r\n");
        printPaginas.append("Documento      : " + NombreDocumento);
        printPaginas.append("\r\n");
        printPaginas.append("Id Documento   : " + IdDocImx);
        printPaginas.append("\r\n");
        printPaginas.append("DocImx         : " + DocImx);
        printPaginas.append("\r\n");
        printPaginas.append("No. Paginas    : " + numeroPaginas);
        printPaginas.append("\r\n");
        printPaginas.append("----------------------------------------------------------------");
        printPaginas.append("\r\n");
        printPaginas.append("----------------------------------------------------------------");
        printPaginas.append("\r\n");

        for (Pagina p : Paginas) {
            printPaginas.append(p.getNoPagina());
            printPaginas.append("  ");
            printPaginas.append(p.getNombreDocumento());
            printPaginas.append("  ");
            printPaginas.append(p.getIdDocImx());
            printPaginas.append("  ");
            printPaginas.append(p.getDocImx());
            printPaginas.append("  ");
            printPaginas.append(p.getRutaHtmlImagen());
            printPaginas.append("\r\n");
        }
        printPaginas.append("\r\n");
        printPaginas.append("================================================================");

        return printPaginas.toString();

    }

    
}
