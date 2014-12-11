
<%@ page import="mx.com.banco.azteca.digitalizacion.util.Cripto"%>
<%@ page import="mx.com.banco.azteca.digitalizacion.util.Fecha"%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


    <%
        Cripto validaVerifica = new Cripto();
        Fecha fechaVerifica = new Fecha();
        boolean activaTrace = false;
        String rutaImagen = "";
        String extensionImagen = "";
        String verifica = "";
        //Thread.sleep(2000);
        if (request.getParameter("activaTrace") != null &&
                request.getParameter("activaTrace").equals("1")) {
            activaTrace = true;
        }

        if (request.getParameter("rutaImagen") != null) {
            rutaImagen = request.getParameter("rutaImagen").trim();
        }

        if (request.getParameter("verifica") != null) {
            verifica = request.getParameter("verifica").trim();
        }
        if(activaTrace){
            System.out.println("=========================================================");
            System.out.println("Parametros imxwebCredito principal4.jsp");
            System.out.println("rutaImagen  : " + rutaImagen);
            System.out.println("verifica    : " + verifica);
            System.out.println("=========================================================");

        }

        if(activaTrace){
            System.out.println("verifica fecha  : " + fechaVerifica.getFecha().trim());
            System.out.println("verifica        : " + validaVerifica.verifica(fechaVerifica.getFecha().trim()));
            System.out.println("extension       : " + rutaImagen.substring(rutaImagen.length()-3));
        }

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../estilos/digitalizacion.css" rel="stylesheet" type="text/css" />
<%
    if(!activaTrace){
%>
        <script src='../js/digitalizacion.js'></script>
<%
    }
%>
    <title>Imagenes Digitalizacion</title>
</head>
<body>

<%

        if ((verifica != null &&
                verifica != "" &&
                validaVerifica.verifica(fechaVerifica.getFecha().trim()).equals(verifica)) &&
                (rutaImagen != null &&
                rutaImagen != "")) {


            if(rutaImagen.substring(rutaImagen.length()-3).toLowerCase().equals("tif") ||
               rutaImagen.substring(rutaImagen.length()-4).toLowerCase().equals("tiff")){
                System.out.println("Entro al if de imagen.jsp ***********_______________/////");
%>
    <embed src="<%=rutaImagen%>" access=512 toolbaritems="_,PR,QP,OF,SA,CC,SE,_,ZO,PA,_,BF,FW,FH,FS,SS,_,O4,O1,O2,O3,O6,O5,_,SM,NE" smooth=yes width="100%" height="542" type="image/tiff">

<%
            }else if(rutaImagen.substring(rutaImagen.length()-3).toLowerCase().equals("jpg")){
%>
    <table align="center" class="tablaImage">
        <tr>
            <td align="center" valign="middle">
                <div style="width:100%; height:100%; overflow: scroll;">
                    <img src="<%=rutaImagen%>">
                </div>
            </td>
        </tr>
   </table>
<%
            }else{
%>                       
    <table align="center" class="tablaImage">
            <tr>
                <td align="center" valign="middle">
                   <img src="../img/warning.png" width="128" height="128">
               </td>
            <tr>
               <td align="center" valign="middle" class="warningtxt">
                   Formato invalido
               </td>
            </tr>
    </table>
<%
            }

        } else {
    %>
    <table align="center" class="tablaImage">
        <tr>
            <td align="center" valign="middle">
                <img src="../img/warning.png" width="128" height="128">
            </td>
        <tr>
           <td align="center" valign="middle" class="warningtxt">
               Favor de validar los par&aacute;metros
           </td>
        </tr>
    </table>
    <%
    }
    %>
                
</body>
</html>
