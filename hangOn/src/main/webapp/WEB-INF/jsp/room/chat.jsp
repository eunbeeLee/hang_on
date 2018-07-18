<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link >
	<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
</head>
<body>
  	<div id="backBox">
      <div id="chatBigBox">
        <div class="menu">
            <input type="text" placeholder="search">
            <button type="submit"><i class="fa fa-search"></i></button>
        </div>
        <ol class="chat">
    	</ol>
    	<div id="textBox">
        	<textarea class="textarea"></textarea>
        	<button id="textBoxBtn">전송</button>
    	</div>
    </div>
	</div>
    <script type="text/javascript">

    var ws = null;
   	var connectNo = ${sessionScope.user.userNo};
    var connectName = "${sessionScope.user.userName}";
    var sendMsg = "";

    $(function () {
        ws = new WebSocket('ws://localhost/hangOn/room/chat.do');
    	ws.onopen = function() {
       	    console.log('웹소켓 서버 접속 성공');
        	// 사용자 입장시 메세지 출력
        	ws.send("connect:"+"${code}"+":"+connectNo+":"+connectName+":님이 입장하셨습니다.");
    	};
        // 메세지 받기
        ws.onmessage = function(evt) {
        	var arr = evt.data.split(":");
        	var state = arr[0];
        	if(isNaN(state)){
	        	if("condition" == state){
	            	$(".chat").append("<li id='alarm'><span>"+arr[1]+":"+arr[2]+"</span></li>");
	        	} 
        	} else {
	        	if(${sessionScope.user.userNo} == state) {
	        		$(".chat").append(
	        					"<li class='self'>"+
	        	    				"<div class='msg'>"+
	        						"<p>"+arr[2]+"</p>"+
	        						"<time>"+arr[3]+":"+arr[4]+"</time>"+
	        	    				"</div>"+
	        	    			"</li>");
	        	} else {
	        		$(".chat").append(
	        					"<li class='other'>"+
	        						"<div class='avatar'><img src='https://i.imgur.com/DY6gND0.png' draggable='false'/></div>"+
	        	    				"<div class='msg'>"+
	        	    				"<div class='otherName'>"+arr[1] +"</div>"+
	        						"<p>"+arr[2]+"</p>"+
	        						"<time>"+arr[3]+":"+arr[4]+"</time>"+
	        	    				"</div>"+
	        	    			"</li>");
	        	}
        	}
        	$(window).scroll(function(){ 
        	    if  ($(window).scrollTop() == $("#chatBigBox").height() - $(window).height()){ 
        	       alert("로딩하기~~"); 
        	    } 
        	});

	        $("#chatBigBox").scrollTop($("#chatBigBox")[0].scrollHeight);
		};
        ws.onerror = function(evt) {
			console.log("에러발생" + evt.data);
        };
        ws.onclose = function() {
        	$(".chat").append("<li id='alarm'><span>서버가 끊겼습니다.</span></li>");
        };
        

    });


    $('#textBoxBtn').click(function() { 
    	chatsend();
    });
    $('.textarea').keydown(function (e) {
   		if (e.ctrlKey && e.keyCode == 13) {
    		chatsend();  
    	}
    });
    
    function chatsend() {
    	var $msg = $(".textarea");
        // 웹소켓 서버에 데이터 전송하기
    	if($msg.val().length < 1) return;
        var blank_pattern =/^\s+|\s+$/g;
        if($msg.val().replace(blank_pattern,'') == '') return;
        ws.send("sendMsg:"+"${code}:" + connectNo + ":" + connectName + ":" + $msg.val());
        $msg.val(""); 
    }
    

    
    
    
    

    </script>
</body>
</html>