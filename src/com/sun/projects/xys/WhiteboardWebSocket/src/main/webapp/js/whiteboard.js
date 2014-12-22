var canvas  = document.getElementById("myCanvas");
var context = canvas.getContext("2d");

 canvas.addEventListener("click",defineImage,false);

function defineImage(evt) {
    var currentPos = getCurrentPos(evt);
    
    for (i = 0; i < document.inputForm.color.length; i++) {
        if (document.inputForm.color[i].checked) {
            var color = document.inputForm.color[i];
            break;
        }
    }
    
    for (i = 0; i < document.inputForm.shape.length; i++) {
        if (document.inputForm.shape[i].checked) {
            var shape = document.inputForm.shape[i];
            break;
        }
    }
    
    var json = JSON.stringify({
        "shape" : shape.value,
        "color" : color.value,
        "coords" : {
            "x" : currentPos.x,
            "y" : currentPos.y
        }
    });
    
    drawImageText(json);
    sendText(json);
}

function getCurrentPos(evt) {
    var rect = canvas.getBoundingClientRect();
    
    return {
        x : evt.clientX - rect.left,
        y : evt.clientY - rect.top
    };
}

function drawImageText(image) {
    console.log("drawImageText");
    
    var json = JSON.parse(image);
    
    console.log("json.color: " + json.color);
    context.fillStyle = json.color;
    console.log("context.fillStyle: " + context.fillStyle);
    
    switch (json.shape) {
        case "circle" : context.beginPath();
                        context.arc(json.coords.x, json.coords.y, 5, 0,
                                    2*Math.PI, false);
                        context.fill();
                        break;
        case "square" : context.beginPath();
        default :       context.fillRect(json.coords.x, json.coords.y, 10, 10);
                        context.fill();
                        break;
            
    }
    
    
    
}