<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>등록</title>
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/main/register.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/main/register.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<div class="content-wrapper">

<!-- 배경화면 -->
<div class="background-picture">
	<img src="${pageContext.request.contextPath}/resources/image/sea.jpg">
</div>

<!-- 등록 창 -->
<div class="container" id="register-box" >
    <div class="card card-register mx-auto mt-5" style="margin: auto; vertical-align:middle;">
      <div class="card-header" id="register-text"><strong>계정을 만드세요</strong></div>
      <div class="card-body">
      <br>
        <form action="${pageContext.request.contextPath}/main/register.do" method="POST" id="form">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="userEmail">이메일 주소</label>
                <input class="form-control" id="userEmail" type="email" name="userEmail" placeholder="이메일 주소를 입력하세요" autofocus>
              </div>
              <div class="col-md-6">
                <label for="userName">이름</label>
                <input class="form-control" id="userName" type="text" name="userName" placeholder="20자 이하의 이름을 입력하세요">
              </div>
            </div>
          </div>
          <div id="emailCheck"></div>
          <br>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="userPw">비밀번호</label>&nbsp;&nbsp;&nbsp;
<!--                 <button class="btn btn-primary" style="background-color:#b39bdd; border:0;"><span>유효성 체크</span></button> -->
                <input class="form-control" id="userPw" type="password" name="userPw" placeholder="8자 이상으로 입력하세요">
              </div>
              <div class="col-md-6">
                <label for="userPwCheck">비밀번호 확인</label>
                <input class="form-control" id="userPwCheck" type="password" name="userPwCheck" placeholder="비밀번호를 다시 입력하세요">
              </div>
            </div>
          </div> <br>
          <button type="submit" id="registerBtn" class="btn btn-primary btn-block" style="background-color:#b39bdd; border: 0;">등록</button>
        </form>
        <div class="text-center">
          <a class="d-block" id="forgotPw" style="color:#b39bdd;" href="${pageContext.request.contextPath}/main/forgotPassword.do">비밀번호를 잊어버리셨나요?</a>
        </div>
      </div>
    </div>
</div>
</div>

<!-- Modal -->
<div id="loginModalWrapper"></div>

<script>
	
	// 이메일 중복 체커
	emailDuplicateChecker = 1;
	
	$("#userEmail").keyup(function () {
		let userEmail = $("#userEmail").val();
		if (1) {
			$.ajax({
				url : `${pageContext.request.contextPath}/main/emailCheck.json`,
				data : {userEmail : userEmail},
				type: "POST",
				dataType : "json",
				success : function (no) {
					var msg = "사용 가능 합니다";
					emailDuplicateChecker = 1;
					if (no == 1){
						msg = "사용 불가 합니다";
						emailDuplicateChecker = 2;
					}
					else if (no == 2) {
						msg = "이메일을 입력해주세요";
						emailDuplicateChecker = 2;
					}
					$("#emailCheck").text(msg);
				}
			})
		}
	});
	
	$("#registerBtn").click(function () {
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		regx = /[^가-힣]/;
		for (i = 0; i < $("#userName").value.length; i++) {
	     	ch = $("#userName").value.charAt(i)
	        if ((ch >= '0' && ch <= '9')) {
		 		document.querySelector("#nameWithoutNumberModalBtn").click();
	        	return false;
	        }
	    }
		
		
		// 비번에 공백없게
        if ($("#userPw").value.indexOf(" ") >= 0) { 
 			document.querySelector("#pwWithoutSpaceModalBtn").click();
            return false;
        }
		// 이메일 형식
        else if (regex.test($("#userEmail")) === false) {
 			document.querySelector("#wrongEmailModalBtn").click();
            return false;
        }
        else if ( $("#userEmail").val() == "") {
 			document.querySelector("#emailModalBtn").click();
			return false;
		}
		else if ( $("#userName").val() == "") {
 			document.querySelector("#nameModalBtn").click();
			return false;
		}
		else if ( $("#userPw").val() == "") {
 			document.querySelector("#pwModalBtn").click();
			return false;
		}
		else if ( $("#userPwCheck").val() == "") {
 			document.querySelector("#pwCheckModalBtn").click();
			return false;
		}
		else if ( $("#userPw").val() != $("#userPwCheck").val()) {
 			document.querySelector("#pwEqualModalBtn").click();
			return false;
		}
		else if ($("#userPw").val().length<7) {
			document.querySelector("#shortPwModalBtn").click();
			return false;
		}
		else if ($("#userName").val().length>20) {
			document.querySelector("#longNameModalBtn").click();
			return false;
		}
		else if (emailDuplicateChecker == 2) {
 			document.querySelector("#emailDuplicateModalBtn").click();
			return false;
		}
		else if (regx.test($("#userEmail"))) {
 			document.querySelector("#emailWithoutKoreanModalBtn").click();
			return false;
		}
		else {
			$("#form").submit();
			return;
		}
	});

	
</script>
</body>
</html>