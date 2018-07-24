<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
	#boxContent{
/* 	position: relative; */
/*     display: -webkit-box; */
/*     display: -ms-flexbox; */
/*     display: flex; */
/*     -webkit-box-orient: vertical; */
/*     -webkit-box-direction: normal; */
/*     -ms-flex-direction: column; */
    flex-direction: column;
/*      width: 70%;  */
    pointer-events: auto;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.2);
    border-radius: .3rem;
    outline: 0;
	}
	#boxHeader{
	height : 80px;
	}
	#boxContent{
	height : 440px;
	}
	#boxBody{
	height : 220px;
	margin-top: 20px;
	}
	#boxFooter{
	height : 100px;
	}
	#roomRegistBtn, #roomFindBtn{
	background-color:#dbd0ef;
	font-size:18px;
	padding: 10px 40px;
	color :#383838;
	}
	#roomRegistBtn:hover, #roomFindBtn:hover { 
	background: #b39bdd; 
	border: 1px solid rgba(0, 0, 0, 0.05); 
	box-shadow: 1px 1px 2px rgba(255, 255, 255, 0.2); 
	color: #ffffff; 
	}
	#roomEntranceNav a{
	color:#494949;
	}
	#roomRegistNav a{
	color:#a585c6;
	}
	.warningText{
	margin-left: 13px;
	color : #e24848;
	visibility : hidden;
	}
</style>
<body>
	<div id="roomRegistBox" >
        <div class="room-plus-box" id="boxContent">
        	<div id="boxHeader">
	        	<button class="close" type="button" data-dismiss="modal" aria-label="Close">
				  <span aria-hidden="true">×</span>
				</button>
	        	<ul class="nav nav-tabs">
				  <li role="presentation" class="active" id="roomRegistNav"><a href="#"><h4>방 생성</h4></a></li>
				  <li role="presentation" id="roomEntranceNav"><a href="#"><h4>방 입장</h4></a></li>
				</ul>
        	</div>
        		
        
        <div id="roomRegist">
        	<div id="boxBody">
        	<form  id="roomRegistForm"  method="post" action="<%=request.getContextPath()%>/lobby/roomRegist.do">
			  <div class="form-group" id="roomRegNm">
			    <label for="exampleInputEmail1"><h4><strong>방 이름</strong></h4></label>
			    <input class="form-control" maxlength="10" name="roomName" type="text" class="input" placeholder="방이름을 입력하세요.">
			    <div class="warningText" id="roomRegWarn">방 이름을입력하세요</div>
			  </div>
			  <div class="form-group">
			    <label for="roomPassword"><h4><strong>방 비밀번호</strong></h4></label>
			    <input id="roomPassword" class="form-control input" maxlength="10" name="roomPassword" type="password" placeholder="비밀번호(4자 ~ 8자)">
			    <div class="warningText" id="roomRegPassWarn">비밀번호는 4자~8자 사이로 입력하세요.</div>
			  </div>
			  <button type="submit" style="display : none" class="btn btn-default">제출</button>
			</form>
        	
        	</div>
        	<div class="modal-footer" id="boxFooter">
				<a class="btn" id="roomRegistBtn" href="#" data-dismiss="modal" aria-label="Close">방생성</a>
			</div>
			</div>
			
