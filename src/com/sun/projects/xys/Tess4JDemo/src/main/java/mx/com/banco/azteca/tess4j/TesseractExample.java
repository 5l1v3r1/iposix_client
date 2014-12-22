package mx.com.banco.azteca.tess4j;

import java.io.File;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

/**
 * @author Carlos Cuaya Xinto
 */
public class TesseractExample {
    
    public static void main(String[] args) {
        System.out.println("Class Main!!");
        
        File imageFile = new File("images/eurotext.tif");
        //File imageFile = new File("images/alfred.jpg");
        Tesseract tesseract = Tesseract.getInstance();
        
        try {
            String result = tesseract.doOCR(imageFile);
            System.out.println("RESULT: " + result);
        } catch (TesseractException te) {
            System.err.println("Error: " + te);
        }
        
    }

}
