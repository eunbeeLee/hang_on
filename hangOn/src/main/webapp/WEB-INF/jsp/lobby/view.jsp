<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hangOn</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<!-- Bootstrap core CSS-->
<link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/css/sb-admin.css" rel="stylesheet">
<!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/alter/view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobby/lobby.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobby/roomRegist.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/css/mainNav.css">
	<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/chart.js/Chart.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->

<script>
if ("${msg}") {
	alert("${msg}")
}
</script>
</head>
<body>

<!-- Navigation-->
<div id="nav">
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="view.do"><img id="hangOnLogo"src="${pageContext.request.contextPath}/resources/image/HangOnLogo_3.png"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <!-- 종모양아이콘 -->
        <li class="nav-item dropdown">
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header">New Alerts:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-danger">
                <strong>
                  <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all alerts</a>
          </div>
        </li>
        
        <!-- 고객센터 아이콘 -->
        <li class="nav-item">
          <a class="nav-link" href='<c:url value="/board/list.do"/>'>
            <i class="fa fa-info-circle"></i>고객센터</a>
        </li>
        <!-- 사용자 아이콘 -->
		<li class="nav-item"><a class="nav-link" href='<c:url value="/admin/dashBoard.do"/>'> 
		  관리 페이지</a></li>
        <!-- 사용자 아이콘 -->
        <c:choose>
        	<c:when test="${empty user}">
		        <li class="nav-item">
		          <a class="nav-link" href="${pageContext.request.contextPath}/main/login.do">
		            <i class="fa fa-user-circle-o"></i>로그인 하세요</a>
		        </li>
        	</c:when>
        	<c:otherwise>
		        <li id="openMyPageBtn" class="nav-item">
		          <a class="nav-link" >
		         	<i class="fa fa-cog" aria-hidden="true"></i>정보변경</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" >
		            <i class="fa fa-user-circle-o"></i><span id="userNameView">${user.userName}</span>님</a>
		        </li>
        	</c:otherwise>
        </c:choose>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/main/logout.do" class="nav-link">
            <i class="fa fa-fw fa-sign-out"></i>로그아웃</a>
        </li>
      </ul>
    </div>
  </nav>
    </div>
  </nav>
</div>
  <div id="bodyCover">
    <div id="lobby">
        <h1 id="userTitle">ROOM  LIST</h1>
        <div id="roomGroup">
           	<c:choose>
		    	<c:when test="${empty room}">
		    	</c:when>    
		    	<c:otherwise>
		            <c:forEach var="room" items="${room}">
			            <div class="room-box">
			                <div class="room">
			                    <span class="room-title">${room.roomName }</span><br>
			                    <h6 class="room-people">${room.roomInfo}방설명자리</h6><br>
			                    <h5 class="total-people">${room.roomConnectUserCount} / ${room.roomNoConnectUserCount}</h5>
			                </div>
			                <div class="room-over">
			                    <button class="room-btn" onclick = "location.href = '${pageContext.request.contextPath}/room/${room.roomJoinCode}/view.do'">참여</button>
			                    <button class="room-btn" onclick = "location.href = '${pageContext.request.contextPath}/lobby/leave.do?roomNo=${room.roomNo}'">탈퇴</button>
			                </div>
			            </div>
		            </c:forEach>
		    	</c:otherwise>
           </c:choose> 
            <div class="room-box">
                <div class="room plus" >
                    <span id="registRoom" class="fa fa-plus-circle"></span>
                </div>
            </div>
        </div>
    </div>
 </div>   
   

  
<!-- 방생성 창 불러오기 -->
<c:import url="/WEB-INF/jsp/lobby/roomRegist.jsp">
</c:import>
  

<%-- 개인 페이지 불러오기 (진솔) --%>
<c:import url="/WEB-INF/jsp/alter/view.jsp">
	<c:param name="userName" value="${user.userName}"/>
	<c:param name="userEmail" value="${user.userEmail}"/>
	<c:param name="userProfilePath" value="${pageContext.request.contextPath}${user.userProfilePath}"/>
	<c:param name="userNo" value="${user.userNo}"/>
</c:import>

<script src="${pageContext.request.contextPath}/resources/js/lobby/lobby.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/lobby/roomRegist.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/alter/view.js"></script>


</body>
</html>