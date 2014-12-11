//Creamos el objeto  XMLHttpRequest O
var http = createRequestObjectVal();
var arrActivo ;
var doctoActivo ;
var checkDocto;
var Paginas;
var contadorValidaPAginas;
var  arrayCheckbox;

document.oncontextmenu=new Function("return false")



// ---- Funcion que deshabilita el boton derecho del mouse ////


function getRegistro(aLlave, aClienteUnico,aFolio,aGaveta) {
	//marcaRegistro();

	window.open("principal4f.jsp?Llave=" + aLlave + "&ClienteUnico=" + aClienteUnico + "&Folio=" + aFolio + "&gaveta="+aGaveta, "_self");

}

function setClassName(aId, aClase) {
	var oAct = document.getElementById(aId);
	oAct.className = aClase;
    //alert("id renglon:" + aId);
}

function clickIE4(){
    if (event.button==2){
        return false;
    }
}

function clickNS4(e){
    if (document.layers||document.getElementById&&!document.all){
        if (e.which==2||e.which==3){
            return false;
        }
    }
}

if (document.layers){
    document.captureEvents(Event.MOUSEDOWN);
    document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
    document.onmousedown=clickIE4;
}

function digMsgBox(strMensaje){
    alert(strMensaje);
    document.getElementById("msgAlerta").innerHTML = strMensaje;
}

function actualizaCabezero(strProducto){    
    document.getElementById("lblCabProducto").innerHTML = strProducto;    
}

function cursorLink() {
    document.body.style.cursor = 'hand';
}

function cursorNormal() {
    document.body.style.cursor = 'default';
}

function cargaPaginas(documento,totalPaginas,paginaActual,arrayPag,verifica,intDebug){
    
    document.getElementById("lblNombreDocto").innerHTML = documento;
    document.getElementById("totalPaginalbl").innerHTML = totalPaginas;
    document.getElementById("paginaActuallbl").innerHTML = paginaActual;   
    navegaPaginas(verifica,intDebug,arrayPag,'inicio');
    arrActivo = arrayPag;    
}

function loadarrActivo(arrActivo){
    var arractivo = arrActivo;
    return arractivo;
}

function navegaPaginas(verifica,intDebug,arrayPag,movimiento){
    sendRequestVal('post','imagen.jsp',movimiento,verifica,intDebug,arrayPag);
}

