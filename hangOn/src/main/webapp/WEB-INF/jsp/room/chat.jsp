<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link >
</head>
<body>
  <div id="backBox">
      <div id="chatBigBox">
        <div class="menu">
            <input type="text" placeholder="search">
            <button type="submit"><i class="fa fa-search"></i></button>
        </div>
        <ol class="chat">
        <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
        <div class="msg">
            <p>Hola!</p>
            <p>Te vienes a cenar al centro? <emoji class="pizza"/></p>
            <time>20:17</time>
        </div>
        </li>
    <li class="self">
        <div class="avatar"></div>
      <div class="msg">
        <p>Puff...</p>
        <p>Aún estoy haciendo el contexto de Góngora... <emoji class="books"/></p>
        <p>Mejor otro día</p>
        <time>20:18</time>
      </div>
    </li>
    <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
        <p>Qué contexto de Góngora? <emoji class="suffocated"/></p>
        <time>20:18</time>
      </div>
    </li>
    <li class="self">
        <div class="avatar"><img src="https://i.imgur.com/HYcn9xO.png" draggable="false"/></div>
      <div class="msg">
        <p>El que mandó Marialu</p>
        <p>Es para mañana...</p>
        <time>20:18</time>
      </div>
    </li>
    <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
        <p><emoji class="scream"/></p>
        <p>Pásamelo! <emoji class="please"/></p>
        <time>20:18</time>
      </div>
    </li>
    <li class="self">
        <div class="avatar"><img src="https://i.imgur.com/HYcn9xO.png" draggable="false"/></div>
      <div class="msg">
        <img src="https://i.imgur.com/QAROObc.jpg" draggable="false"/>
        <time>20:19</time>
      </div>
    </li>
    <li class="other">
        <div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
      <div class="msg">
        <p>Gracias! <emoji class="hearth_blue"/></p>
        <time>20:20</time>
      </div>
    </li>
    </ol>
    <div id="textBox">
        <textarea class="textarea"></textarea>
        <div class="emojis"><i class="fa fa-external-link"></i></div>
        <button id="textBoxBtn">전송</button>
    </div>
    </div>
    </div>
    <script type="text/javascript">
    var socket = io.connect('https://localhost:10001');
    
    $(()=>{socket.emit("join","테스트 전송")})
    socket.on("room1",(data)=>{console.log(data)})
    // ------------------------------------------------------ 메세지 보내는 기능
    // 전송 버튼 누를시 보내지도록
    $("#textBoxBtn").on("click", function () {
    	onMsg();
    });
    
    // ctrl + enter 치면 보내지도록
    $(".textarea").on("keyup",function(e){
        if(e.keyCode==13&&e.ctrlKey){ onMsg() }
    });
    
    // 메세지를 서버에 보내주는 역할
	function onMsg () {
   		let text = $(".textarea");
   		if (text.html().length < 1) {
   			return;
   		} else {
   			socket.emit("myMsg",{"user":user,"sql":[${room.roomNo}, user.userNo, "채팅코드", "채팅날짜 시간", text.html()]});
   			text.html("");
   		}
   	}
    
    // 서버에서 넘어온메세지를 받아주는 역할
 	socket.on(${room.roomNo}+"msg",function(result){
		chattingViewByMsg(result);
	})
    
    // 화면에 메세지를 띄워주는 역할
    function chattingViewByMsg(result) {
    	// 보낸 유저 객체가 담김
		let user = result.user;
    	// 메세지 내용이 담김
		let msg = result.sql[5];
		// 메세지 보낸 일시
    	let date = result.sql[4]);
	
    	// 내가 보낸 메세지 일시에
		if(${user.userNo}==user.userNo){
	        $(".chat").append(
	        	`<li class="self">
    				<div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
    				<div class="msg">
	    				<p>`+msg+`</p>
	    				<time>`+date+`</time>
    				</div>
    			</li>`);
// 	        screenScroll(2);
		}
    	
    	// 내가 보내지 않은 메세지 일시에
		else{
			$(".chat").append(
					`<li class="other">
    					<div class="avatar"><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
    					<div class="msg">
	    				<p>`+msg+`</p>
	    				<time>`+date+`</time>
    				</div>
    				</li>`);
// 			screenScroll(1,user,msg);
		}
	}
    
    
    </script>
</body>
</html>