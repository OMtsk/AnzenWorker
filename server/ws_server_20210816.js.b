'use strict';

//var webSocket = require('ws')   //websocket
const io = require('socket.io')(8000);

//var wss = new webSocket.Server({ port: 8000 })  //オプションを{ server: httpServer }等にすると同じポートを共有できる。
/*
wss.on('connection', (socket,req) => {
    // socket["ipAddress"] = req.socket.remoteAddress.replace(/^.*:/g, '')
    // socket["port"] = req.socket.remotePort
    // socket["unique"] = Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1)
    // socket["id"] = `${socket["ipAddress"]}:${socket["port"]}:${socket["unique"]}`
    socket["id"] = generateUuid()
    socket.on('message', message => {
        try {//エラーハンドリング
            var json = JSON.parse(message.toString());
            if (json.task.broadcast != null) {
                json.task.broadcast.forEach(event => {
                    wss.clients.forEach(client => {
                        if (socket["id"] != client["id"])//送信元以外に送信
                            client.send(JSON.stringify(event));//テスト
                    });
                });
            }
        } catch (e) {
            console.log("invalid json: " + message)
            return;
        }
    });
    socket.on('close', () => {
        console.log('good bye.');
    });
});*/


io.on("connect", socket => {
    //socket["id"] = generateUuid();
    console.log("WE ARE SOCKET MANNNNN")
    


});

/*function onMessage(socketID){
    io.on("message", message => {
        try{
            var json = JSON.parse(message.toString());
            if(json.task.broadcast != null){
                json.task.broadcast.forEach(event => {
                    io.client.forEach(event => {
                        
                    });
                });
            }
        }catch (e) {}
    });
}*/

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