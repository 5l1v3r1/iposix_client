package mx.com.banco.azteca.digitalizacion.util;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.lang.StringUtils;

import com.oreilly.servlet.*;

public class Cripto {

    private String vlstrNombreAplicacion = "";

    public void setNombreAplicacion(String cstrNombreAplicacion) {
        vlstrNombreAplicacion = cstrNombreAplicacion;
    }
    private Log ErroLog = new Log();

    public String encripta(String strCadena, String strKey, String strAlgorit) {

        String strResult = "";
        byte[] sessionKey = strKey.getBytes();
        SecretKeySpec secret = new SecretKeySpec(sessionKey, strAlgorit);
        byte[] plaintext = strCadena.getBytes();

        try {

            Cipher cipher = Cipher.getInstance(strAlgorit);
            cipher.init(Cipher.ENCRYPT_MODE, secret);
            byte[] ciphertext = cipher.doFinal(plaintext);
            // System.out.println(ciphertext.toString());
            strResult = new String(asHex(ciphertext));

        } catch (Exception e) {
            ErroLog.grabaLog(vlstrNombreAplicacion, "Cripto.encripta Exception", e);
        }
        return strResult;
    }

    public String desEncripta(String strCadena, String strKey, String strAlgorit) {

        String strResult = "";
        byte[] sessionKey = strKey.getBytes();
        SecretKeySpec secret = new SecretKeySpec(sessionKey, strAlgorit);

        try {

            Cipher cipher = Cipher.getInstance(strAlgorit);
            cipher.init(Cipher.DECRYPT_MODE, secret);
            strResult = new String(cipher.doFinal(hexStringToByteArray(strCadena)));

        } catch (Exception e) {
            ErroLog.grabaLog(vlstrNombreAplicacion, "Cripto.desEncripta Exception", e);
        }
        return strResult;
    }

    private String asHex(byte buf[]) {
        StringBuffer strbuf = new StringBuffer(buf.length * 2);
        int i;

        try {

            for (i = 0; i < buf.length; i++) {
                if (((int) buf[i] & 0xff) < 0x10) {
                    strbuf.append("0");
                }

                strbuf.append(Long.toString((int) buf[i] & 0xff, 16));
            }

        } catch (Exception e) {
            ErroLog.grabaLog(vlstrNombreAplicacion, "Cripto.asHex Exception", e);
        }
        return strbuf.toString();
    }

