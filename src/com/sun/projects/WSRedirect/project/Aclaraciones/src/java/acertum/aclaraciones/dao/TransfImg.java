/**
 * 
 */
package acertum.aclaraciones.dao;

import acertum.aclaraciones.dto.AclaracionesDto;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.imageio.ImageIO;
import com.oreilly.servlet.Base64Decoder;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import org.apache.log4j.Logger;
import java.net.*;



public class TransfImg {

    final static Logger logger = Logger.getLogger(TransfImg.class);

    public TransfImg() {
      
    }
    //crea la imagen a partir de un b64, inserta en DB alamacena el docto.
    public boolean creaImg(AclaracionesDto entradas) {
        boolean codigo = false;

        logger.info("##### Iniciando el proceso aclaratorio para cliente unico: " + entradas.getClienteUnico()+"idCliente: " +entradas.getIdCteAclaracion() + "#####");

        try {
            byte[] imgByte = null;
            InputStream input = null;
            logger.info("obteniendo base64...");
            imgByte = Base64Decoder.decodeToBytes(entradas.getImagen64());
            input = new ByteArrayInputStream(imgByte);
            File tempfile = File.createTempFile("temp", ".jpg");
            tempfile.deleteOnExit();
            FileOutputStream fos = new FileOutputStream(tempfile);
            fos.write(imgByte);
            fos.close();
            logger.info("imagen temporal creada");
            entradas.setTamImagen(String.valueOf(tempfile.length())); 
            //verifico si la imagen se crea correctamente, entonces inserto a la DB
            logger.info("verificando integridad de la imágen...");
            if (isImagenValida(input)) {
                logger.info("imágen ok");
                RutaDao insertPagina = new RutaDao();
                String edoInsert = insertPagina.PqdgAclaracion(entradas);
               
                
                //llamada a metodo que invoca serlvet
                //produccion
                //String servletUrl ="http://10.51.214.198:9999/DigitalizacionServlet?idExpDig="+entradas.getIdPais()+"-"+entradas.getIdFolioAclaracion()+"&idDocDig="+entradas.getIdTipoDocto();
                //desarrollo
                String servletUrl ="http://10.53.26.142:8080/DigitalizacionServlet?idExpDig="+entradas.getIdPais()+"-"+entradas.getIdFolioAclaracion()+"&idDocDig="+entradas.getIdTipoDocto();
		String line;
                try
		{
			URL url = new URL(servletUrl);
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			line = in.readLine();

			logger.info("respuesta serlvet:" + line );
			in.close();
		}
		catch (Exception e)
		{
			e.printStackTrace(); 
		}

                //solo imprimo en el log datos de la insercion
                logger.info("Resultado de la inserción: " + edoInsert);
                if(edoInsert.compareTo("Insercion a DB correcta") == 0){
                    logger.info("Folio Aclaracion: "+entradas.getIdFolioAclaracion());
                    logger.info("cliente aclaracion:"+entradas.getIdCteAclaracion());
                    logger.info("pais "+entradas.getIdPais());
                    logger.info("canal "+entradas.getIdCanal());
                    logger.info("sucursal "+entradas.getIdSucursal());
                    logger.info("folio "+entradas.getIdFolio());
                    logger.info("nombre "+entradas.getNombre());
                    logger.info("paterno "+entradas.getaPaterno());
                    logger.info("materno "+entradas.getaMaterno());
                    logger.info("canaldig "+entradas.getIdCanalDig());
                    logger.info("suc dig "+entradas.getIdSucursalDig());
                    logger.info("cuenta ahorro "+entradas.getCuentaAhorro());
                    logger.info("idproducto "+entradas.getIdTipoProd());
                    logger.info("tipo documento "+entradas.getIdTipoDocto());
                    logger.info("workstation"+entradas.getWorkstation());
                    logger.info("usuario: "+entradas.getUsuario());
                    logger.info("ruta "+entradas.getRuta());
                    logger.info("\n Se generó el documento: " +  entradas.getNombreImg()
                            + ",\n Almacenado en la ruta: " + entradas.getPath());
                }
                //Verifico que la ruta se cree correctamente para almacenar el documento
                if (verificaDir(entradas.getPath())) {
                    File fichero = new File(entradas.getRuta());
                    FileOutputStream salida = new FileOutputStream(fichero);
                    salida.write(imgByte);
                    salida.close();
                    codigo = true;
                } else {
                    logger.warn( "Error - {Problemas al crear el directorio / No se encuentra el directorio}");
                }
            } else {
                logger.warn("Error -  Imagen Dañada");
                
            }
            tempfile.delete();
        } catch (Exception e) {
                    logger.error(e + e.getMessage() + e.getCause() +e.getLocalizedMessage() + e.getClass());
                    
   
        } finally {
            return codigo;
          
        }
    }


    public boolean isImagenValida(InputStream input) {
        boolean codigo = false;
        int width = 0;
        int height = 0;
        try {
            BufferedImage digImageaValidar = ImageIO.read(input);
            width = digImageaValidar.getWidth();
            height = digImageaValidar.getHeight();

            if (width > 0 && height > 0) {
                codigo = true;
            }
        } catch (Exception e) {
            
            logger.error("Mensaje crítico... en " + e.toString());
        } finally {
            return codigo;
        }
    }

    public boolean verificaDir(String rutaShared) {
        boolean codigo = false;
        File directorio = new File(rutaShared);
        Process proc0 = null;
        try {
            if (!directorio.exists()) {
//   String ejA = "mkdir -m777 -p " + rutaShared;
//                proc0 = Runtime.getRuntime().exec(ejA);
//                proc0.waitFor();
               codigo = true;
            	//;
            	directorio.mkdirs();
                if (!codigo) {
                    logger.error("Problemas al crear el directorio " + rutaShared );
                    
                }
            } else {
                codigo = directorio.exists();
            }
        } catch (Exception e) {
           logger.error("Problemas al crear el directorio }" + rutaShared + ":" + e);
        }
        return codigo;
    }

}
