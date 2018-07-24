<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메인화면</title>
    <meta name="google-signin-client_id" content="880617749149-u3k5io2lv7d6i0u5mccdl283j6tgratg.apps.googleusercontent.com">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/main/login.css" rel="stylesheet">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/login.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<div class="content-wrapper">
  
	<!-- 배경 비디오 -->
	<figure class='vid'>
	   <video autoplay="autoplay" loop="loop" muted="muted">
	      <source src="${pageContext.request.contextPath}/resources/backgroundvideo/island.mp4">
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
	<div class="container log-in" id="login-window">
	<div class="card card-login mx-auto">
	    <div class="card-header" style="text-align:center;"><strong>로그인</strong></div>
	    <div class="card-body">
	      <form id="loginForm">
	        <div class="form-group">
	          <label for="exampleInputEmail1">이메일 주소</label>
	          <input class="form-control" id="email" onkeyup="toPwFocus()" type="email" placeholder="이메일을 입력하세요" autofocus>
	        </div>
	        <div class="form-group">
	          <label for="exampleInputPassword1">비밀번호</label>
	          <input class="form-control" id="pw" onkeyup="toLoginBtn();" type="password" placeholder="비밀번호를 입력하세요">
	        </div><br>
	        <button class="btn btn-primary btn-block" id="login" type="submit" style="background-color:#b39bdd; border: 0;">로그인</button>
	      </form>
	      <div>
	        <span class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" id="google"></span>
		    <span class="text-center" id="smallText">
				<a class="d-block small mt-3" style="color:#b39bdd;" href="registerForm.do">회원가입&nbsp;&nbsp;</a>
				<a class="d-block small" style="color:#b39bdd;" href="forgotPassword.do">비밀번호를 잊어버리셨나요?&nbsp;&nbsp;</a>
			</span>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal -->
	<div id="loginModalWrapper"></div>

</div> <!-- content-wraper -->

<script>
	
	// 페이지 시작시 실행 함수
	$(document).ready(function () {
		if ("${msg}" == "emailSent") {
			document.querySelector("#emailSentModalBtn").click();
		}
		else if ("${msg}" == "congratulations") {
			document.querySelector("#congratulationsModalBtn").click();
		}
		else if ("${msg}" == "loginPlz") {
			document.querySelector("#loginPlzModalBtn").click();
		}
		else if ("${msg}" == "filter") {
			document.querySelector("#loginPlzModalBtn").click();
		}
		console.log("${userEmail}");
		$("#email").focus();
	});

	// 구글 로그인시 넘어오는 정보
	function onSignIn(googleUser) {
		// Useful data for your client-side scripts:
		var profile = googleUser.getBasicProfile();
		console.log("ID: " + profile.getId()); // Don't send this directly to your server!
		console.log('Full Name: ' + profile.getName());
		console.log('Given Name: ' + profile.getGivenName());
		console.log('Family Name: ' + profile.getFamilyName());
		console.log("Image URL: " + profile.getImageUrl());
		console.log("Email: " + profile.getEmail());
		
		// The ID token you need to pass to your backend:
		var id_token = googleUser.getAuthResponse().id_token;
		console.log("ID Token: " + id_token);
		
		// 구글 로그인했을때 바로 회원가입으로 던져준다. 이미 가입되있으면 로그인으로 던지고 안되있으면 가입후 로그인으로 던진다.
		$.ajax({
			url: `${pageContext.request.contextPath}/main/googleLogin.json`,
			data: {userEmail : profile.getEmail()},
			type: "POST",
			dataType: "json",
			success: function (no) {
				if(no == 0) {
					$.ajax({
						url: `googleRegister.json`,
						data: {userEmail : profile.getEmail(), userName : profile.getName(), userPw : profile.getId()},
						type: "POST",
						dataType: "json",
						success: function () {
							$.ajax({
								url: `loginPost.json`,
								data: {userEmail : profile.getEmail(), userPw : profile.getId()},
								type: "POST",
								dataType: "json",
								success: function(result){
						 			if (result.startsWith("/")){
						 				// 구글에서 받은 정보로 로그인 시킨 다음에 구글계정은 바로 로그아웃 시킨다
						 				document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8000/hangOn/lobby/view.do"
						 				return;
						 			}
								}	
							});
						}
					});
				}
				else {
					$.ajax({
						url: `loginPost.json`,
						data: {userEmail : profile.getEmail(), userPw : profile.getId()},
						type: "POST",
						dataType: "json",
						success: function(result){
				 			if (result.startsWith("/")){
				 				// 구글에서 받은 정보로 로그인 시킨 다음에 구글계정은 바로 로그아웃 시킨다
				 				document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8000/hangOn/lobby/view.do";
				 				return;
				 			}
						}
					});	
				}
			}
		});
	};
	
// 구글 로그아웃 함수
// 	var logout = function() {
// 	    document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8000/hangOn/lobby/view.do";
// 	}

// 로그인 유효성 검사
$('#login').click(function () {
	var userEmail = $('#email').val();
	var userPw = $('#pw').val();
	
	if(userEmail == '') {
		document.querySelector("#emptyEmailModalBtn").click();
		return false;
	} 
	if(userPw == '') {
		document.querySelector("#emptyPwModalBtn").click();
		return false;
	}
	$.ajax({
		url: `${pageContext.request.contextPath}/main/loginPost.json`,
		data: {userEmail: userEmail, userPw: userPw},
		type: "POST",
		dataType: "json",
		success: function(result){
 			if (result.startsWith("/")){
 				location.href = `${pageContext.request.contextPath}` + result;
 				return;
 			}
 			if (result == "1") {
				document.querySelector("#wrongEmailModalBtn").click();
 				return;
 			}
 			else if (result == "2") {
				document.querySelector("#wrongPwModalBtn").click();
 				return;
 			}
		}
	});
});


// function toPwFocus() {
// 	if (window.event.keyCode == 13) {
//         $("#pw").focus();
//    }
// }

// function toLoginBtn() {
// 	if (window.event.keyCode == 13) {
//         $("#loginForm").submit();
//    }
// }

</script>

</body>
</html>