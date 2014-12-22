var wsUri = "ws://" + document.location.host + document.location.pathname + 
            "chat";
var heartbeatMsg = '--heartbeat--', heartbeatInterval = null, missedHeartbeats = 0;
var divError  = document.getElementById("error");
var divOutput = document.getElementById("output");

var websocket = null;
var blinkInterval = null;
var flag = false;

function connect() {
    
    websocket = new WebSocket(wsUri);
    
    websocket.onopen = function (event) {
        if (heartbeatInterval === null) {
            missedHeartbeats = 0;
            heartbeatInterval = setInterval(function() {
                try {
                    missedHeartbeats++;
                    if (missedHeartbeats >= 3)
                        throw new Error("Too many missed heartbeats.");
                    websocket.send(heartbeatMsg);
                } catch(e) {
                    clearInterval(heartbeatInterval);
                    heartbeatInterval = null;
                    console.warn("Closing connection. Reason: " + e.message);
                    websocket.close();
                }
            }, 5000);
        }
    };
    
    websocket.onmessage = function (event) {
        if (event.data === heartbeatMsg) {
            // reset the counter for missed heartbeats
            missedHeartbeats = 0;
            return;
        }
        
        if (!document.hasFocus()) gotANewMessage();
            
        var messagesArea = document.getElementById("messages");
        var jsonObj = JSON.parse(event.data);
        var message = getCurrentDate() + jsonObj.user + ": " + jsonObj.message + 
                      "\r\n";
        messagesArea.value += message;
        messagesArea.scrollTop = messagesArea.scrollHeight;
    };
}

function disconnect() {
    websocket.close();
}

function sendMessage() {
    
    var user = document.getElementById("username").value.trim();
    
    if (user === "") alert ("please enter your name!");
    
    var inputElement = document.getElementById("message-input");
    var message = inputElement.value.trim();
    
    if (message !== "") {
        var jsonObj = {"user" : user, "message" : message};
        websocket.send(JSON.stringify(jsonObj));
        inputElement.value = "";
    }
    inputElement.focus();
}

function getCurrentDate(){
    
    var currentDate = new Date();
    var year   = currentDate.getFullYear();
    var month  = currentDate.getMonth() + 1;
    var day    = currentDate.getDate();
    var hour   = currentDate.getHours();
    var minute = currentDate.getMinutes();
    var second = currentDate.getSeconds();
    
    return "[" + day + "/" + month + "/" + year + " " +
           hour + ":" + minute + ":" + second + "] ";
}

function gotANewMessage() {
    if(blinkInterval === null) { // or whatever the property is 
        blinkInterval = setInterval("blink();", 3000);
    }
}

function blink() {

 console.log("document.hasFocus -> " + document.hasFocus());

 if(!flag) { document.title = "New Message!"; flag = true; }
 else { document.title = "Chat room"; flag = false; }
}

window.onclick = function() { // or whatever the event handler is...
    clearInterval(blinkInterval); 
    blinkInterval = null;
    console.log("readyy!!");
};
