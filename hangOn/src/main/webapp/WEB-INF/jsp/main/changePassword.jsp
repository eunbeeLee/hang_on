<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>등록</title>
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/register/register.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body>

<!-- 네비바랑 footer 사이를 감싸고 있는 div -->
<div class="content-wrapper">

<!-- 배경화면 -->
<div class="background-picture">
	<img src="${pageContext.request.contextPath}/resources/image/rapunzel.jpg">
</div>

<!-- 등록 창 -->
<div class="container" id="register-box">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">계정을 만드세요</div>
      <div class="card-body">
        <form>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">이름</label>
                <input class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp" placeholder="이름을 입력하세요">
              </div>
              <div class="col-md-6">
                <label for="exampleInputLastName">성</label>
                <input class="form-control" id="exampleInputLastName" type="text" aria-describedby="nameHelp" placeholder="성을 입력하세요">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">이메일 주소</label>
            <input class="form-control" id="exampleInputEmail1" type="email" aria-describedby="emailHelp" placeholder="이메일 주소를 입력하세요">
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">비밀번호</label>
                <input class="form-control" id="exampleInputPassword1" type="password" placeholder="비밀번호를 입력하세요">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">비밀번호 확인</label>
                <input class="form-control" id="exampleConfirmPassword" type="password" placeholder="비밀번호를 다시 입력하세요">
              </div>
            </div>
          </div>
          <a class="btn btn-primary btn-block" onClick="register()" href="#">등록</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" onClick="main()" href="#">메인 페이지로 가기</a>
          <a class="d-block small" onClick="pass()" href="#">비밀번호를 잊어버리셨나요?</a>
        </div>
      </div>
    </div>
</div>

<script>

function register() {
	alert("등록");
};

function main() {
	alert("메인");
};

function pass() {
	alert("비번");
};

</script>


</div>
</body>
</html>