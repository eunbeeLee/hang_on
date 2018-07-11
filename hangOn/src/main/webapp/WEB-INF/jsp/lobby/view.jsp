<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobby/lobby.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobby/roomRegist.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/datatables/dataTables.bootstrap4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/css/mainNav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js">
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/js/sb-admin.min.js"></script>
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/js/sb-admin-datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/js/sb-admin-charts.min.js"></script>
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
    <a class="navbar-brand" href="index.html"><img id="hangOnLogo"src="${pageContext.request.contextPath}/resources/image/HangOnLogo_3.png"></a>
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
          <a class="nav-link" >
            <i class="fa fa-info-circle"></i>고객센터</a>
        </li>
        <!-- 사용자 아이콘 -->
        <li id="openMyPageBtn" class="nav-item">
          <a class="nav-link" >
            <i class="fa fa-user-circle-o"></i>홍길동님</a>
        </li>
      </ul>
    </div>
  </nav>
</div>
  <div id="bodyCover">
    <div id="lobby">
        <h1 id="userTitle">ROOM  LIST</h1>
        <div id="roomGroup">
            <div class="room-box">
                <div class="room">
                    <span class="room-title">비트 회의방</span>
                    <span class="total-people">3 / 6</span><br>
                    <p class="room-people">현재 참여중인 사람 1, 사람2, 사람3, 사람4</p>
                </div>
                <div class="room-over">
                    <button class="room-btn">참여</button>
                    <button class="room-btn">탈퇴</button>
                </div>
            </div>
            <div class="room-box">
                <div class="room">
                    <span class="room-title">비트 회의방</span>
                    <span class="total-people">3 / 6</span><br>
                    <p class="room-people">현재 참여중인 사람 1, 사람2, 사람3, 사람4</p>
                </div>
                <div class="room-over">
                    <button class="room-btn">참여</button>
                    <button class="room-btn">탈퇴</button>
                </div>
            </div>
            <div class="room-box">
                <div class="room">
                    <span class="room-title">비트 회의방</span>
                    <span class="total-people">3 / 6</span><br>
                    <p class="room-people">현재 참여중인 사람 1, 사람2, 사람3, 사람4</p>
                </div>
                <div class="room-over">
                    <button class="room-btn">참여</button>
                    <button class="room-btn">탈퇴</button>
                </div>
            </div>
            <div class="room-box">
                <div class="room">
                    <span class="room-title">비트 회의방</span>
                    <span class="total-people">3 / 6</span><br>
                    <p class="room-people">현재 참여중인 사람 1, 사람2, 사람3, 사람4</p>
                </div>
                <div class="room-over">
                    <button class="room-btn">참여</button>
                    <button class="room-btn">탈퇴</button>
                </div>
            </div>
            <div class="room-box">
                <div class="room plus" >
                    <span id="regist-room" class="fa fa-plus-circle"></span>
                </div>
            </div>
        </div>
    </div>
 </div>   

  
<!-- 방생성 창 불러오기 -->
<c:import url="/WEB-INF/jsp/lobby/roomRegist.jsp">
</c:import>
  

<%-- 개인 페이지 불러오기 (진솔) --%>
<c:import url="/WEB-INF/jsp/mypage/view.jsp">
	<c:param name="name" value="홍길동"/>
	<c:param name="mail" value="abcd@gmail.com"/>
	<c:param name="profilePath" value="${pageContext.request.contextPath}/resources/image/defalutImg.jpg"/>
	<c:param name="no" value="1"/>
</c:import>

<script src="${pageContext.request.contextPath}/resources/js/lobby/lobby.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/lobby/roomRegist.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage/view.js"></script>


</body>
</html>