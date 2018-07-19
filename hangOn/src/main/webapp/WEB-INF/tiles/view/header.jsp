<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>메인화면</title>
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/main/login.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body class="fixed-nav" id="page-top">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/main/login.do"><img id="hangOnLogo" src="${pageContext.request.contextPath}/resources/image/HangOnLogo_3.png"></a>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
	        <li class="nav-item">
	        	<a class="nav-link" href="${pageContext.request.contextPath}/main/registerForm.do"><i class="fa fa-user-circle-o"></i>   회원가입</a>
	        </li>
	        <li class="nav-item">
	        	<a class="nav-link" href="${pageContext.request.contextPath}/board/list.do"><i class="fa fa-info-circle"></i>   고객센터</a>
	        </li>
<!-- 	        <li class="nav-item"> -->
<%-- 	        	<a class="nav-link" href="${pageContext.request.contextPath}/main/logout.do">로그아웃</a> --%>
<!-- 	        </li> -->
        </ul>
    </div>
</nav>

</body>
</html>