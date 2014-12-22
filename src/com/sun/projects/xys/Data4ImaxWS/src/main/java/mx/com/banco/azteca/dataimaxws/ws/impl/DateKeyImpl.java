package mx.com.banco.azteca.dataimaxws.ws.impl;

import mx.com.banco.azteca.dataimaxws.service.DateKeyService;
import mx.com.banco.azteca.dataimaxws.ws.def.DateKeyDef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author Carlos Cuaya Xinto
 */
@RestController
public class DateKeyImpl implements DateKeyDef {
    
    @Autowired
    DateKeyService dateKeyService;

    @Override
    public String getKey(@PathVariable String date) {
        return dateKeyService.generateDateKey(date);
    }

    @Override
    public String generateKeyWithCurrentDate() {
        return dateKeyService.generateDateKey(null);
    }
}
