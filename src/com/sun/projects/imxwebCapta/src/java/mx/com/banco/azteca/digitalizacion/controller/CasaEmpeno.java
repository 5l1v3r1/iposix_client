package mx.com.banco.azteca.digitalizacion.controller;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import mx.com.banco.azteca.digitalizacion.dao.CabezeroExpedienteDAO;
import mx.com.banco.azteca.digitalizacion.dao.ConexionBD;
import mx.com.banco.azteca.digitalizacion.dao.ExpedienteDAO;
import mx.com.banco.azteca.digitalizacion.dao.FoliosPorCliente;
import mx.com.banco.azteca.digitalizacion.model.Documental;
import mx.com.banco.azteca.digitalizacion.model.Documento;
import mx.com.banco.azteca.digitalizacion.model.Expediente;
import mx.com.banco.azteca.digitalizacion.model.Pagina;
import mx.com.banco.azteca.digitalizacion.util.Log;

public class CasaEmpeno {

    private Log ErrLog = new Log();
    private Connection conDB = null;
    private boolean vlblActivaTrace = false;
    private String vlstrEsquema = "";
    private String vlstrLlave = "";
    private String clienteUnico = "";
    private String vlstrServidorHttp = "";
    private String[] vlstrCabezero = new String[5];
    private int vlintNoExpedientes = 0;
    private List<String[]> lstFolios;
    private List<Expediente> lstExpedientes;
    //dato to get a digbb connection 
    private String applicationName;
    private String digbbConnectionName;

    public void setApplicationName(String applicationName) {
        this.applicationName = applicationName;
    }

    public void setDigbbConnectionName(String digbbConnectionName) {
        this.digbbConnectionName = digbbConnectionName;
    }

    private Documental documental;

    public int getNoExpedientes() {
        return vlintNoExpedientes;
    }

    /**
     *
     * @return Informacion del cabezero a mostrar
     */
    public String[] getCabezero() {
        return vlstrCabezero;
    }

    /**
     *
     * @param vlstrImx01 llave del expediente
     */
    public void setLlave(String vlstrLlave) {
        this.vlstrLlave = vlstrLlave;
    }

    /**
     * @param vlstrServidorHttp Servidor http apache para mostrar las imagenes
     */
    public void setServidorHttp(String vlstrServidorHttp) {

        if (vlstrServidorHttp.contains("10.63.5")) {
            vlstrServidorHttp = "http://10.63.100.185/";
        } else {
            vlstrServidorHttp = "http://" + vlstrServidorHttp + "/";
        }
        this.vlstrServidorHttp = vlstrServidorHttp;
    }

    /**
     *
     * @param Conexion de base de datos
     */
    public void setConexionBD(Connection conDB) {
        this.conDB = conDB;
    }

    /**
     * @param Activa Trace
     */
    public void setVlblActivaTrace(boolean vlblActivaTrace) {
        this.vlblActivaTrace = vlblActivaTrace;
    }

    /**
     * @param Esquema de base de datos
     */
    public void setEsquema(String vlstrEsquema) {
        this.vlstrEsquema = vlstrEsquema;
    }

