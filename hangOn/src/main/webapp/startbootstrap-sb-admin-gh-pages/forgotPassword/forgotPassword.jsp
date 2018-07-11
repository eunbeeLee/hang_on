<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>비번찾기</title>
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/forgotPassword/forgotPassword.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
 
<!-- 네비게이션 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="#"><img id="hangOnLogo" src="${pageContext.request.contextPath}/resources/image/HangOnLogo_3.png"></a>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
	        <li class="nav-item">
	        	<a class="nav-link" >로그인</a>
	        </li>
	        <li class="nav-item">
	        	<a class="nav-link" >회원가입</a>
	        </li>
	        <li class="nav-item">
	        	<a class="nav-link" ><i class="fa fa-info-circle"></i>고객센터</a>
	        </li>
        </ul>
    </div>
</nav>

<!-- 네비바랑 footer 사이를 감싸고 있는 div -->
<div class="content-wrapper">

<!-- 배경화면 -->
<div class="background-picture">
	<img src="${pageContext.request.contextPath}/resources/image/rapunzel.jpg">
</div>

<!-- 비밀번호 재설정 창 -->
<div class="container" id="forgot-password">
  <div class="card card-login mx-auto mt-5">
    <div class="card-header">비밀번호 재설정하기</div>
    <div class="card-body">
      <div class="text-center mt-4 mb-5">
        <h4>비밀번호를 잊어버리셨나요?</h4><br>
        <p>등록된 이메일을 입력해주시면 새로운 비밀번호를 보내드립니다</p>
      </div>
      <form>
        <div class="form-group">
          <input class="form-control" id="exampleInputEmail1" type="email" aria-describedby="emailHelp" placeholder="이메일 주소를 입력하세요">
        </div>
        <a class="btn btn-primary btn-block" href="login.html">새 비밀번호를 보내드립니다</a>
      </form>
      <div class="text-center">
        <a class="d-block small mt-3" href="register.html">회원가입 페이지로 이동하기</a>
        <a class="d-block small" href="login.html">메인 페이지로 이동하기</a>
      </div>
    </div>
  </div>
</div>

<!-- footer -->
<footer class="sticky-footer">
	<div class="container">
		<div class="text-center">
			<small>Copyright © Your Website 2018</small>
		</div>
	</div>
</footer>

</div>
</body>
</html>