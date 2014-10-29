package xinto.sun;

import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;

import java.awt.Graphics;
import java.awt.GraphicsConfiguration;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.HeadlessException;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Transparency;
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import javax.swing.*;
import javax.imageio.*;
import java.awt.image.*;


//compile: > javac -cp .;PDFRenderer-0.9.1.jar -d classes xinto\sun\ImageMain.java

//run : > >java -cp .;classes;PDFRenderer-0.9.1.jar  xinto.sun.ImageMain
public class ImageMain {
    
    public static void setup() throws IOException {
        // load a pdf from a byte buffer
        File file = new File("E:\\Users\\B249461\\Documents\\Elektra\\projects\\ImagesPDF2ImageModule\\test\\basics.pdf");
        RandomAccessFile raf = new RandomAccessFile(file, "r");
        FileChannel channel = raf.getChannel();
        ByteBuffer buf = channel.map(FileChannel.MapMode.READ_ONLY, 0, channel.size());

        PDFFile pdffile = new PDFFile(buf);
        System.out.println("all right to here!");
        int numPgs = pdffile.getNumPages();
        for (int i = 0; i < numPgs; i++) {
            // draw the first page to an image
            PDFPage page = pdffile.getPage(i);
            // get the width and height for the doc at the default zoom
            Rectangle rect = new Rectangle(0, 0, (int) page.getBBox().getWidth(), (int) page.getBBox().getHeight());
            // generate the image
            System.out.println("all right near to img " + numPgs);
            Image img = null;
            System.out.println("val: " + rect.width + "val: " + rect.height);
            try{
            img = page.getImage(rect.width, rect.height, // width & height
                    rect, // clip rect
                    null, // null for the ImageObserver
                    true, // fill background with white
                    true // block until drawing is done
                    );

            }catch(Exception e){}
            // save it as a file
            System.out.println("before bImg " + img);
            BufferedImage bImg = toBufferedImage(img);
            System.out.println("after bImg");
            File yourImageFile = new File("page_" + i + ".jpg");
            ImageIO.write(bImg, "jpg", yourImageFile);
            
        }
    }

    // This method returns a buffered image with the contents of an image
    public static BufferedImage toBufferedImage(Image image) {
        if (image instanceof BufferedImage) {
            System.out.println("thisiiiii!!!!!!");
            return (BufferedImage) image;
        }
        // This code ensures that all the pixels in the image are loaded
        image = new ImageIcon(image).getImage();
        // Determine if the image has transparent pixels; for this method's
        // implementation, see e661 Determining If an Image Has Transparent
        // Pixels
        boolean hasAlpha = false;//hasAlpha(image);
        // Create a buffered image with a format that's compatible with the
        // screen
        BufferedImage bimage = null;
        GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
        try {
            // Determine the type of transparency of the new buffered image
            int transparency = Transparency.OPAQUE;
            if (hasAlpha) {
                transparency = Transparency.BITMASK;
            }
            // Create the buffered image
            GraphicsDevice gs = ge.getDefaultScreenDevice();
            GraphicsConfiguration gc = gs.getDefaultConfiguration();
            //bimage = gc.createCompatibleImage(image.getWidth(null), image.getHeight(null),Transparency.OPAQUE);
            bimage = new BufferedImage(image.getWidth(null),image.getHeight(null), BufferedImage.TYPE_INT_RGB);
        } catch (HeadlessException e) {
            // The system does not have a screen
        }
       
        System.out.println("bimage xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: " + bimage);
        
        if (bimage == null) {
            // Create a buffered image using the default color model
            int type = BufferedImage.TYPE_INT_RGB;
            if (hasAlpha) {
                type = BufferedImage.TYPE_INT_ARGB;
            }
            bimage = new BufferedImage(image.getWidth(null), image.getHeight(null), BufferedImage.TYPE_INT_RGB);
        }
        // Copy image to buffered image
        Graphics g = bimage.createGraphics();
        // Paint the image onto the buffered image
        g.drawImage(image, 0, 0, null);
        g.dispose();
        return bimage;
    }

    public static boolean hasAlpha(Image image) {
        // If buffered image, the color model is readily available
        if (image instanceof BufferedImage) {
            BufferedImage bimage = (BufferedImage) image;
            return bimage.getColorModel().hasAlpha();
        }
        // Use a pixel grabber to retrieve the image's color model;
        // grabbing a single pixel is usually sufficient
        PixelGrabber pg = new PixelGrabber(image, 0, 0, 1, 1, false);
        try {
            pg.grabPixels();
        } catch (InterruptedException e) {
        }
        // Get the image's color model
        ColorModel cm = pg.getColorModel();
        return cm.hasAlpha();
    }

    public static void main(final String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                try {
                    ImageMain.setup();
                } catch (IOException ex) {
                }
            }
        });
    }
}