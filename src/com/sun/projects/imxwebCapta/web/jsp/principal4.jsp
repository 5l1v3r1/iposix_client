<%@ page import="java.sql.Connection"%>
<%@ page import="mx.com.banco.azteca.digitalizacion.dao.ConexionBD"%>
<%@ page import="mx.com.banco.azteca.digitalizacion.util.*"%>
<%@ page import="mx.com.banco.azteca.digitalizacion.controller.*"%>
<%@ page import="mx.com.banco.azteca.digitalizacion.model.Documental"%>
<%@ page import="mx.com.banco.azteca.digitalizacion.model.Expediente"%>
<%@ page import="mx.com.banco.azteca.digitalizacion.model.Documento"%>
<%@ page import="mx.com.banco.azteca.digitalizacion.model.Pagina"%>
<%@ page import="java.util.ArrayList"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link href="../estilos/digitalizacion.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/digitalizacion.js"></script>
<title>Banco Azteca - Digitalizacion*</title>
</head>
<body>

<%
    
    
    String strLlave = request.getParameter("idExp") == null ? "" : request.getParameter("idExp") ;
    String servidorImagenesRNM = request.getServerName() ;//;"10.51.230.89"
    
   
    //servidorImagenesRNM="http://"+servidorImagenesRNM+"/";
    
    String gaveta = "CAPTACION";
    System.out.println("strLlave" + strLlave);
    System.out.println("gaveta:" + gaveta);

    
    Connection conBD = null;
    ConexionBD conexion = new ConexionBD();
    Propiedades prop = new Propiedades();
    Log ErrLog = new Log();
    CasaEmpeno casaEmpeno = new CasaEmpeno();
    Network red = new Network();
    Cripto validaVerifica = new Cripto();
    Fecha fechaVerifica = new Fecha();
    Documental documentalCuenta;
    ArrayList<Expediente> Expedientes;
    ArrayList<Documento> Documentos;
    ArrayList<Pagina> Paginas;

    StringBuilder strDescProducto = new StringBuilder();
    StringBuilder strDocumentos = new StringBuilder();
    StringBuilder strBaseDoctos = new StringBuilder();
    StringBuilder strDocumentosLCR = new StringBuilder();
    StringBuilder strDocumentoNoLCR = new StringBuilder();
    StringBuilder strArregloPaginas = new StringBuilder();

    String strNombreAplicacion = "imxwebCredito";
    String strOrigen = "principal4.jsp";
    String strEsquemaBD = "";

    
    String strhidRegional = "";
    String strMensaje="";
    String strProducto = "";
    String strNombreArreglo = "";
    String strEspacios = "";
    String ComplementoDocto = "";
    String strUrlRegional = "";

    String [] strCabezero ={"","","",""} ;

    int intgcc = -1;

    Paginas = null;
    Documentos = null;
    Expedientes = null;
    documentalCuenta = null;

    boolean blActivarTrace = true;
    boolean blDocumentoLCR = true;
    boolean blCabezeroLCR = true;


        try {

            validaVerifica.setNombreAplicacion(strNombreAplicacion);
            System.out.println("fecha:" + fechaVerifica.getFecha());

            String strVerifica = validaVerifica.verifica(fechaVerifica.getFecha());
            
            System.out.println("strVerifica: " + strVerifica);

            //obtener propiedades
            //ConexionBD pool
            prop.setNombreAplicacion(strNombreAplicacion);
            prop.obtenPoolConexiones();
            prop.obtenConfiguracion();
            blActivarTrace = prop.isActivaTrace();
            red.setVlblActivaTrace(blActivarTrace);
            conexion.setNombreAplicacion(strNombreAplicacion);
            conexion.setNombrePool(prop.getPoolConexionImaxBD());
            conexion.setActivarTrace(blActivarTrace);
            conBD = conexion.ConectaBD();
            strEsquemaBD = conexion.getEsquema();
            
            //digbb info
            casaEmpeno.setApplicationName(strNombreAplicacion);
            casaEmpeno.setDigbbConnectionName(prop.getDigbbConnectionName());

            casaEmpeno.setConexionBD(conBD);
            casaEmpeno.setEsquema(strEsquemaBD);
            casaEmpeno.setServidorHttp(servidorImagenesRNM);
            casaEmpeno.setLlave(strLlave);
            casaEmpeno.setVlblActivaTrace(blActivarTrace);
            casaEmpeno.getExpedientes(gaveta,servidorImagenesRNM);

            if(casaEmpeno.getNoExpedientes()> 0){
               // System.out.println("casaEmpeno.getNoExpedientes()> 0 strLlave----------->" + strLlave);

                if(blActivarTrace){
                    System.out.println("principal4.jsp>> Numero de expedientes " + casaEmpeno.getNoExpedientes());
                }
                strCabezero = casaEmpeno.getCabezero();
                documentalCuenta = casaEmpeno.getDocumental();

                Expedientes = documentalCuenta.getExpedientes();
                System.out.println("nombre***" + Expedientes.get(0).getNombreCliente());
                System.out.println("nombre del doc**:" + Expedientes.get(0).getDocumentos().get(0).getNombreDocumento());

                strArregloPaginas.append("<script type=\"text/javascript\">");

                for (Expediente e : Expedientes) {
                    if(blActivarTrace){
                        System.out.println("Existe al menos un expediente de credito>>>> " + documentalCuenta.getExisteExpCredito());
                    }
                    System.out.println("e.getProducto*:" + e.getProducto());
                    strProducto = e.getProducto();
                    Documentos = e.getDocumentos();

                    if(intgcc == 2){
                        strEspacios = "";
                    }else{
                        strEspacios = "&nbsp;&nbsp;&nbsp;&nbsp;";
                    }
                    String nombreProducto = "";
                    for (Documento d : Documentos) {

                        if(e.getProducto().equals("REC_HUMANOS")){
                            nombreProducto = "RECURSOS HUMANOS";
                        }
                        if(e.getProducto().equals("NOTIFICACIONEMP")){
                            nombreProducto = "NOTIFICACION EMPLEADO";
                        }
                        if(e.getProducto().equals("MICRONEGAZTECA_W")){
                            nombreProducto = "MICRONEGOCIO";
                        }

                        if(e.getProducto().equals("CASAEMP_WEB")){
                            nombreProducto = "CASA DE EMPE�O";
                        }
                        if(e.getProducto().equals("CAPTACION")){
                            nombreProducto = "CAPTACION";
                        }

                        nombreProducto = !nombreProducto.equals("") ? nombreProducto : e.getProducto();//En caso de que no se haya puesto el
                                                                                                      //nombre para ese producto
                        strBaseDoctos.append("                                                      " + strEspacios + "<img src='../media/iconodocumentos.png' alt='" + d.getNombreDocumento()+ "'>&nbsp;&nbsp;</img>");
                        strBaseDoctos.append("<span id='" + e.getProducto() +"ID" + d.getIdDocImx()+
                                             "' class='txtDocumento' onMouseOver='cursorLink();' "+
                                             "onMouseup='cursorNormal();' onMouseOut='cursorNormal();' "+
                                             " onClick=\"actualizaCabezero('EXPEDIENTE DE " + nombreProducto +
                                             "');" +
                                             " cargaPaginas('" + d.getNombreDocumento() + "'," + d.getNumeroPaginas() +
                                             ",1,loadAProDoc" + e.getNoExpediente() +  d.getIdDocImx() + "()," + strVerifica +
                                             "," + (blActivarTrace ? 1 : 0));
                        ComplementoDocto =" >" + d.getNombreDocumento() + "</span>\r\n                          <br />\r\n";

                       //if(!documentalCuenta.getExisteExpCredito()){
                        strBaseDoctos.append(");\"");
                        strBaseDoctos.append(ComplementoDocto);
                        strDocumentoNoLCR.append(strBaseDoctos.toString());
                        blDocumentoLCR = false;

                        System.out.println("strBaseDoctos:" + strBaseDoctos.toString());
                        strBaseDoctos.delete(0, strBaseDoctos.length());
                        /*if(true){


                           if(e.getProducto().equals("REC_HUMANOS")){

                               blDocumentoLCR = false;

                               if(!blDocumentoLCR){
                                    strBaseDoctos.append(");\"");
                                    strBaseDoctos.append(ComplementoDocto);
                                    strDocumentoNoLCR.append(strBaseDoctos.toString());
                                    blDocumentoLCR = false;
                                }

                            }
                            System.out.println("strBaseDoctos:" + strBaseDoctos.toString());
                            strBaseDoctos.delete(0, strBaseDoctos.length());
                       }*/

                        strNombreArreglo = "aProDoc" + e.getNoExpediente() +  d.getIdDocImx();
                        strArregloPaginas.append("\r\n");
                        strArregloPaginas.append("\r\n");
                        strArregloPaginas.append("  function loadAProDoc" + e.getNoExpediente() + d.getIdDocImx() + "() {");
                        strArregloPaginas.append("\r\n");
                        strArregloPaginas.append("      var " + strNombreArreglo + " = new Array(" + String.valueOf(d.getNumeroPaginas() + 1) + ");");
                        strArregloPaginas.append("\r\n");

                        Paginas = d.getPaginas();

                        for (Pagina p : Paginas) {
                            System.out.println("rutaImagen**********:" + p.getRutaHtmlImagen());
                            strArregloPaginas.append(strNombreArreglo + "[" + p.getNoPagina() + "]=\"" + p.getRutaHtmlImagen() + "\";");
                            strArregloPaginas.append("\r\n");
                        }
                        strArregloPaginas.append("      return " + strNombreArreglo + ";");
                        strArregloPaginas.append("\r\n");
                        strArregloPaginas.append("  }");
                        strArregloPaginas.append("\r\n");

                    }
                    strDescProducto.append("                      <img src='../media/icono" + strProducto.toLowerCase() + ".PNG' alt='" + strProducto + "'>&nbsp;&nbsp;</img>");

                    if(strProducto.equals("REC_HUMANOS")){
                        strProducto = "RECURSOS HUMANOS";
                    }

                    strDescProducto.append("                      <span class='txtProducto'>" + nombreProducto +"</span>");//Aqui va la parte que esta arriba de los docs. Y es el titulo como se vera.
                    strDescProducto.append("\r\n");
                    strDescProducto.append("                      <br />");
                    strDescProducto.append("\r\n");



                    if(documentalCuenta.getExisteExpCredito()){
                        strDocumentos.append(strDescProducto.toString());
                        strDocumentos.append(strBaseDoctos.toString());
                    }else{
                        strDocumentos.append(strDocumentosLCR.toString());
                        strDocumentos.append(strDescProducto.toString());
                        strDocumentos.append(strDocumentoNoLCR.toString());
                    }
                    strBaseDoctos.delete(0, strBaseDoctos.length());
                    strDescProducto.delete(0,strDescProducto.length());
                }
                strArregloPaginas.append("\r\n");
                strArregloPaginas.append("</script>");
                strArregloPaginas.append("\r\n");
                strArregloPaginas.append("\r\n");
            }else{
                System.out.println("casaEmpeno.getNoExpedientes()= 0 strLlave----------->" + strLlave);
                if(strLlave.equals("")){
                    strMensaje = "Datos Incorrectos";

                }else{
                    strMensaje = "No existen expedientes digitalizados en central";

                }
            }System.out.println("strMensaje----------->" + strMensaje);
    %>
        <%=strArregloPaginas.toString()%>
        <div id="principal">
            <table class="tblPrincipal">
                <tr>
                    <td rowspan="2" valign="top" style="width: 250px">
					<div id="ayuda">

						<table style="width: 100%; text-align:center">
							<tr>
								<td><img src="../media/ayuda.jpg" alt='Ayuda' onClick="window.open('http://10.63.100.185:8080/DigVisor/ayuda/ayuda.html', '_blank');"></img></td>
								<td><img src="../media/insvisor.png" alt='Instalar visor de imagenes' onClick="window.open('http://10.63.100.185:8080/DigVisor/ayuda/ayuda.html', '_blank');"></img></td>
							</tr>
						</table>

					</div>
                        <div id="documentos">
                            <%=strDocumentos.toString()%>
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                        <br />
                    </td>
                    <td valign="top">
                        <div id="cabezero">
                            <table class="tblCabezero" cellspacing="1" cellpadding="1">
                                <tr>
                                    <td colspan="4" class="tituloCabezero"><img src="../media/expediente.png" width="15px" height="15px"></img>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<label id="lblCabProducto">EXPEDIENTE DIGITALIZADO</label>
                                    </td>
                                </tr>
                                <tr class="grisclaro">
                                    <td>CUENTA AHORRO</td>
                                    <td>CLIENTE UNICO</td>
                                    <td>NOMBRE</td>
                                    <td>ULTIMA ACTUALIZACION</td>
                                </tr>
                                <tr class="gris">
                                    <td><label id="cuenta"><%=strCabezero[0]%></label></td>
                                    <td><label id="clienteunico"><%=strCabezero[1]%></label></td>
                                    <td><label id="nombre"><%=strCabezero[3]%></label></td>
                                    <td><label id="folio"><%=strCabezero[2]%></label></td>
                                </tr>
                            </table>
                            <table class="tblCabezero">
                                <tr class="tblPaginacion">
                                    <td>
                                    <table class="tblCabezero">
                                        <tr>
                                            <td>P&aacute;gina</td>
                                            <td><label id="paginaActuallbl">0</label></td>
                                            <td>de</td>
                                            <td><label id="totalPaginalbl">0</label></td>
                                        </tr>
                                    </table>
                                    </td>
                                    <td>
                                    <table style="width: 100%">
                                        <tr>
                                            <td><img src="../media/inicio.png" alt='Primera P&aacute;gina' width="12px" height="12px" id="inicio" onclick="navegaPaginas(<%=strVerifica%>,<%=blActivarTrace ? 1 : 0%>,arrActivo,'inicio');"  onMouseOver="cursorLink();" onMouseup="cursorNormal();" onMouseOut="cursorNormal();"></img></td>
                                            <td><img src="../media/anterior.png" alt='P&aacute;gina anterior' width="12px" height="12px" id="anterior" onclick="navegaPaginas(<%=strVerifica%>,<%=blActivarTrace ? 1 : 0%>,arrActivo,'anterior'); " onMouseOver="cursorLink();" onMouseup="cursorNormal();" onMouseOut="cursorNormal();"></img></td>
                                            <td><img src="../media/siguiente.png" alt='Siguiente P&aacute;gina' width="12px" height="12px" id="siguiente" onclick="navegaPaginas(<%=strVerifica%>,<%=blActivarTrace ? 1 : 0%>,arrActivo,'siguiente');" onMouseOver="cursorLink();" onMouseup="cursorNormal();" onMouseOut="cursorNormal();"></img></td>
                                            <td><img src="../media/fin.png" alt='Ultima P&aacute;gina' width="12px" height="12px" id="fin" onclick="navegaPaginas(<%=strVerifica%>,<%=blActivarTrace ? 1 : 0%>,arrActivo,'fin');" onMouseOver="cursorLink();" onMouseup="cursorNormal();" onMouseOut="cursorNormal();"></img></td>
                                        </tr>
                                    </table>
                                    </td>
                                    <td><img src="../media/impresion.jpg" alt='Digitalizacion' width="100px" height="15px"></img></td>
                                    <td>

                                        <img src="../media/moverapagina.png" style="CURSOR:hand" alt='Ir a la P&aacute;gina' width="100px" height="15px" onclick="navegaPaginas(<%=strVerifica%>,<%=blActivarTrace ? 1 : 0%>,arrActivo,'irAPagina');"></img>&nbsp;&nbsp;
                                        <input maxlength="4" id="idPaginas" name="Text1" type="text" style="width: 48px"/>


                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="center">
                        <br/>
                        <label id="lblNombreDocto" class="txtmsgAlerta"></label>
                        <br/>
                        <div id="DigLoading"></div> <!--loader-->
                        <br/>
                        <div id="imageContainer">
                            <br/>
                                <label id="msgAlerta" class="txtmsgAlerta"></label>
                            <br/>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    <%
        if(!strMensaje.equals("")){
%>
            <script>digMsgBox('<%=strMensaje%>');</script>

    <%}



        } catch (Exception e) {
            ErrLog.grabaLog(strNombreAplicacion, strOrigen, e);
    %>
            <script>digMsgBox('Ocurrio un error!!');</script>
    <%
        } finally {

            if (blActivarTrace) {
                System.out.println("imxwebCredito principal4.jsp Conexion BD esta cerrada? " + conBD.isClosed());
            }

            if (conBD != null) {
                conBD.close();
            }

            if (blActivarTrace) {
                System.out.println("imxwebCredito principal4.jsp Conexion BD esta cerrada? " + conBD.isClosed());
            }

            conBD = null;

            if (documentalCuenta != null) {
                documentalCuenta.setNoExpedientes(0);
                documentalCuenta = null;
            }

            System.gc();
        }
%>

</body>
</html>