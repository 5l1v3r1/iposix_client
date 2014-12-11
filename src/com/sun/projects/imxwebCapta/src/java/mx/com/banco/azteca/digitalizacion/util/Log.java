package mx.com.banco.azteca.digitalizacion.util;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.io.*;

public class Log {

    public void grabaLog(String strAplicacion, String strOrigen, String strMensaje) {

        Archivos utilArchivo = new Archivos();
        Calendar c = new GregorianCalendar();

        String strRutaLogApp = getRutaBase() + strAplicacion;
        String stringFecha = "";
        String strArchivoLog = "";

        FileWriter fichero = null;
        PrintWriter pw = null;

        try {

            strRutaLogApp = strRutaLogApp.contains("\\") ? strRutaLogApp + "\\" : strRutaLogApp + "/";

            utilArchivo.VerificaDirectorio(strRutaLogApp, strRutaLogApp.contains("\\") ? "windows" : "unix");

            stringFecha = utilArchivo.lpad(String.valueOf(c.get(Calendar.YEAR)), '0', 4) + utilArchivo.lpad(String.valueOf((c.get(Calendar.MONTH)) + 1), '0', 2) + utilArchivo.lpad(String.valueOf(c.get(Calendar.DATE)), '0', 2);

            strArchivoLog = strRutaLogApp + strAplicacion + stringFecha + ".log";

            if (!utilArchivo.ExisteArchivo(strArchivoLog)) {
                fichero = new FileWriter(strArchivoLog);
            } else {
                fichero = new FileWriter(strArchivoLog, true);
            }

            stringFecha = utilArchivo.lpad(String.valueOf(c.get(Calendar.YEAR)), '0', 4) + "/" + utilArchivo.lpad(String.valueOf((c.get(Calendar.MONTH)) + 1), '0', 2) + "/" + utilArchivo.lpad(String.valueOf(c.get(Calendar.DATE)), '0', 2) + " " + utilArchivo.lpad(String.valueOf(c.get(Calendar.HOUR_OF_DAY)), '0', 2) + ":" + utilArchivo.lpad(String.valueOf(c.get(Calendar.MINUTE)), '0', 2) + ":" + utilArchivo.lpad(String.valueOf(c.get(Calendar.SECOND)), '0', 2) + " -- ";

            pw = new PrintWriter(fichero);
            pw.println(stringFecha + strOrigen + ">>" + strMensaje);
            System.out.println(stringFecha + strOrigen + ">>" + strMensaje);

        } catch (Exception e) {
            System.out.println("Log.grabaLog Exception : " + e.toString());
        } finally {
            if (pw != null) {
                pw.close();
            }
        }

    }

    public void grabaLog(String strAplicacion, String strOrigen, Exception ex) {

        Archivos utilArchivo = new Archivos();
        Calendar c = new GregorianCalendar();

        String strRutaLogApp = getRutaBase() + strAplicacion;
        String stringFecha = "";
        String strArchivoLog = "";

        FileWriter fichero = null;
        PrintWriter pw = null;

        try {

            StringWriter sw = new StringWriter();
            PrintWriter pw1 = new PrintWriter(sw);
            ex.printStackTrace(pw1);

            strRutaLogApp = strRutaLogApp.contains("\\") ? strRutaLogApp + "\\" : strRutaLogApp + "/";

            utilArchivo.VerificaDirectorio(strRutaLogApp, strRutaLogApp.contains("\\") ? "windows" : "unix");

            stringFecha = utilArchivo.lpad(String.valueOf(c.get(Calendar.YEAR)), '0', 4) + utilArchivo.lpad(String.valueOf((c.get(Calendar.MONTH)) + 1), '0', 2) + utilArchivo.lpad(String.valueOf(c.get(Calendar.DATE)), '0', 2);

            strArchivoLog = strRutaLogApp + strAplicacion + stringFecha + ".log";

            if (!utilArchivo.ExisteArchivo(strArchivoLog)) {
                fichero = new FileWriter(strArchivoLog);
            } else {
                fichero = new FileWriter(strArchivoLog, true);
            }

            stringFecha = utilArchivo.lpad(String.valueOf(c.get(Calendar.YEAR)), '0', 4) + "/" + utilArchivo.lpad(String.valueOf((c.get(Calendar.MONTH)) + 1), '0', 2) + "/" + utilArchivo.lpad(String.valueOf(c.get(Calendar.DATE)), '0', 2) + " " + utilArchivo.lpad(String.valueOf(c.get(Calendar.HOUR_OF_DAY)), '0', 2) + ":" + utilArchivo.lpad(String.valueOf(c.get(Calendar.MINUTE)), '0', 2) + ":" + utilArchivo.lpad(String.valueOf(c.get(Calendar.SECOND)), '0', 2) + " -- ";

            pw = new PrintWriter(fichero);
            pw.println(stringFecha + strOrigen);
            pw.println("================================================================================");
            pw.println(sw.toString());
            pw.println("================================================================================");
            System.out.println(stringFecha + strOrigen + ">>" + sw.toString());

        } catch (Exception e) {
            System.out.println("Log.grabaLog Exception : " + e.toString());
        } finally {
            if (pw != null) {
                pw.close();
            }
        }

    }

