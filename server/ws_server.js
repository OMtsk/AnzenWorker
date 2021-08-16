//'use strict';
var io;

/*この関数定義方法気持ち悪い（個人的に）*/
exports.createSocketServer = function(httpServer){
    io = require('socket.io')(httpServer);
    
    onConnect();
    onMessage();

}

function onConnect(){
    io.on("connect", socket => {
        //socket["id"] = generateUuid();
        console.log("WE ARE SOCKET MANNNNN")
    });
}

function onMessage(socketID){
    io.on("message", message => {
        console.log(message);
/*        try{
            var json = JSON.parse(message.toString());
            if(json.task.broadcast != null){
                json.task.broadcast.forEach(event => {
                    io.client.forEach(event => {
                        
                    });
                });
            }
        }catch (e) {
            console.log('デス');
        }*/
    });
}

function generateUuid() {
    // https://github.com/GoogleChrome/chrome-platform-analytics/blob/master/src/internal/identifier.js
    // const FORMAT: string = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx";
    let chars = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".split("");
    for (let i = 0, len = chars.length; i < len; i++) {
        switch (chars[i]) {
            case "x":
                chars[i] = Math.floor(Math.random() * 16).toString(16);
                break;
            case "y":
                chars[i] = (Math.floor(Math.random() * 4) + 8).toString(16);
                break;
        }
    }
    return chars.join("");
}
