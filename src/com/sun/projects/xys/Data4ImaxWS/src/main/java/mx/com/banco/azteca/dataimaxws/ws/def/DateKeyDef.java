package mx.com.banco.azteca.dataimaxws.ws.def;

import org.jsondoc.core.annotation.Api;
import org.jsondoc.core.annotation.ApiMethod;
import org.jsondoc.core.annotation.ApiParam;
import org.jsondoc.core.pojo.ApiParamType;
import org.jsondoc.core.pojo.ApiVerb;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author B249461
 */
@Api(name = "RESTFul API for Imax Web Services Data ", 
     description = "Web services to generate data and use it to call Imax WS")
@RequestMapping("/rest-ws")
public interface DateKeyDef {
    
    @ApiMethod(path = "/rest-ws/date-key/{date}",
               description = "Generate a key given a date " +
                             "with format YYYYMMDD",
               verb = ApiVerb.POST)
    @RequestMapping(value = "/date-key/{date}",method = RequestMethod.POST)
    public String getKey(@ApiParam(name = "date", paramType = ApiParamType.PATH)
                         @PathVariable String date);
    
    @ApiMethod(path = "/rest-ws/date-key/",
               description = "Generate a key with the current date",
               verb = ApiVerb.POST)
    @RequestMapping(value = "/date-key/",method = RequestMethod.POST)
    public String generateKeyWithCurrentDate();
       
}