    public String listarLogs(String strAplicacion) {

        String strRutaLogApp = getRutaBase() + strAplicacion;

        StringBuilder strLista = new StringBuilder();
        File fileList[];

        int i = 0;

        try {

            strRutaLogApp = strRutaLogApp.contains("\\") ? strRutaLogApp + "\\" : strRutaLogApp + "/";

            File dir = new File(strRutaLogApp);
            fileList = dir.listFiles();

            for (i = 0; i < fileList.length; i++) {

                if (fileList[i].isFile()) {

                    strLista.append(fileList[i].getName());
                    strLista.append("|");
                }
            }

        } catch (Exception e) {
            System.out.println("Log.listarLogs Exception : " + e.toString());
        }
        return strLista.toString();
    }

    public String mostrarLog(String strAplicacion, String strNombre) {

        String strRutaLogApp = getRutaBase() + strAplicacion;
        StringBuilder strResultado = new StringBuilder();
        String strLinea = "";
        BufferedReader br = null;
        FileReader fr = null;

        try {
            strRutaLogApp = (strRutaLogApp.contains("\\") ? strRutaLogApp + "\\" : strRutaLogApp + "/") + strNombre;

            fr = new FileReader(strRutaLogApp);
            br = new BufferedReader(fr);

            while ((strLinea = br.readLine()) != null) {
                strResultado.append(strLinea);
                strResultado.append("\r\n");

            }

        } catch (Exception e) {
            System.out.println("Log.mostrarLog Exception : " + e.toString());
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
                if (fr != null) {
                    fr.close();
                }
            } catch (Exception e) {
                System.out.println("Log.mostrarLog close Exception : " + e.toString());
            }
        }
        return strResultado.toString();
    }

    public boolean eliminarLog(String strAplicacion, String strNombre) {

        Archivos utilArchivo = new Archivos();
        String strRutaLogApp = getRutaBase() + strAplicacion;
        boolean blResultado = false;
        File archivoLog = null;

        try {

            utilArchivo.asignaPermisos(strRutaLogApp);

            strRutaLogApp = (strRutaLogApp.contains("\\") ? strRutaLogApp + "\\" : strRutaLogApp + "/") + strNombre;

            archivoLog = new File(strRutaLogApp);

            if (archivoLog.delete()) {
                blResultado = true;
            }

        } catch (Exception e) {
            System.out.println("Log.eliminarLog Exception : " + e.toString());
        }

        return blResultado;
    }

    private String getRutaBase() {

        Propiedades digProp = new Propiedades();
        Archivos utilArchivo = new Archivos();
        String strResultado = "";

        try {
            digProp.setNombreAplicacion("imxwebCredito");
            digProp.obtenConfiguracion();
            strResultado = digProp.getRutaBaseLogs();
            utilArchivo.VerificaDirectorio(strResultado, strResultado.contains("\\") ? "windows" : "unix");

        } catch (Exception e) {
            System.out.println("Log.getRutaBase Exception : " + e.toString());
        }

        return strResultado;

    }
}