    //Metodo que regresa todos los expedientes por folio.
    //Cada expediente tiene un documento y casa documento con sus respectivas paginas.
    public void getExpedientes(String producto, String ip) throws Exception {
        //lstExpedientes = new ArrayList<Expediente>();
        if (ip.contains("10.63.5")) {
            ip = "http://10.63.100.185/";
        } else {
            ip = "http://" + ip + "/";
        }

        CabezeroExpedienteDAO cabezero = new CabezeroExpedienteDAO();
        Expediente expediente = new Expediente();
        Documento docto = new Documento();

        ArrayList<String[]> arrCabezero = new ArrayList<String[]>();

        String strIdDocto = "";
        String strIdDoctoAux = "";

        int i = 0;
        int j = 0;

        try {

            cabezero.setDBOrigen(conDB);
            cabezero.setEsquema(vlstrEsquema);
            cabezero.setVlblActivaTrace(vlblActivaTrace);
            arrCabezero = cabezero.getCabezeroExpedienteCredito(vlstrLlave);

            //obtenemos el cabezero
            if (arrCabezero.size() > 0) {

                documental = new Documental(vlstrLlave);

                for (i = 0; i < arrCabezero.size(); i++) {

                    vlstrCabezero = (String[]) arrCabezero.get(i);

                    if (vlblActivaTrace) {
                        System.out.println("==================================================================");
                        System.out.println("Datos del cabecero");
                        System.out.println(">>LLAVE: " + vlstrCabezero[0] + " >>CLIENTE UNICO: " + vlstrCabezero[1]
                                + " >>FOLIO: " + vlstrCabezero[2] + " >>NOMBRE: " + vlstrCabezero[3]);
                        System.out.println("==================================================================");
                    }

                    strIdDocto = "";
                    strIdDoctoAux = "";

                    ExpedienteDAO expedientedao = new ExpedienteDAO();

                    expedientedao.setDBOrigen(conDB);
                    expedientedao.setEsquema(vlstrEsquema);
                    expedientedao.setVlblActivaTrace(vlblActivaTrace);

                    ArrayList<String[]> arrExpediente = new ArrayList<String[]>();
                    ArrayList<String[]> tmpLista = new ArrayList<String[]>();
                    System.out.println("3*****************************");
                    System.out.println("producto:" + producto);
                    System.out.println("folio:" + vlstrCabezero[4]);
                    System.out.println("http:" + vlstrServidorHttp);

                    /*ªªªªªOBTENEMOS LOS DOCUMENTOS Y PAGINAS DEL EXPEDIENTE UNICO ªªªªªªª*/
                    ArrayList<String[]> expedienteUnico = new ArrayList<String[]>();
                    expedienteUnico = expedientedao.getExpedienteUnico(vlstrCabezero[1], ip);
                    System.out.println("unique expedient size : " + expedienteUnico.size() );
                    for(String[] row : expedienteUnico){
                        System.out.println("row: " + Arrays.toString(row));
                    }

                    tmpLista = expedientedao.getExpediente(producto, vlstrCabezero[4], 1, 1, vlstrServidorHttp);//esta es la parte donde llama el metodo que llama la funcion en la bd que regresa todos los docs por folio

                    boolean addIfe = true;
                    boolean addDomi = true;
                    boolean addAviso = true;
                    boolean ordena = false;
                    if (expedienteUnico.size() > 0) {
                        for (String[] strings : tmpLista) {
                            if (strings[0].equals("Identificacion Oficial del Cliente") && addIfe) {
                                for (String[] exp : expedienteUnico) {
                                    if (exp[0].equals("Identificacion Oficial del Cliente")) {
                                        arrExpediente.add(exp);
                                    }
                                }
                                arrExpediente.add(strings);
                                addIfe = false;
                            } else if (strings[0].equals("Comprobante de Domicilio del Cliente") && addDomi) {
                                for (String[] exp : expedienteUnico) {
                                    if (exp[0].equals("Comprobante de Domicilio del Cliente")) {
                                        exp[1] = "3";
                                        arrExpediente.add(exp);
                                    }
                                }
                                arrExpediente.add(strings);
                                addDomi = false;
                            } else if (strings[0].equals("Aviso de Privacidad") && addAviso) {
                                for (String[] exp : expedienteUnico) {
                                    if (exp[0].equals("Aviso de Privacidad")) {
                                        exp[1] = "45";
                                        arrExpediente.add(exp);
                                    }
                                }
                                arrExpediente.add(strings);
                                addAviso = false;
                            } else {
                                arrExpediente.add(strings);
                            }

                        }

                        for (String[] exp : expedienteUnico) {
                            if (exp[0].equals("Identificacion Oficial del Cliente") && addIfe) {
                                arrExpediente.add(exp);
                                ordena = true;
                            }
                            if (exp[0].equals("Comprobante de Domicilio del Cliente") && addDomi) {
                                exp[1] = "3";
                                arrExpediente.add(exp);
                                ordena = true;

                            }
                            if (exp[0].equals("Aviso de Privacidad") && addAviso) {
                                exp[1] = "45";
                                arrExpediente.add(exp);
                                ordena = true;
                            }
                        }

                        if (ordena) {
                            arrExpediente = ordenaDocto(arrExpediente);
                        }

                    } else {
                        arrExpediente = tmpLista;
                    }

                    System.out.println("arrExpediente size:" + arrExpediente.size());
                    if (arrExpediente.size() > 0) {

                        for (j = 0; j < arrExpediente.size(); j++) {

                            String[] strRegistro = (String[]) arrExpediente.get(j);

                            if (j == 0) {

                                expediente = new Expediente(producto, vlstrCabezero[0], vlstrCabezero[3], vlstrCabezero[1], "");
                            }

                            strIdDocto = strRegistro[1];
                            if (!strIdDocto.equals(strIdDoctoAux)) {

                                if (docto != null) {
                                    docto = null;
                                }

                                docto = new Documento(strRegistro[0], Integer.parseInt(strRegistro[1]), Integer.parseInt(strRegistro[2]));
                                expediente.agregaDocumento(docto);
                                strIdDoctoAux = strRegistro[1];
                            }

                            Pagina pag = new Pagina(Integer.parseInt(strRegistro[1]), Integer.parseInt(strRegistro[2]), strRegistro[0], strRegistro[3]);
                            docto.agregaPagina(pag);
                        }

                        docto = null;
                        //System.out.println(expediente.toString());
                        documental.agregaExpediente(expediente);

                        expediente = null;
                    } 

                }
                
                vlstrCabezero = (String[]) arrCabezero.get(0);
                //vlintNoExpedientes = arrCabezero.size();
                
                vlintNoExpedientes = documental.getNoExpedientes();

                //arrCabezero = null;
            }else{
                
                //insert new code here (249461)
                List<Object[]> data;
                ExpedienteDAO expedientedao = new ExpedienteDAO();
                expedientedao.setVlblActivaTrace(vlblActivaTrace);
                ConexionBD dbConnection = new ConexionBD();
                dbConnection.setNombreAplicacion(applicationName);
                dbConnection.setNombrePool(digbbConnectionName);
                Connection digbb = ConexionBD.ConectaBD();
                data = expedientedao.getDataFromDigBB(vlstrLlave, digbb);
                String documentId = "";
                int docId = 0;
                vlstrCabezero = new String[4];
                
                for (j = 0; j < data.size(); j++) {

                    Object[] row = (Object[]) data.get(j);

                    if (j == 0) {
                        
                        documental = new Documental(vlstrLlave);
                        
                        vlstrCabezero[0] = row[4].toString();
                        vlstrCabezero[1] = row[5].toString();
                        vlstrCabezero[2] = row[6].toString();
                        vlstrCabezero[3] = row[7].toString();
                        
                        expediente = new Expediente(producto, 
                                                    vlstrLlave, 
                                                    vlstrCabezero[3], 
                                                    vlstrCabezero[1], 
                                                    "");
                    }


                    if (!documentId.equals(row[0].toString())) {

                        docId = Integer.parseInt(row[0].toString());

                        docto = new Documento( row[1].toString(), 
                                               docId, docId);

                        expediente.agregaDocumento(docto);

                        documentId = row[0].toString();
                    }

                    Pagina pag = new Pagina(docId, 
                                            docId, 
                                            row[2].toString(), 
                                            row[3].toString());
                    docto.agregaPagina(pag);
                }

                if (documental != null) {
                    documental.agregaExpediente(expediente);
                    vlintNoExpedientes = documental.getNoExpedientes();
                } else {
                    vlintNoExpedientes = 0;
                }
                
                
                
               // System.out.println(expediente.toString());

            }

        } catch (Exception e) {
            e.printStackTrace();
            ErrLog.grabaLog("imxwebCredito", "CasaEmpeno.getExpedientes", e);
        }
    }

