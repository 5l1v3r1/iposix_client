package mx.com.banco.azteca.digitalizacion.util;

import java.io.*;
import java.util.Properties;

public class Archivos {

	private Log logError = new Log();
	public String pool;	
    public static Properties p;
    
	// permisos
	public boolean asignaPermisos(String strRutaDir) {

		boolean blnValorRegresa = false;
		File flDir = new File(strRutaDir);
		Process proc0 = null;

		try {

			if (!flDir.exists()) {

					String ejA = "chmod -R 777 " + strRutaDir;
					proc0 = Runtime.getRuntime().exec(ejA);
					proc0.waitFor();
					blnValorRegresa = true;
					
				if (!blnValorRegresa) {					
					logError.grabaLog("imxwebCredito", "Archivos.asignaPermisos Error", "Problemas al asignar permisos " + strRutaDir);
				} 

			} else {

				blnValorRegresa = flDir.exists();

			}

		} catch (Exception e) {
			logError.grabaLog("imxwebCredito", "Archivos.VerificaDirectorio Exception", e);
		}
		return blnValorRegresa;
	}
	
	// verifica si existe un directorio
	// en caso de no existir lo crea
	public boolean VerificaDirectorio(String strRutaDir, String strSO) {

		boolean blnValorRegresa = false;
		File flDir = new File(strRutaDir);
		Process proc0 = null;

		try {

			if (!flDir.exists()) {

				if (strSO.equals("unix")) {
					String ejA = "mkdir -m777 -p " + strRutaDir;
					proc0 = Runtime.getRuntime().exec(ejA);
					proc0.waitFor();
					blnValorRegresa = true;
				}else{					
					blnValorRegresa = (new File(strRutaDir).mkdirs());
				}
				
				if (!blnValorRegresa) {
					
					logError.grabaLog("imxwebCredito", "Archivos.VerificaDirectorio Error", "Problemas al crear el directorio " + strRutaDir);
				} 

			} else {

				blnValorRegresa = flDir.exists();

			}

		} catch (Exception e) {
			logError.grabaLog("imxwebCredito", "Archivos.VerificaDirectorio Exception", e);
		}
		return blnValorRegresa;
	}
	
	
	// Completa con el caracter el numero
	// indicado del lado izquierdo de la cadena
	public String lpad(String strCadena, char chrPad, int intTamano) {

		char[] array = new char[intTamano];

		try {

			int len = intTamano - strCadena.length();

			for (int i = 0; i < len; i++) {
				array[i] = chrPad;
			}

			strCadena.getChars(0, strCadena.length(), array, intTamano - strCadena.length());

		} catch (Exception e) {
			logError.grabaLog("imxwebCredito", "Archivos.lpad Exception", e);
		}

		return String.valueOf(array);

	}

	// Verifica si existe el archivo
	public boolean ExisteArchivo(String strRuta) {
		boolean blnsalida = false;

		try {
			File file = new File(strRuta);
			if (file.exists()) {
				blnsalida = true;
			}
		} catch (Exception e) {
			logError.grabaLog("imxwebCredito", "Archivos.ExisteArchivo Exception", e);
		}
		return blnsalida;
	}
	
	

	public boolean EliminaArchivo(String strRuta) {

		boolean blResultado = false;

		try {

			File file = new File(strRuta);

			if (file.exists() && file.isFile()) {
				file.delete();
				blResultado = true;
			}

		} catch (Exception e) {
			logError.grabaLog("imxwebCredito", "Archivos.EliminaArchivo Exception", e);
		}

		return blResultado;
	}
	
	public void leeIni(String ArchivoIni,String sistema)
    {
      try
        {
              p = new Properties();
              p.load(new FileInputStream(ArchivoIni));
              pool = p.getProperty(sistema).trim();
        }
      catch (IOException e)
        {
              System.out.println("ArchivoIni" + e);
        }
    }
}
