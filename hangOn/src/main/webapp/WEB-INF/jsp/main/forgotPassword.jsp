<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>비번찾기</title>
    <link href="${pageContext.request.contextPath}/resources/css/main/forgotPassword.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/main/forgotPassword.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">

<!-- 네비바랑 footer 사이를 감싸고 있는 div -->
<div class="content-wrapper">

<!-- 배경화면 -->
<div class="background-picture">
	<img src="${pageContext.request.contextPath}/resources/image/sea.jpg">
</div>

<!-- 비밀번호 재설정 창 -->
<div class="container" id="forgot-password">
  <div class="card card-login mx-auto mt-5">
    <div class="card-header" style="text-align: center;"><strong>비밀번호 재설정하기</strong></div>
    <div class="card-body">
      <div class="text-center mt-4 mb-5">
        <br><p> 이메일을 입력해주시면 새 비밀번호를 보내드립니다</p><br>
      </div>
      <form action="${pageContext.request.contextPath}/mail/forgotPassword.do" method="POST" id="form">
        <div class="form-group">
          <input class="form-control" id="email" type="email" name="userEmail" placeholder="이메일 주소를 입력하세요" autofocus autocomplete="off">
        </div>
        <button type="submit" class="btn btn-primary btn-block" id="btn" style="background-color:#b39bdd; border: 0;">새 비밀번호를 보내드립니다</button>
      </form>
      <br>
      <div class="text-center">
      </div>
    </div>
  </div>
</div>
</div>

<!-- Modal -->
<div id="loginModalWrapper"></div>

<script>

	$("#btn").click(function () {
		if($("#email").val() == "") {
			document.querySelector("#emptyEmailModalBtn").click();
			return false;
		}
	});
	
</script>

</body>
</html>






