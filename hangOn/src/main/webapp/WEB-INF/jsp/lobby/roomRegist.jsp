<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	<div id="roomRegistBox">
        <div class="room-plus-box">
           <div id="roomEntrance">
               <div class="high-btn">
               	<div class="room-find regist-btn">room find</div>
               	<div  class="room-regist regist-btn">room regist</div>
               	<button id="roomRegistClose" type="button" class="back btn btn-default" style="padding: 0px !important;">
				<i class="material-icons">close</i>
			</button>
               </div>
               <h1 id="roomRegistTitle">ROOM FIND</h1>
               <form id="roomFindForm" method="post" action="<%=request.getContextPath()%>/lobby/roomFind.do">
	               <div id="roomRegNm">
	                   <p class="room-ex">ROOM CODE</p>
	                   <input maxlength="6" name="roomJoinCode" type="text" class="input" placeholder=""><br>
	               </div>
	               <div id="roomRePa" >
	                   <p class="room-ex">ROOM PASSWORD</p>
	                   <input maxlength="10" name="roomPassword" type="password" class="input">
	               </div>
	               <div id="roomFindResult"></div>
	               <div id="roomReBtns">
	                   <button type="button" id="roomFindBtn" class="room-regist-btn">ROOM 입장</button>
	               </div>
               </form>
           </div>
           <div id="roomRegist">
               <div class="high-btn">
               	<div class="room-find regist-btn">room find</div>
               	<div  class="room-regist regist-btn">room regist</div>
               	<button id="roomRegistClose" type="button" class="back btn btn-default" style="padding: 0px !important;">
				<i class="material-icons">close</i>
			</button>
               </div>
                <h1 id="roomRegistTitle">NEW ROOM</h1>
                <form id="roomRegistForm" method="post" action="<%=request.getContextPath()%>/lobby/roomRegist.do">
	                <div id="roomRegNm">
	                    <p class="room-ex">ROOM NAME</p>
	                    <input maxlength="10" name="roomName" type="text" class="input" placeholder=""><br>
	                </div>
	                <div id="roomRePa" >
	                    <p class="room-ex">ROOM PASSWORD</p>
	                    <input id="roomPassword" maxlength="10" name="roomPassword" type="password" class="input">
	                </div>
	                <div id="roomReBtns">
	                    <button id="roomRegistBtn" type="button" class="room-regist-btn">ROOM 생성</button>
	                </div>
                </form>
            </div>
        </div>
	</div>
</body>
</html>