'use strict';
var express = require('express')//サーバー
var http = require('http')

//socket.ioのロード
var socketServer = require('./server/ws_server.js')

var app = express()
app.use("/", express.static('client'))//clientを返す

var httpServer = http.createServer(app)
socketServer.createSocketServer(httpServer);

// サーバーの起動
httpServer.listen(8080, () => {
    console.log('listening on 80')
})
