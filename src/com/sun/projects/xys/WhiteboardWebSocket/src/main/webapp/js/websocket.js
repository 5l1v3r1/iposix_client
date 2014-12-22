var wsUri = "ws://" + document.location.host + document.location.pathname + 
            "whiteb";
var divError  = document.getElementById("error");
var divOutput = document.getElementById("output");

var websocket = new WebSocket(wsUri);

websocket.onopen    = function (evt) { onOpen(evt); };
websocket.onerror   = function (evt) { onError(evt); };
websocket.onmessage = function (evt) { onMessage(evt); };

function onOpen () {
    divOutput.innerHTML += '<span style="color: blue;">Connected to:</span>' +
                           wsUri + '<br>';
};

function onMessage (evt) {
    console.log("received: " + evt.data);
    drawImageText(evt.data);
}

function onError (evt) {
    divError.innerHTML += '<span style="color: red;">ERROR:</span> ' + evt.data;
};

function sendText(json) {
    console.log("sending text: " + json);
    try {
        websocket.send(json);
    }
    catch(err) {
        document.getElementById("error").innerHTML = err.message;
        websocket.close();
    }
    
}