<!-- 	<div class="has-warning"> -->
<!--   <div class="checkbox"> -->
<!--     <label> -->
<!--       <input type="checkbox" id="checkboxWarning" value="option1"> -->
<!--       Checkbox with warning -->
<!--     </label> -->
<!--   </div> -->
<!-- </div> -->
			 <div id="roomEntrance">
		  	<div id="boxBody">
		  	<form  id="roomFindForm"  method="post" action="<%=request.getContextPath()%>/lobby/roomFind.do">
		  	  <div class="form-group" id="roomRegNm">
		  	    <label for="exampleInputEmail1"><h4><strong>방 코드</strong></h4></label>
		  	    <input class="form-control" maxlength="10" name="roomJoinCode" type="text" class="input" placeholder="방 코드을 입력하세요.">
		  	    <div class="warningText" id="roomEnWarn">방 코드를 입력하세요</div>
		  	  </div>
		  	  <div class="form-group" id="roomRePa">
		  	    <label for="roomPassword"><h4><strong>방 비밀번호</strong></h4></label>
		  	    <input class="form-control input"maxlength="10" name="roomPassword" type="password" placeholder="비밀번호(4자 ~ 8자)">
		  	    <div class="warningText" id="roomEnPassWarn">비밀번호는 4자~8자 사이로 입력하세요.</div>
		  	  </div>
		  	  <button type="submit" style="display : none" class="btn btn-default">제출</button>
		  	</form>
		  	</div>
		  	<div class="modal-footer" id="boxFooter">
		  		<a class="btn" id="roomFindBtn" href="#" data-dismiss="modal" aria-label="Close">방 입장</a>
		  	</div>
			</div>
			
			
<!--         	방입장 -->
<!--            <div id="roomEntrance"> -->
<!--                <div class="high-btn"> -->
<!--                	<div class="room-find regist-btn">room find</div> -->
<!--                	<div  class="room-regist regist-btn">room regist</div> -->
<!--                	<button id="roomRegistClose" type="button" class="back btn btn-default" style="padding: 0px !important;"> -->
<!-- 				<i class="material-icons">close</i> -->
<!-- 			</button> -->
<!--                </div> -->
<!--                <h1 id="roomRegistTitle">ROOM FIND</h1> -->
<%--                <form id="roomFindForm" method="post" action="<%=request.getContextPath()%>/lobby/roomFind.do"> --%>
<!-- 	               <div id="roomRegNm"> -->
<!-- 	                   <p class="room-ex">ROOM CODE</p> -->
<!-- 	                   <input maxlength="6" name="roomJoinCode" type="text" class="input" placeholder=""><br> -->
<!-- 	               </div> -->
<!-- 	               <div id="roomRePa" > -->
<!-- 	                   <p class="room-ex">ROOM PASSWORD</p> -->
<!-- 	                   <input maxlength="10" name="roomPassword" type="password" class="input"> -->
<!-- 	               </div> -->
<!-- 	               <div id="roomFindResult"></div> -->
<!-- 	               <div id="roomReBtns"> -->
<!-- 	                   <button type="button" id="roomFindBtn" class="room-regist-btn">ROOM 입장</button> -->
<!-- 	               </div> -->
<!--                </form> -->
<!--            </div> -->
           
<!--           방 생성 -->
<!--            <div id="roomRegist"> -->
<!--                <div class="high-btn"> -->
<!--                	<div class="room-find regist-btn">room find</div> -->
<!--                	<div  class="room-regist regist-btn">room regist</div> -->
<!--                	<button id="roomRegistClose" type="button" class="back btn btn-default" style="padding: 0px !important;"> -->
<!-- 				<i class="material-icons">close</i> -->
<!-- 			</button> -->
<!--                </div> -->
<!--                 <h1 id="roomRegistTitle">NEW ROOM</h1> -->
<%--                 <form id="roomRegistForm" method="post" action="<%=request.getContextPath()%>/lobby/roomRegist.do"> --%>
<!-- 	                <div id="roomRegNm"> -->
<!-- 	                    <p class="room-ex">ROOM NAME</p> -->
<!-- 	                    <input maxlength="10" name="roomName" type="text" class="input" placeholder=""><br> -->
<!-- 	                </div> -->
<!-- 	                <div id="roomRePa" > -->
<!-- 	                    <p class="room-ex">ROOM PASSWORD</p> -->
<!-- 	                    <input id="roomPassword" maxlength="10" name="roomPassword" type="password" class="input"> -->
<!-- 	                </div> -->
<!-- 	                <div id="roomReBtns"> -->
<!-- 	                    <button id="roomRegistBtn" type="button" class="room-regist-btn">ROOM 생성</button> -->
<!-- 	                </div> -->
<!--                 </form> -->
<!--             </div> -->
        </div>
	</div>

</body>
</html>