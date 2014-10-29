package com.sun.xinto;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.imageio.ImageIO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;

@SuppressWarnings("unchecked")
public class Pdf2Jpg {
    public static void main(String[] args) {
        
        String sourceDir = "E:\\Users\\B249461\\Documents\\Elektra\\projects\\ImagesPDF2ImageModule\\Files2Jpg\\files\\other.xlsx"; // Pdf files are read from this folder
        File sourceFile = new File(sourceDir);
        
        String destinationDir = "E:\\Users\\B249461\\Documents\\Elektra\\projects\\ImagesPDF2ImageModule\\Files2Jpg\\files\\"; // converted images from pdf document are saved here

        File destinationFile = new File(destinationDir);
        
        /*
        try {
        
        if (!destinationFile.exists()) {
            destinationFile.mkdir();
            System.out.println("Folder Created -> "+ destinationFile.getAbsolutePath());
        }
        if (sourceFile.exists()) {
            System.out.println("Images copied to Folder: "+ destinationFile.getName());             
            PDDocument document = PDDocument.load(sourceFile);
            List<PDPage> list = document.getDocumentCatalog().getAllPages();
            System.out.println("Total files to be converted -> "+ list.size());

            String fileName = sourceFile.getName().replace(".pdf", "");             
            int pageNumber = 1;
            for (PDPage page : list) {
                BufferedImage image = page.convertToImage();
                
                File outputfile = new File(destinationDir + fileName +"_"+ pageNumber +".png");
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                //System.out.println("Image Created -> "+ outputfile.getName());
                
                ImageIO.write(image, "png", outputfile);
                
                ImageIO.write(image, "jpg", baos);
                baos.flush();
                
                byte[] imageInBytes = baos.toByteArray();
                
                System.out.println("array size: " + imageInBytes.length);
                
                for(byte bte : imageInBytes){
          //          System.out.print(bte);
                }
                baos.close();
                
                FileOutputStream fout = new FileOutputStream(destinationDir + fileName +"_"+ pageNumber +".jpg");
                fout.write(imageInBytes);
                
                pageNumber++;
            }
            document.close();
            System.out.println("Converted Images are saved at -> "+ destinationFile.getAbsolutePath());
        } else {
            System.err.println(sourceFile.getName() +" File not exists");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
        
        try {
            File file = new File("E:\\Users\\B249461\\Documents\\Elektra\\projects\\ImagesPDF2ImageModule\\Files2Jpg\\files\\pi_1.png");
            BufferedImage image = ImageIO.read(file);
            File f = new File("E:\\Users\\B249461\\Documents\\Elektra\\projects\\ImagesPDF2ImageModule\\Files2Jpg\\files\\pi_1_n.jpg");
            ImageIO.write(image, "jpg", f);
        } catch (Exception ex) {
            
        }

*/
        if (sourceFile.exists()) {
            
            List<byte[]> imageBytes = getBytesArrayFromFile(sourceFile);
            
            System.out.println("imageBytes list size: " + imageBytes.size());
            
            for(byte[] bytesOfImage : imageBytes ){
                System.out.println("bytesOfImage: " + bytesOfImage.length);
            }
            
        }

    }
    
    public static List<byte[]> getBytesArrayFromFile(File file){
        String extension;
        
        List<byte[]> imageBytes = new ArrayList<>();

        List<String> imageExtensions = new ArrayList<>();
        
        imageExtensions.add("png");
        imageExtensions.add("jpg");
        

        int i = file.getName().lastIndexOf('.');
        if (i > 0) {
            extension = file.getName().substring(i+1);
        }else {
            return imageBytes;
        }
        
        if (extension.toLowerCase().equals("pdf") ) {
            try {
                return getBytesFromPDF(file);
            } catch (IOException ex) {
                return imageBytes;
            }
        }
        
        if ( imageExtensions.contains( extension.toLowerCase() ) ) {
            try {
                return getBytesFromImage(file);
            } catch (IOException ex) {
                return imageBytes;
            }
        }
        
        return imageBytes;
    }
    
    public static List<byte[]> getBytesFromPDF(File file) throws IOException{
        List<byte[]> pageBytes = new ArrayList<>();
        
        try (PDDocument document = PDDocument.load(file)) {
            List<PDPage> pages = document.getDocumentCatalog().getAllPages();
            
            System.out.println("pages number -> "+ pages.size());
            
            for (PDPage page : pages) {
                BufferedImage image = page.convertToImage();
                
                byte[] imageInBytes = getBytesOfImage(image);
                
                pageBytes.add(imageInBytes);
            }
        }
        
        return pageBytes;
    }
    
    public static List<byte[]> getBytesFromImage(File file) throws IOException{
        
        List<byte[]> pageBytes = new ArrayList<>();
        
        BufferedImage image = ImageIO.read(file);

        byte[] imageInBytes = getBytesOfImage(image);

        pageBytes.add(imageInBytes);
        
        return pageBytes;
    }
    
    public static byte[] getBytesOfImage(BufferedImage image) throws IOException{
        
        byte[] imageBytes;
        
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            ImageIO.write(image, "jpg", baos);
            baos.flush();
            imageBytes = baos.toByteArray();
            baos.close();
        }
        
        return imageBytes;
    }
    
    
}
