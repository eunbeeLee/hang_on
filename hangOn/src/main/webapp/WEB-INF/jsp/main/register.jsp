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
                <input class="form-control" id="userEmail" type="email" name="userEmail" placeholder="이메일 주소를 입력하세요" autofocus required>
              </div>
              <div class="col-md-6">
                <label for="userName">이름</label>
                <input class="form-control" id="userName" type="text" name="userName" placeholder="이름을 입력하세요" required>
              </div>
            </div>
          </div>
          <div class="col-md-6" id="emailCheck">&nbsp;</div>
          <br>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="userPw">비밀번호</label>&nbsp;&nbsp;&nbsp;
<!--                 <button class="btn btn-primary" style="background-color:#b39bdd; border:0;"><span>유효성 체크</span></button> -->
                <input class="form-control" id="userPw" type="password" name="userPw" placeholder="8자 이상으로 입력하세요" required>
              </div>
              <div class="col-md-6">
                <label for="userPwCheck">비밀번호 확인</label>
                <input class="form-control" id="userPwCheck" type="password" name="userPwCheck" placeholder="비밀번호를 다시 입력하세요" required>
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
	
	emailDuplicateChecker = 1;
	
	$("#userEmail").keyup(function () {
		let userEmail = $("#userEmail").val();
		if (userEmail != "") {
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
					$("#emailCheck").text(msg);
				}
			})
		}
	});
	
	
	$("#registerBtn").click(function () {
		
		if ( $("#userPw").val() != $("#userPwCheck").val()) {
			alert("비밀번호 재입력을 확인해주세요")
			return false;
		}
		else if (emailDuplicateChecker == 2) {
			alert("이메일 중복입니다")
			return false;
		}
		else if (document.getElementById("userPw").value.length <= 7) {
				alert("비번은 8자 이상이어야 합니다")
//	 			document.querySelector("#shortPwModalBtn").click();
				return false;
		}
		else {
			$("#form").submit();
			return true;
		}
	});
	
</script>
</body>
</html>












