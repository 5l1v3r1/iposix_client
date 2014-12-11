package mx.com.banco.azteca.digitalizacion.model;

import java.util.ArrayList;

public class Expediente {

    private int NoExpediente;
    private String Producto;
    private String Cuenta;
    private String llave;
    private String NombreCliente;
    private String ClienteUnico;
    private String FechaIndexacion;
    private ArrayList<Documento> Documentos;
    private int numeroDoctos = 0;

    public Expediente() {
        Documentos = new ArrayList<Documento>();
    }

    public Expediente(String Producto, String Cuenta, String NombreCliente,
            String ClienteUnico, String FechaIndexacion) {
        this();
        this.Producto = Producto;
        this.Cuenta = Cuenta;
        this.NombreCliente = NombreCliente;
        this.ClienteUnico = ClienteUnico;
        this.FechaIndexacion = FechaIndexacion;

    }

    public Expediente(String Cuenta, String NombreCliente,  String FechaIndexacion) {
        this();
        this.Cuenta = Cuenta;
        this.NombreCliente = NombreCliente;
        this.FechaIndexacion = FechaIndexacion;

    }

    public int getNoExpediente() {
        return NoExpediente;
    }

    public void setNoExpediente(int NoExpediente) {
        this.NoExpediente = NoExpediente;
    }

    public String getProducto() {
        return Producto;
    }

    public void setProducto(String Producto) {
        this.Producto = Producto;
    }

    public String getCuenta() {
        return Cuenta;
    }

    public void setCuenta(String Cuenta) {
        this.Cuenta = Cuenta;
    }

    public String getNombreCliente() {
        return NombreCliente;
    }

    public void setNombreCliente(String NombreCliente) {
        this.NombreCliente = NombreCliente;
    }

    public String getClienteUnico() {
        return ClienteUnico;
    }

    public void setClienteUnico(String ClienteUnico) {
        this.ClienteUnico = ClienteUnico;
    }

    public String getFechaIndexacion() {
        return FechaIndexacion;
    }

    public void setFechaIndexacion(String FechaIndexacion) {
        this.FechaIndexacion = FechaIndexacion;
    }

    public ArrayList<Documento> getDocumentos() {
        return Documentos;
    }

    public int getNumeroDoctos() {
        return numeroDoctos;
    }

    public void agregaDocumento(Documento documento) {
        documento.setNoDocumentoExpe(++numeroDoctos);
        Documentos.add(documento);
    }

    @Override
    public String toString() {

        StringBuilder printDocumentos = new StringBuilder();

        printDocumentos.append("================================================================");
        printDocumentos.append("\r\n");
        printDocumentos.append("Producto***           : " + Producto);
        printDocumentos.append("\r\n");
        printDocumentos.append("Cuenta             : " + Cuenta);
        printDocumentos.append("\r\n");
        printDocumentos.append("Nombre             : " + NombreCliente);
        printDocumentos.append("\r\n");
        printDocumentos.append("Cliente Unico      : " + ClienteUnico);
        printDocumentos.append("\r\n");
        printDocumentos.append("Fecha Indexacion   : " + FechaIndexacion);
        printDocumentos.append("\r\n");
        printDocumentos.append("No. Documentos     : " + numeroDoctos);
        printDocumentos.append("\r\n");
        printDocumentos.append("----------------------------------------------------------------");
        printDocumentos.append("\r\n");
        printDocumentos.append("----------------------------------------------------------------");
        printDocumentos.append("\r\n");

        for (Documento d : Documentos) {
            printDocumentos.append(d.getNoDocumentoExpe());
            printDocumentos.append("  ");
            printDocumentos.append(d.getNombreDocumento());
            printDocumentos.append("  ");
            printDocumentos.append(d.getIdDocImx());
            printDocumentos.append("  ");
            printDocumentos.append(d.getDocImx());
            printDocumentos.append("  ");
            printDocumentos.append(d.getPaginas().size());
            printDocumentos.append("\r\n");
        }
        printDocumentos.append("\r\n");
        printDocumentos.append("================================================================");

        return printDocumentos.toString();

    }

    /**
     * @return the llave
     */
    public String getLlave() {
        return llave;
    }

    /**
     * @param llave the llave to set
     */
    public void setLlave(String llave) {
        this.llave = llave;
    }
}
