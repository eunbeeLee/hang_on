<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메인화면</title>
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/main/login.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">

<div class="content-wrapper">
  
<!-- 배경 비디오 -->
<figure class='vid'>
   <video autoplay="autoplay" loop="loop" muted="muted">
      <source src="${pageContext.request.contextPath}/resources/backgroundvideo/backgroundvideo.mp4">
   </video>
</figure>
  
<!-- 소개문구 창 -->
<div class="container intro-header">
	<h2 class="intro-context"><strong>
		HangOn 은 다중 화상회의에 특화된 웹페이지로써 <br>
		로그인 한번이면 누구나 쉽게 이용이 가능합니다. 
	</strong></h2>
</div>
  
<!-- 로그인 창 -->
<div class="container log-in">
  <div class="card card-login mx-auto">
    <div class="card-header">로그인</div>
    <div class="card-body">
      <form>
        <div class="form-group">
          <label for="exampleInputEmail1">이메일 주소</label>
          <input class="form-control" id="email" type="email" aria-describedby="emailHelp" placeholder="이메일을 입력하세요">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">비밀번호</label>
          <input class="form-control" id="pw" type="password" placeholder="비밀번호를 입력하세요">
        </div>
        <div class="form-group">
          <div class="form-check">
            <label class="form-check-label">
            <input class="form-check-input" type="checkbox">비밀번호 기억하기</label>
          </div>
        </div>
        <button class="btn btn-primary btn-block" id="login" type="button">로그인</button>
      </form>
      <div class="text-center">
        <a class="d-block small mt-3" href="register.do">회원가입</a>
        <a class="d-block small" href="forgotPassword.do">비밀번호를 잊어버리셨나요?</a>
      </div>
    </div>
  </div>
</div>

<script>

	$('#login').click(function () {
		var userEmail = $('#email').val();
		var userPw = $('#pw').val();
		
		console.log(userEmail);
		console.log(userPw);
		
		if(userEmail == '') {
			alert("이메일 주소를 입력해주세요");
			return false;
		} 
		if(userPw == '') {
			alert("비밀번호를 입력해주세요");
			return false;
		}
		$.ajax({
			url: `${pageContext.request.contextPath}/main/loginPost.json`,
			data: {userEmail: userEmail, userPw: userPw},
			type: "POST",
			dataType: "json",
			success: function(result){
				console.log(result);
	 			if (result.startsWith("/")){
	 				location.href = `${pageContext.request.contextPath}` + result;
	 				return;
	 			}
	 			alert(result);
			}
		});
	});
	
	var sessionUserEmail = '${UserEmail}';
	console.log(sessionUserEmail);
	console.log("hi");
	
	var whatisjson = '${pageContext.request.contextPath}/main/loginPost.json';
	console.log(whatisjson);
	
</script>

</div> <!-- content-wraper -->
</body>
</html>