    public void getFolios() throws Exception {
        //metodo que llena una lista con todos los folios que tiene un cliente unico. Esta parte es la que se usa en principal.jsp
        FoliosPorCliente folios = new FoliosPorCliente();
        try {
            //folios
            folios.setDBOrigen(conDB);
            folios.setEsquema(vlstrEsquema);
            folios.setVlblActivaTrace(vlblActivaTrace);
            setLstFolios(folios.getFoliosPorCliente(clienteUnico));//se creal la lista de folios
            System.out.println("Numero de folios**********************************:" + lstFolios.size());
        } catch (Exception e) {
            ErrLog.grabaLog("imxwebCredito", "Credito.getExpedientes", e);
        }
    }

    public ArrayList<String[]> ordenaDocto(ArrayList<String[]> entrada) {

        ArrayList<String[]> ife = new ArrayList<String[]>();
        ArrayList<String[]> domi = new ArrayList<String[]>();
        ArrayList<String[]> aviso = new ArrayList<String[]>();
        ArrayList<String[]> tmp = new ArrayList<String[]>();
        ArrayList<String[]> salida = new ArrayList<String[]>();

        for (String[] in : entrada) {
            if (in[0].equals("Aviso de Privacidad")) {
                aviso.add(in);
            } else if (in[0].equals("Identificacion Oficial del Cliente")) {
                ife.add(in);
            } else if (in[0].equals("Comprobante de Domicilio del Cliente")) {
                domi.add(in);
            } else {
                tmp.add(in);
            }
        }
        for (String[] strings : ife) {
            salida.add(strings);
        }
        for (String[] strings : domi) {
            salida.add(strings);
        }
        for (String[] strings : aviso) {
            salida.add(strings);
        }
        for (String[] strings : tmp) {
            salida.add(strings);
        }
        return salida;
    }

    /**
     * @return the lstFolios
     */
    public List<String[]> getLstFolios() {
        return lstFolios;
    }

    /**
     * @param lstFolios the lstFolios to set
     */
    public void setLstFolios(List<String[]> lstFolios) {
        this.lstFolios = lstFolios;
    }

    /**
     * @return the clienteUnico
     */
    public String getClienteUnico() {
        return clienteUnico;
    }

    /**
     * @param clienteUnico the clienteUnico to set
     */
    public void setClienteUnico(String clienteUnico) {
        this.clienteUnico = clienteUnico;
    }

    /**
     * @return the lstExpedientes
     */
    public List<Expediente> getLstExpedientes() {
        return lstExpedientes;
    }

    /**
     * @param lstExpedientes the lstExpedientes to set
     */
    public void setLstExpedientes(List<Expediente> lstExpedientes) {
        this.lstExpedientes = lstExpedientes;
    }

    /**
     * @return the documental
     */
    public Documental getDocumental() {
        return documental;
    }

    /**
     * @param documental the documental to set
     */
    public void setDocumental(Documental documental) {
        this.documental = documental;
    }
}
