package mx.com.banco.azteca.digitalizacion.model;

import java.util.ArrayList;

/**
 *
 * @author conjunto de expedientes
 */
public class Documental {

    private int Id;
    private String Cuenta;
    private ArrayList<Expediente> Expedientes;
    private static int contador = 0;
    private int numeroExpedientes = 0;
    private boolean ExisteExpCredito = false;

    /**
     *
     * @return si contiene al menos un
     * expediente de credito
     */
    public boolean getExisteExpCredito() {
        return ExisteExpCredito;
    }

    public void setExisteExpCredito(boolean ExisteExpCredito) {
        this.ExisteExpCredito = ExisteExpCredito;
    }

    public Documental() {
        Id = ++contador;
        Expedientes = new ArrayList<Expediente>();
    }

    public Documental(String Cuenta) {
        this();
        this.Cuenta = Cuenta;
    }

    public int getId() {
        return Id;
    }

    public String getCuenta() {
        return Cuenta;
    }

    public void setCuenta(String Cuenta) {
        this.Cuenta = Cuenta;
    }

    public ArrayList<Expediente> getExpedientes() {
        return Expedientes;
    }

    public int getNoExpedientes() {
        return numeroExpedientes;
    }

    public void setNoExpedientes(int numeroExpedientes) {
        this.numeroExpedientes = numeroExpedientes;
    }

    public void agregaExpediente(Expediente expediente) {
        expediente.setNoExpediente(++numeroExpedientes);
        Expedientes.add(expediente);
    }

    @Override
    public String toString() {

        StringBuilder printDocumentos = new StringBuilder();

        printDocumentos.append("================================================================");
        printDocumentos.append("\r\n");
        printDocumentos.append("Cuenta             : " + Cuenta);
        printDocumentos.append("\r\n");
        printDocumentos.append("No. Expedientes*    : " + numeroExpedientes);
        printDocumentos.append("\r\n");
        printDocumentos.append("----------------------------------------------------------------");
        printDocumentos.append("\r\n");
        printDocumentos.append("----------------------------------------------------------------");
        printDocumentos.append("\r\n");

        for (Expediente e : Expedientes) {
            printDocumentos.append(e.getProducto());
            printDocumentos.append("  ");
            printDocumentos.append(e.getCuenta());
            printDocumentos.append("  ");
            printDocumentos.append(e.getNombreCliente());
            printDocumentos.append("  ");
            printDocumentos.append(e.getClienteUnico());
            printDocumentos.append("  ");
            printDocumentos.append(e.getFechaIndexacion());
            printDocumentos.append("  ");
            printDocumentos.append(e.getNumeroDoctos());
            printDocumentos.append("\r\n");
        }
        printDocumentos.append("\r\n");
        printDocumentos.append("================================================================");

        return printDocumentos.toString();

    }
}
