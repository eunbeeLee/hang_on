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
        <ol class="chat">
    	</ol>
    	<div id="textBox">
        	<textarea class="textarea form-control" rows="3" placeholder="전송하실 메세지를 입력해주세요"></textarea>
        	<button type="button" class="btn btn-default textBoxBtn" >전송</button>
			<span id="cES">Ctrl + Enter 메세지 전송</span>
        	<span id="nR"><i class='fa fa-thumb-tack'></i>&nbsp;&nbsp;공지로 등록</span>
    	</div>
    </div>
	</div>
	
    <script type="text/javascript">

    var ws = null;
   	var connectNo = ${sessionScope.user.userNo};
    var connectName = "${sessionScope.user.userName}";
    var sendMsg = "";

    $(function () {
        ws = new WebSocket('ws://localhost:8000/hangOn/room/chat.do');
    	ws.onopen = function() {
       	    console.log('웹소켓 서버 접속 성공');
        	// 사용자 입장시 메세지 출력
        	ws.send("connect＆"+"${code}"+"＆"+connectNo+"＆"+connectName+"＆님이 입장하셨습니다.");
    	};
        // 메세지 받기
        ws.onmessage = function(evt) {
        	var arr = evt.data.split("＆");
        	var state = arr[0];
        	var peNo = arr[5]+"";
        	if(isNaN(state)){
	        	if("condition" == state){
	            	$(".chat").append("<li id='alarm'><span>"+arr[2]+arr[3]+arr[4]+"</span></li>");
	            	if(arr[1] == 2) {
	            		$("."+peNo).remove();
	            		
	            	}
	        	}
	        	if("peAlarm" == state) {
	        		$("#userState").append(
	        				"<div class='"+arr[3]+"''>"+
	        				"<a class='dropdown-item' >"+
	        	              "<span class='text-success'>"+
	        	                "<strong>"+
	        	                  "<i class='fa fa-fw fa-circle'></i>"+arr[2]+"</strong>"+
	        	              "</span>"+
	        	              "<span class='small float-right text-muted'>"+arr[4]+"</span>"+
	        	              "<div class='dropdown-message small'></div>"+
	        	            "</a>"+
	        	             "<div class='dropdown-divider'></div>"+
	        	             "</div>"
	        				);
	        	} 
	        	if("sendMsg" == state) {
		        	if(${sessionScope.user.userNo} == arr[1]) {
		        		$(".chat").append(
		        					"<li class='self'>"+
		        	    				"<div class='msg' data-userNo="+arr[1]+">"+
		        	    				"<p class='noticeContent'>"+arr[3]+"</p>"+
		        	    				"<div class='selfBar' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
		        					  	"<i class='fa fa-thumb-tack'></i>"+
		        						"</div>"+
		        					    "<div class='dropdown-menu'>"+
		        					    "<a class='dropdown-item noticeRegistBtn' href='#' data-userNo="+arr[1]+">공지로 등록</a>"+
		        						"</div>"+
		        						"<time>"+arr[4]+"</time>"+
		        	    				"</div>"+
		        	    			"</li>");
		        	} else {
		        		$(".chat").append(
		        					"<li class='other'>"+
		        	    				"<div class='msg'>"+
		        	    				"<div class='otherName'>"+
		        	    				"<span>"+arr[2] +"</span></div>"+
		        						"<p class='noticeContent'>"+arr[3]+"</p>"+
		        						"<div class='selfBar' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
		        					  	"<i class='fa fa-thumb-tack'></i>"+
		        						"</div>"+
		        					    "<div class='dropdown-menu'>"+
		        					    "<a class='dropdown-item noticeRegistBtn' href='#' data-userNo="+arr[1]+">공지로 등록</a>"+
		        						"</div>"+
		        						"<time>"+arr[4]+"</time>"+
		        	    				"</div>"+
		        	    			"</li>");
		        	}
	        	}
		        $("#chatBigBox").scrollTop($("#chatBigBox")[0].scrollHeight);
        	}
        };
        ws.onerror = function(evt) {
			console.log("에러발생" + evt.data);
        };
        ws.onclose = function() {
        	$(".chat").append("<li id='alarm'><span>서버가 끊겼습니다.</span></li>");
        };
        

    });


    $('.textBoxBtn').click(function() { 
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
        ws.send("sendMsg＆"+"${code}＆" + connectNo + "＆" + connectName + "＆" + $msg.val());
        $msg.val(""); 
    }
    
    $(".chat").on("click", ".noticeRegistBtn", function (e) {
    	var $this = $(this);
    	var userNo = $this.attr("data-userNo");
    	var roomNo = ${roomNo};
    	var noticeContent = $this.parent().siblings(".noticeContent").html();
    	e.preventDefault();
    	
    	$.ajax({
    		url: `${pageContext.request.contextPath}/room/noticeRegist.json`,
    		data: {
    			userNo: userNo,
    			roomNo: roomNo,
    			noticeContent: noticeContent
    		},
    		type: "POST",
    		dataType: "json",
    		complete: function() {
    			// 모달로 변경 예정
    			alert("공지 등록이 완료되었습니다.");
 				$this.parent().siblings(".selfBar").children().css("color", "#595959");
 				$this.parent().siblings(".selfBar").children().css("cursor", "inherit");
 				$this.parent().remove();
 				$this.remove();
    		}
    	});
    })
    

    
    
    
    

    </script>
</body>
</html>