<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lobby/lobby.css">
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
</head>
<body>

<!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html"><img id="hangOnLogo"src="${pageContext.request.contextPath}/resources/image/HangOnLogo_3.png"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <!-- 종모양아이콘 -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
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

    <div id="lobby">
        <h1 id="userTitle">사용자님 ROOMLIST</h1>
        <div id="roomGroup">
            <div class="room">
                <span class="room-title">비트 회의방</span>
                <span class="total-people">3 / 6</span><br>
                <p class="room-people">현재 참여중인 사람 1, 사람2, 사람3, 사람4</p>
            </div>
            <div class="room" onclick="hover()">
                <span class="room-title">비트 회의방</span>
                <span class="total-people">3 / 6</span><br>
                <p class="room-people">현재 참여중인 사람 1, 사람2, 사람3, 사람4</p>
            </div>
            <div class="room">
                <span class="room-title">비트 회의방</span>
                <span class="total-people">3 / 6</span><br>
                <p class="room-people">현재 참여중인 사람 1, 사람2, 사람3, 사람4</p>
            </div>
            <div class="room">
                <span class="room-title">비트 회의방</span>
                <span class="total-people">3 / 6</span><br>
                <p class="room-people">현재 참여중인 사람 1, 사람2, 사람3, 사람4</p>
            </div>
            <div class="room" onclick="location.href='#open'">
                <span id="regist-room" class="fa fa-plus-square-o"></span>
            </div>
        </div>
    </div>
    <div class="room-regist-box" id="open">
       <div>
            <h1 id="roomRegistTitle">New ROOM</h1>
            <div id="roomRegNm">
                <p class="room-ex">ROOM NAME</p>
                <input type="text" class="input" placeholder=""><br>
            </div>
            <div id="roomReSc">
                <p class="room-ex">SECURITY</p>
                <span class="room-regist-security">
                    <label for="roomFree">
                        <input type="radio" id="roomFree" name="regisec" value="M" onclick="offPass()" /><span class="sec">공개</span>
                    </label>
                    <label for="roomPass">
                        <input type="radio" id="roomPass" name="regisec" value="F" onclick="openPass()" /><span class="sec">비공개</span>
                    </label>
                </span>
            </div>
            <!-- 비공개 버튼 누를시에만 나타나도록-->
            <div id="roomRePa" >
                <p class="room-ex">ROOM 비밀번호 입력</p>
                <input type="password" class="input">
            </div>
            <div id="roomReBtns">
                <a href="" class="room-regist-btn">ROOM 생성</a>
                <a href="#close" class="room-regist-btn">닫기</a>
            </div>
        </div>
    </div>
    
    <!-- 하단 -->
      <div class="content-wrapper">
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Your Website 2018</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>

  
  </div>

<%-- 개인 페이지 불러오기 (진솔) --%>
<c:import url="/WEB-INF/jsp/mypage/view.jsp">
	<c:param name="name" value="홍길동"/>
	<c:param name="mail" value="abcd@gmail.com"/>
	<c:param name="profilePath" value="${pageContext.request.contextPath}/resources/image/defalutImg.jpg"/>
	<c:param name="no" value="1"/>
</c:import>

<script src="${pageContext.request.contextPath}/resources/js/lobby/lobby.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage/view.js"></script>
</body>
</html>