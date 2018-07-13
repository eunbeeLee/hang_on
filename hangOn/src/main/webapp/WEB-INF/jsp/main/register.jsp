<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>등록</title>
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/main/register.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">

<div class="content-wrapper">

<!-- 배경화면 -->
<div class="background-picture">
	<img src="${pageContext.request.contextPath}/resources/image/rapunzel.jpg">
</div>

<!-- 등록 창 -->
<div class="container" id="register-box">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header" id="register-text"><strong>계정을 만드세요</strong></div>
      <div class="card-body">
      <br>
        <form action="${pageContext.request.contextPath}/main/register.do" onsubmit="emailChecker()">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputEmail1">이메일 주소</label>
                <input class="form-control" id="exampleInputEmail" type="email" aria-describedby="emailHelp" placeholder="이메일 주소를 입력하세요">
              </div>
              <div class="col-md-6">
                <label for="exampleInputName">이름</label>
                <input class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp" placeholder="이름을 입력하세요">
              </div>
            </div>
          </div>
          <div class="col-md-6" id="emailCheck">&nbsp;</div>
          <br>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">비밀번호</label>
                <input class="form-control" id="exampleInputPassword" type="password" placeholder="비밀번호를 입력하세요">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">비밀번호 확인</label>
                <input class="form-control" id="exampleConfirmPassword" type="password" placeholder="비밀번호를 다시 입력하세요">
              </div>
            </div>
          </div> <br>
          <button id="registerBtn" class="btn btn-primary btn-block" type="submit">등록</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="${pageContext.request.contextPath}/main/login.do">메인 페이지로 가기</a>
          <a class="d-block small" href="${pageContext.request.contextPath}/main/forgotPassword.do">비밀번호를 잊어버리셨나요?</a>
        </div>
      </div>
    </div>
</div>
</div>

<script>
	
	var userEmail = $("#exampleInputEmail").val();
	
	$("#exampleInputEmail").keyup(function () {
		$.ajax({
			url : `${pageContext.request.contextPath}/main/emailCheck.json`,
			data : {userEmail : userEmail},
			type: "POST",
			dataType : "json",
			success : function (no) {
				var msg = "사용가능한 아이디 입니다";
				if (no == 1){
					msg = "중복된 아이디 입니다";
				}
				$("#emailCheck").text(msg);
			}
		})
	});
	
	$("#registerBtn").click(function emailChecker() {
		if ( $("#exampleInputEmail").val() == "") {
			alert("이메일을 입력하세요")
			return false;
		}
		else if ( $("#exampleInputName").val() == "") {
			alert("이름을 입력하세요")
			return false;
		}
		else if ( $("#exampleInputPassword").val() == "") {
			alert("비밀번호를 입력하세요")
			return false;
		}
		else if ( $("#exampleConfirmPassword").val() == "") {
			alert("비밀번호 확인 부분에 비밀번호를 다시 입력하세요")
			return false;
		}
		else if ( $("#exampleConfirmPassword").val() != $("#exampleInputPassword").val()) {
			alert("비밀번호 재입력을 확인해주세요")
			return false;
		}
		else {
			alert("가입을 축하합니다")
			return true;
		}
	});
	
</script>
</body>
</html>












