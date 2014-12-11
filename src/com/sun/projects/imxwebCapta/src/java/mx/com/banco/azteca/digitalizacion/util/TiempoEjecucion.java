package mx.com.banco.azteca.digitalizacion.util;

import java.util.Calendar;

public class TiempoEjecucion {
	
	private Log ErrLog = new Log();
    private Calendar vlcalTimeInicio;
    private Calendar vlcalTimeFin;
    private String vlStrNombreStored;


    // Hora de incio
    public void setInicio(Calendar ccalInicio) {
        vlcalTimeInicio = ccalInicio;
        vlcalTimeInicio.setTime(new java.util.Date());
    }

    // Hora de fin
    public void setFin(Calendar ccalFin) {
        vlcalTimeFin = ccalFin;
        vlcalTimeFin.setTime(new java.util.Date());
    }

    //Nombre del estored que se esta miniendo el  tiempo de ejecucion
    public void setNombreStored(String cstrNombreStored) {
        vlStrNombreStored = cstrNombreStored;
    }

    public String strMideTiempo() {

        long contTimeIniMili = 0;
        long contTimeFinMili = 0;
        long contTimeTotal = 0;

        String strResult = "";

        try {

            contTimeIniMili = vlcalTimeInicio.getTimeInMillis();
            contTimeFinMili = vlcalTimeFin.getTimeInMillis();
            contTimeTotal = contTimeFinMili - contTimeIniMili;

            strResult = "TIEMPO========>>>>> La ejecucion de " + vlStrNombreStored + " es de: " + contTimeTotal + " milisegundos \r\n" +
                    /* "Inicio : " + vlcalTimeInicio.HOUR_OF_DAY + ":" + vlcalTimeInicio.MINUTE + ":" + vlcalTimeInicio.SECOND + "." + vlcalTimeInicio.MILLISECOND + "\r\n" +
                    "Fin    : " + vlcalTimeFin.HOUR_OF_DAY + ":" + vlcalTimeFin.MINUTE + ":" + vlcalTimeFin.SECOND + "." + vlcalTimeFin.MILLISECOND + "\r\n" +*/
                    "Inicio : " + contTimeIniMili + "\r\n" +
                    "Fin    : " + contTimeFinMili;

        } catch (Exception e) {                        
            ErrLog.grabaLog("DigWebServices", "TiempoEjecucion.strMideTiempo Exception", e);
        }

        return strResult;
    }
}