    private byte[] hexStringToByteArray(String s) {

        int len = s.length();
        byte[] data = new byte[len / 2];
        try {

            for (int i = 0; i < len; i += 2) {
                data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4) + Character.digit(s.charAt(i + 1), 16));
            }

        } catch (Exception e) {
            ErroLog.grabaLog(vlstrNombreAplicacion, "Cripto.hexStringToByteArray Exception", e);
        }
        return data;
    }

    public String codif(String strCadena) {

        StringBuilder strResultado = new StringBuilder();
        String encodedText = "";

        try {

            for (int i = 0; i < strCadena.length(); i++) {
                for (int j = 0; j < 256; j++) {
                    if (strCadena.charAt(i) == (char) j) {
                        strResultado.append(Integer.toHexString(Integer.valueOf((char) (j + 7))));
                    }
                }
            }
            encodedText = new String(Base64Encoder.encode(strResultado.toString().getBytes()));

        } catch (Exception e) {
            ErroLog.grabaLog(vlstrNombreAplicacion, "Cripto.codif Exception", e);
        }

        return encodedText;
    }

    public String decodif(String strCadena) {

        StringBuilder strResultado = new StringBuilder();
        StringBuilder strAux = new StringBuilder();
        int k = 0;

        try {

            strCadena = new String(Base64Decoder.decode(strCadena));

            for (int i = 0; i < strCadena.length(); i++) {

                if (k == 1) {

                    strAux.append(strCadena.charAt(i));

                    int value = Integer.parseInt(strAux.toString(), 16);

                    for (int j = 0; j < 256; j++) {
                        if ((char) value == (char) j) {
                            strResultado.append((char) (j - 7));
                        }
                    }

                    k = 0;
                    strAux.delete(0, strAux.length());
                } else {
                    strAux.append(strCadena.charAt(i));
                    k++;
                }
            }

        } catch (Exception e) {
            ErroLog.grabaLog(vlstrNombreAplicacion, "Cripto.decodif Exception", e);
        }

        return strResultado.toString();
    }

    public String verifica(String cadena) {

        String nones = "";
        String pares = "";

        boolean non = true;
        int totalNon = 0;
        int totalPar = 0;
        int i = 0;
        int digVer = 0;

        //cadena = decodif(cadena);

        // System.out.print(cadena);
        try {

            for (i = 0; i < cadena.length(); i++) {
                if (StringUtils.isNumeric(cadena.substring(i, i + 1))) {
                    // System.out.println(cadena.substring(i,i+1));
                    if (non) {
                        nones = nones + cadena.substring(i, i + 1);
                        totalNon = totalNon + Integer.parseInt(cadena.substring(i, i + 1));
                        non = false;
                    } else {
                        pares = pares + cadena.substring(i, i + 1);
                        totalPar = totalPar + Integer.parseInt(cadena.substring(i, i + 1));
                        non = true;
                    }
                }
            }

            totalNon = totalNon * 3;
            totalPar = totalPar + totalNon;

            while (((totalPar + digVer) % 10) != 0) {
                digVer++;
            }

        } catch (Exception e) {
            ErroLog.grabaLog(vlstrNombreAplicacion, "Cripto.Verifica Exception", e);
        }

        return totalNon + "" + totalPar + "" + digVer;
    }

    public String antiSQLInjection(String strDato) {
        String strResult = "";
        try {
            strDato = strDato.replace("\"", "");     //comillas
            strDato = strDato.replace("'", "");      //comilla simple
            strDato = strDato.replace(";", "");      //punto y coma
            strDato = strDato.replace(",", "");      //coma
            strDato = strDato.replace(".", "");      //punto
            strDato = strDato.replace(":", "");      //2 puntos
            strDato = strDato.replace("|", "");      //pipe
            strDato = strDato.replace("/", "");      //diagonal
            strDato = strDato.replace("\\", "");     //slash
            strDato = strDato.replace("(", "");      //parentesis abre
            strDato = strDato.replace(")", "");      //parentesis cierra
            strDato = strDato.replace(">", "");      //mayor que
            strDato = strDato.replace("<", "");      //menor que
            strDato = strDato.replace("_", "");      //menor que
            strDato = strDato.replace("-", "");      //menor que

            strResult = strDato;
        } catch (Exception e) {
            ErroLog.grabaLog(vlstrNombreAplicacion, "Cripto.antiSQLInjection Exception", e);
        }
        return strResult;
    }

    public String antiSQLInjectionKey(String strDato) {
        String strResult = "";
        try {
            strDato = strDato.replace("\"", "");     //comillas
            strDato = strDato.replace("'", "");      //comilla simple
            strDato = strDato.replace(";", "");      //punto y coma
            strDato = strDato.replace(".", "");      //punto
            strDato = strDato.replace(":", "");      //2 puntos
            strDato = strDato.replace("|", "");      //pipe
            strDato = strDato.replace("/", "");      //diagonal
            strDato = strDato.replace("\\", "");     //slash
            strDato = strDato.replace("(", "");      //parentesis abre
            strDato = strDato.replace(")", "");      //parentesis cierra
            strDato = strDato.replace(">", "");      //mayor que
            strDato = strDato.replace("<", "");      //menor que

            strResult = strDato;
        } catch (Exception e) {
            ErroLog.grabaLog(vlstrNombreAplicacion, "Cripto.antiSQLInjectionKey Exception", e);
        }
        return strResult;
    }

    public String antiSQLInjectionUrl(String strDato) {
        String strResult = "";
        try {
            strDato = strDato.replace("\"", "");     //comillas
            strDato = strDato.replace("'", "");      //comilla simple
            strDato = strDato.replace(";", "");      //punto y coma
            strDato = strDato.replace("|", "");      //pipe
            strDato = strDato.replace("\\", "");     //slash
            strDato = strDato.replace("(", "");      //parentesis abre
            strDato = strDato.replace(")", "");      //parentesis cierra
            strDato = strDato.replace(">", "");      //mayor que
            strDato = strDato.replace("<", "");      //menor que

            strResult = strDato;
        } catch (Exception e) {
            ErroLog.grabaLog(vlstrNombreAplicacion, "Cripto.antiSQLInjectionKey Exception", e);
        }
        return strResult;
    }
}
