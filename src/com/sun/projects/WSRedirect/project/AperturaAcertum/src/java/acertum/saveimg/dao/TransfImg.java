/**
 * 
 */
package acertum.saveimg.dao;

import acertum.saveimg.dto.InsTresTablasDto;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.imageio.ImageIO;
import com.oreilly.servlet.Base64Decoder;
import java.util.Date;
import org.apache.log4j.Logger;



public class TransfImg {

    final static Logger log = Logger.getLogger(TransfImg.class);

    public TransfImg() {
      
    }
    //crea la imagen a partir de un b64, inserta en DB alamacena el docto.
    public boolean creaImg(InsTresTablasDto entradas) {
        boolean codigo = false;

        System.out.println("##### Iniciando insercion para cliente unico: " + entradas.getClienteUnico()+ "#####\n\n");

        try {
            byte[] imgByte = null;
            InputStream input = null;

            imgByte = Base64Decoder.decodeToBytes(entradas.getImagen64());
            input = new ByteArrayInputStream(imgByte);
            Date date = new Date();
            String prefix = date.toString().concat(entradas.getClienteUnico()).replace(" ", "");
            System.out.println("prefix ".concat(prefix));
            File tempfile = File.createTempFile(prefix.replaceAll(":", ""), ".jpg");
            tempfile.deleteOnExit();
            FileOutputStream fos = new FileOutputStream(tempfile);
            fos.write(imgByte);
            fos.close();
            entradas.setTamImagen(String.valueOf(tempfile.length())); 
            //verifico si la imagen se crea correctamente, entonces inserto a la DB
            if (isImagenValida(input)) {
                System.out.println("imagen valida!");
                RutaDao insertPagina = new RutaDao();
                String edoInsert = insertPagina.insertarRegistroTresTablas(entradas);
                //solo imprimo en el log datos de la insercion
                System.out.println("Resultado de la inserción: " + edoInsert);
                if(edoInsert.compareTo("Insercion a DB correcta") == 0){
                    System.out.println("\nCliente unico " + entradas.getClienteUnico()
                            +",\n Tipo de documento: " + entradas.getIdTipoDocto()
                            + ",\n Se generó el documento: " +  entradas.getNombreImg()
                            + ",\n Almacenado en la ruta: " + entradas.getPath());
                }
                System.out.println("Estado de la insercion: "+edoInsert);
                //Verifico que la ruta se cree correctamente para almacenar el documento
                if (verificaDir(entradas.getPath())) {
                    System.out.println("ruta comprobada");
                    File fichero = new File(entradas.getRuta());
                    FileOutputStream salida = new FileOutputStream(fichero);
                    salida.write(imgByte);
                    salida.close();
                    codigo = true;
                } else {
                    log.warn( "Error - {Problemas al crear el directorio / No se encuentra el directorio}");
                }
            } else {
                log.warn("Error -  Imagen Dañada");
                
            }
            tempfile.delete();
       // } catch (Exception e) {
        //    System.out.println("Excepcion: "+ e.toString());
                    System.out.println("pais "+entradas.getIdPais());
                    System.out.println("canal "+entradas.getIdCanal());
                    System.out.println("sucursal "+entradas.getIdSucursal());
                    System.out.println("folio "+entradas.getIdFolio());
                    System.out.println("nombre "+entradas.getNombre());
                    System.out.println("paterno "+entradas.getaPaterno());
                    System.out.println("materno "+entradas.getaMaterno());
                    System.out.println("canaldig "+entradas.getIdCanalDig());
                    System.out.println("suc dig "+entradas.getIdSucursalDig());
                    System.out.println("idproducto "+entradas.getIdTipoProd());
                    System.out.println("tipo documento "+entradas.getIdTipoDocto());
                    System.out.println("workstation"+entradas.getWorkstation());
                    System.out.println("usuario: "+entradas.getUsuario());
                    System.out.println("ruta "+entradas.getRuta());
                    System.out.println("\n Se generó el documento: " +  entradas.getNombreImg()
                            + ",\n Almacenado en la ruta: " + entradas.getPath());
   
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
            
            System.out.println("Mensaje crítico... en " + e.toString());
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
                    System.out.println("Problemas al crear el directorio " + rutaShared );
                    
                }
            } else {
                codigo = directorio.exists();
            }
        } catch (Exception e) {
           System.out.println("Problemas al crear el directorio }" + rutaShared + ":" + e);
        }
        return codigo;
    }

}