function createRequestObjectVal(){

    var reqval;

    if(window.XMLHttpRequest){
        //For Firefox, Safari, Opera
        reqval = new XMLHttpRequest();
    }
    else if(window.ActiveXObject){
        //For IE 5+
        reqval = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else{
        //Navegadores que no soportan ajax
        alert('El navegador no soporta esta pagina');
    }

    return reqval;
}


function sendRequestVal(method,url,strAccion,verifica,intDebug,arrRutasImagenes){

    var strVariables = 'rutaImagen=';
    var strRutasImagenes = arrRutasImagenes;
    var mandar = true;

    if(method == 'get' || method == 'GET'){
        http.open(method,url);
        http.onreadystatechange = handleResponse;
        http.send(null);
    }else if(method == 'post' || method == 'POST'){

        var pagactual = parseInt(document.getElementById("paginaActuallbl").innerHTML);
        var totalPag = parseInt(document.getElementById("totalPaginalbl").innerHTML);


        if(strAccion == 'inicio'){
            strVariables = strVariables + strRutasImagenes[1];
            pagactual = 1;        
        }else if(strAccion == 'anterior'){
            if(pagactual-1<=0){
                strVariables = strVariables + strRutasImagenes[1];
                pagactual = 1;            
            }else{
                strVariables = strVariables + strRutasImagenes[pagactual-1];
                pagactual = pagactual-1;            
            }

        }else if(strAccion == 'siguiente'){

        if(pagactual+1 >= totalPag){
            strVariables = strVariables + strRutasImagenes[totalPag];
            pagactual = totalPag;
        }else{
            strVariables = strVariables + strRutasImagenes[pagactual+1];
            pagactual = pagactual+1;
        }

    }else if(strAccion == 'fin'){
        strVariables = strVariables + strRutasImagenes[totalPag];
        pagactual = totalPag;
    }
    else if(strAccion == 'irAPagina'){
        var pagina = document.getElementById("idPaginas").value;
 
        if(pagina > 0 && pagina < strRutasImagenes.length ){
            strVariables = strVariables + strRutasImagenes[pagina];
            //alert(strVariables);
            pagactual = pagina;
        }
        else{
         mandar = false;
         alert("La p\u00e1gina no existe.");
        }

     }

        
        if(mandar){
            document.getElementById("inicio").disabled=true;
            document.getElementById("inicio").style.opacity  = ".1";
            document.getElementById("inicio").style.filter = 'alpha(opacity=40)';
            document.getElementById("anterior").disabled=true;
            document.getElementById("anterior").style.opacity  = ".1";
            document.getElementById("anterior").style.filter = 'alpha(opacity=40)';
            document.getElementById("siguiente").disabled=true;
            document.getElementById("siguiente").style.opacity  = ".1";
            document.getElementById("siguiente").style.filter = 'alpha(opacity=40)';
            document.getElementById("fin").disabled=true;
            document.getElementById("fin").style.opacity  = ".1";
            document.getElementById("fin").style.filter = 'alpha(opacity=40)';
            document.getElementById("DigLoading").style.display = "";
            document.getElementById("DigLoading").innerHTML = '<table width="200" align="center"  border="0" cellspacing="0" cellpadding="0"><tr><td align="center"><img src="../media/loader.gif"/></td></tr></table>';
        }
        

       

        strVariables = strVariables +  '&verifica=' + verifica;
    
        if(intDebug == 1){
            strVariables = strVariables + '&activaTrace=1';
        }
        if(mandar){
            //alert("entro al if");
            document.getElementById("idPaginas").value = "";
            http.open(method,url,true);
            http.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
            http.send(strVariables);
            http.onreadystatechange = handleResponse;
        }
        

    }
    document.getElementById("paginaActuallbl").innerHTML = pagactual.toString();
}

function sendRequestValIrAPag(method,url,strAccion,verifica,intDebug,arrRutasImagenes){

    var strVariables = 'rutaImagen=';
    var strRutasImagenes = arrRutasImagenes;

    if(method == 'get' || method == 'GET'){
        http.open(method,url);
        http.onreadystatechange = handleResponse;
        http.send(null);
    }else if(method == 'post' || method == 'POST'){

        var pagactual = parseInt(document.getElementById("paginaActuallbl").innerHTML);
        var totalPag = parseInt(document.getElementById("totalPaginalbl").innerHTML);


        if(strAccion == 'inicio'){
            strVariables = strVariables + strRutasImagenes[1];
            pagactual = 1;
        }else if(strAccion == 'anterior'){
            if(pagactual-1<=0){
                strVariables = strVariables + strRutasImagenes[1];
                pagactual = 1;
            }else{
                strVariables = strVariables + strRutasImagenes[pagactual-1];
                pagactual = pagactual-1;
            }

        }else if(strAccion == 'siguiente'){

            if(pagactual+1 >= totalPag){
                strVariables = strVariables + strRutasImagenes[totalPag];
                pagactual = totalPag;
            }else{
                strVariables = strVariables + strRutasImagenes[pagactual+1];
                pagactual = pagactual+1;
            }

        }else if(strAccion == 'fin'){
            strVariables = strVariables + strRutasImagenes[totalPag];
            pagactual = totalPag;
        }

        document.getElementById("inicio").disabled=true;
        document.getElementById("inicio").style.opacity  = ".1";
        document.getElementById("inicio").style.filter = 'alpha(opacity=40)';
        document.getElementById("anterior").disabled=true;
        document.getElementById("anterior").style.opacity  = ".1";
        document.getElementById("anterior").style.filter = 'alpha(opacity=40)';
        document.getElementById("siguiente").disabled=true;
        document.getElementById("siguiente").style.opacity  = ".1";
        document.getElementById("siguiente").style.filter = 'alpha(opacity=40)';
        document.getElementById("fin").disabled=true;
        document.getElementById("fin").style.opacity  = ".1";
        document.getElementById("fin").style.filter = 'alpha(opacity=40)';
        document.getElementById("DigLoading").style.display = "";
        document.getElementById("DigLoading").innerHTML = '<table width="200" align="center"  border="0" cellspacing="0" cellpadding="0"><tr><td align="center"><img src="../media/loader.gif"/></td></tr></table>';

        http.open(method,url,true);
        http.setRequestHeader('Content-Type','application/x-www-form-urlencoded');

        strVariables = strVariables +  '&verifica=' + verifica;

        if(intDebug == 1){
            strVariables = strVariables + '&activaTrace=1';
        }

        http.send(strVariables);
        http.onreadystatechange = handleResponse;

    }
    document.getElementById("paginaActuallbl").innerHTML = pagactual.toString();
}

function handleResponse(){
    if(http.readyState == 4 ){
        if( http.status == 200){
            var response = http.responseText;
            if(response){
                document.getElementById("imageContainer").innerHTML = response;
                document.getElementById("DigLoading").style.display = "none";

                document.getElementById("inicio").disabled=false;
                document.getElementById("inicio").style.opacity  = "1";
                document.getElementById("inicio").style.filter = 'alpha(opacity=100)';
                document.getElementById("anterior").disabled=false;
                document.getElementById("anterior").style.opacity  = "1";
                document.getElementById("anterior").style.filter = 'alpha(opacity=100)';
                document.getElementById("siguiente").disabled=false;
                document.getElementById("siguiente").style.opacity  = "1";
                document.getElementById("siguiente").style.filter = 'alpha(opacity=100)';
                document.getElementById("fin").disabled=false;
                document.getElementById("fin").style.opacity  = "1";
                document.getElementById("fin").style.filter = 'alpha(opacity=100)';

            }
        }else
            document.getElementById("DigLoading").innerHTML = '<table width="300" align="center" cellpadding="0" cellspacing="1"><tr class="warningtxt"><td><img src="../media/warning.png" alt="Error"></td><td>Error Interno del servidor</td></tr></table>';
    }else
    if (http.readyState == 5){
        document.getElementById("DigLoading").innerHTML = '<table width="300" align="center" cellpadding="0" cellspacing="1"><tr class="warningtxt"><td><img src="../media/warning.png" alt="Error"></td><td>Error Interno del servidor</td></tr></table>';
    }else{        
        document.getElementById("DigLoading").innerHTML = '<table width="200" align="center"  border="0" cellspacing="0" cellpadding="0"><tr><td align="center"><img src="../media/loader.gif"/></td></tr></table>';
    }
}


function DisableNavegacion(){
    document.getElementById("inicio").disabled=true;
    document.getElementById("inicio").style.opacity  = ".1";
    document.getElementById("inicio").style.filter = 'alpha(opacity=40)';
    document.getElementById("anterior").disabled=true;
    document.getElementById("anterior").style.opacity  = ".1";
    document.getElementById("anterior").style.filter = 'alpha(opacity=40)';
    document.getElementById("siguiente").disabled=true;
    document.getElementById("siguiente").style.opacity  = ".1";
    document.getElementById("siguiente").style.filter = 'alpha(opacity=40)';
    document.getElementById("fin").disabled=true;
    document.getElementById("fin").style.opacity  = ".1";
    document.getElementById("fin").style.filter = 'alpha(opacity=40)';
}

function revisionDoctos(doctoActivoAux, chkboxactivo){
    
    var paginaActual = parseInt(document.getElementById("paginaActuallbl").innerHTML);
    var totalPaginas = parseInt(document.getElementById("totalPaginalbl").innerHTML);
    var nodeList = document.getElementsByTagName("input");
    var blvalida = true;
    var i = 0;

    checkDocto = chkboxactivo;
    contadorValidaPAginas = 0;

    if(doctoActivo !=  doctoActivoAux){
        
        Paginas = [];
        Paginas = new Array (totalPaginas);
        Paginas[paginaActual-1] = 1;
        doctoActivo = doctoActivoAux;
        
        
    }else{
        Paginas[paginaActual-1] = 1;
    }

    for(i=0;i<totalPaginas;i++){
        if(Paginas[i]== 1){
            contadorValidaPAginas++;
        }
    }
    
    if(totalPaginas==1){
        if(contadorValidaPAginas == 1){
            chkboxactivo.checked='checked';
        }        
    }else if(totalPaginas==2){
        if(contadorValidaPAginas == 2){
            chkboxactivo.checked='checked';
        } 
    }else if(totalPaginas >= 3){
        if(contadorValidaPAginas >=3){
            chkboxactivo.checked='checked';
        } 
    }

    for (i=0;i<nodeList.length;i++) {
        if(nodeList[i].getAttribute("type") == "checkbox"){
            if(nodeList[i].checked==0){
                blvalida = false;
            }
        }
    }
    
    if(blvalida){
        hablitaElemento("btnaceptar");
    }

}

function deshablitaElemento(strElemento){
    document.getElementById(strElemento).disabled=true;
    document.getElementById(strElemento).style.opacity  = ".1";
    document.getElementById(strElemento).style.filter = 'alpha(opacity=40)';
}

function hiddenElemento(strElemento){
    var bt;
    bt = document.getElementById(strElemento);
    bt.style.visibility='hidden';
}

function hablitaElemento(strElemento){
    document.getElementById(strElemento).disabled=false;
    document.getElementById(strElemento).style.opacity  = "1";
    document.getElementById(strElemento).style.filter = 'alpha(opacity=100)';
}

function aceptarDoctos(strurl){
    if(!document.getElementById("btnaceptar").disabled){
        window.open(strurl+"?bandera=1", '_parent');
        document.getElementById("btnaceptar").alt="Se revisaron todos los documentos";
        digMsgBox("Se revisaron todos los documentos");
    }
}

