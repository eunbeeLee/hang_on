var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var mysql = require('mysql');

io.on("connection", function (socket) {
	// 메세지가 전송왔을 때
	socket.on("msg",function(data){
		insertChattingByMsg(data);
	});
	socket.on("join",function(data){
		io.emit("room1",data); 
	});
	
	
  
});

var insertChattingByMsg = function (sendData){
    sendData.sql[4] = new Date();
    let sql = `
        insert into tb_chat(
               room_no,
               user_no,
               chat_code,
               chat_date,
               chat_content
        )
        values(
               ?,
               ?,
               ?,
               ?,
               ?
        )
    `;
    
    conn.query(sql, sendData.sql, function(err,result) {
        if (err) {
        	throw new Error(err);
        }
        conn.query("select ifnull(max(chatting_no),0) from tb_chatting",sendData.sql,function(err,chattingNo) {
            if(err) {throw new Error(err);}
            sendData.sql[5] = chattingNo;
        });
        switch(sendData.sql[3]/*코드번호*/){
            case "코드번호": io.emit(sendData.sql[0]/*방번호*/+"msg",sendData); break;
        }
    });
    
}


http.listen(10001, function() {
  console.log('chatting server on port 10001');
});