package mx.com.banco.azteca.dataimaxws.service;

import mx.com.banco.azteca.dataimaxws.util.DateKey;
import org.springframework.stereotype.Service;

/**
 * @author Carlos Cuaya Xinto
 */
@Service
public class DateKeyService {
    
    public String generateDateKey(String date){
        
        if (date == null) {
            date = DateKey.getCurrentDateAsString();
        }
        
        if(DateKey.hasFormatYYYYMMDD(date)) return calculateKey(date);

        return "";
    }
    
    private String calculateKey(String date) {
        
        int sumEven = 0;
        int sumOdd = 0;
        
        // loop over each string position
        for (int i = 0; i < date.length(); i++) {
            if ((i % 2) == 0) {
                //sum the even positions
                sumEven += Integer.parseInt(String.valueOf(date.charAt(i)));
            } else {
                //sum the odd positions
                sumOdd += Integer.parseInt(String.valueOf(date.charAt(i)));
            }
        }
        
        //the even sum is multiplicated per 3
        sumEven *= 3;
        //the even sum is added to odd sum
        sumOdd  += sumEven;
        
        // the varify digit is calculated with this formula
        int digit = 10 - (sumOdd % 10);
        
        //the three result are concatenated
        return sumEven + "" + sumOdd + "" + digit;
    }

}
