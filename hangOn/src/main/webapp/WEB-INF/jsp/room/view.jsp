<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
 	<title>SB Admin - Start Bootstrap Template</title>
	<!-- Bootstrap core CSS-->
	<link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom fonts for this template-->
	<link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!-- Custom styles for this template-->
	<link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/css/sb-admin.css" rel="stylesheet">
	<!-- 구글 아이콘 -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/room/room.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/room/down.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/document/document.css" rel="stylesheet"> <%-- document css 진솔 --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/room/chat.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/room/video.css">	
</head>

<body class="fixed-nav bg-dark sidenav-toggled" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html"><img id="hangOnLogo" src="${pageContext.request.contextPath}/resources/image/HangOnLogo_3.png"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="채팅">
          <a id="chatNav" class="nav-link" href="index.html">
              <i class="material-icons">chat</i>
            <span class="nav-link-text">채팅</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="다운로드">
          <a id="downNav" class="nav-link" href="charts.html">
              <i class="material-icons">folder</i>
            <span class="nav-link-text">다운로드</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="문서공유">
          <a id="documentNav" class="nav-link">
            <i class="material-icons">file_copy</i>
            <span class="nav-link-text">문서공유</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="음성번역">
          <a class="nav-link" href="tables.html">
              <i class="material-icons">g_translate</i>
            <span class="nav-link-text">음성번역</span>
          </a>
        </li>
      </ul>
      <!-- 토글바 -->
      <ul class="navbar-nav sidenav-toggler">  
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
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
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>나가기</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="content-wrapper">
     <%-- 문서공유 영역 진솔 --%>
   	<c:import url="/WEB-INF/jsp/document/view.jsp">
		<c:param name="msg" value="test"/>
	</c:import>
   	<%-- 문서공유 영역 진솔 --%>
    <div class="main-doc">

		
     <%--  
     <div class="user" style="height: 20%;">
          <i class="material-icons">videocam</i>
          <i class="material-icons">videocam_off</i>
          <i class="material-icons">volume_off</i>
          <i class="material-icons">volume_up</i>
          <span class="glyphicon glyphicon-volume-up"></span>
          <span class="glyphicon glyphicon-volume-off"></span>
      </div>
       --%>

       <!-- local/remote videos container -->
       <table id="videos-container"></table>
       
       
    </div>
  



    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->

  </div>
  <c:import  url="/WEB-INF/jsp/room/chat.jsp">
  </c:import>
  
  <c:import url="/WEB-INF/jsp/room/down.jsp">
  </c:import>
  <div id="setup-room">
  	  <input type="text" id="conference-name">
      <button id="setup-new-room" class="setup">new</button>
      <!-- list of all available conferencing rooms -->
      <table id="rooms-list"></table>
  </div>
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
	<script src="${pageContext.request.contextPath}/resources/js/room/room.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/document/pdfobject.min.js"></script><%-- document js 진솔 --%>
	<script src="${pageContext.request.contextPath}/resources/js/document/document.js"></script><%-- document js 진솔 --%>
	
	<!-- video confernece -->
	<script src="https://cdn.webrtc-experiment.com/getMediaElement.min.js"> </script>
    <script src="https://cdn.webrtc-experiment.com/socket.io.js"> </script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="https://cdn.webrtc-experiment.com/IceServersHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/CodecsHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/video-conferencing/RTCPeerConnection-v1.5.js"> </script>
    <script src="https://cdn.webrtc-experiment.com/video-conferencing/conference.js"> </script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.1/socket.io.dev.js"></script>
    
	<script src="${pageContext.request.contextPath}/resources/js/room/chat.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/room/video.js"></script>
</body>

</html>