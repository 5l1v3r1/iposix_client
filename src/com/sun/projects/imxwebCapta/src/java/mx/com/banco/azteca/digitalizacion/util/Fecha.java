package mx.com.banco.azteca.digitalizacion.util;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Fecha {

    private Log digLog = new Log();

    	public String getFecha() {

		Archivos utilArchivo = new Archivos();
		Calendar c = new GregorianCalendar();

		String stringFecha = "";

		try {

			stringFecha = utilArchivo.lpad(String.valueOf(c.get(Calendar.YEAR)), '0', 4)
					+ utilArchivo.lpad(String.valueOf((c.get(Calendar.MONTH)) + 1), '0', 2)
					+ utilArchivo.lpad(String.valueOf(c.get(Calendar.DATE)), '0', 2);

		} catch (Exception e) {
			digLog.grabaLog("microNegocioAztecaWeb", "Fecha.getFecha Exception", e);
		}
		return stringFecha;
	}

}
