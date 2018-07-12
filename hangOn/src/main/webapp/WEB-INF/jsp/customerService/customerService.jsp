<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>고객센터</title>
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/customerService/customerService.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body class="fixed-nav sticky-footer" id="page-top">

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

<!-- 왼쪽 창 -->
	<div id="table-on-the-left">
		<table class="table card">
			<tbody>
				<tr>
					<th>공지사항</th>
				</tr>
				<tr>
					<th>자주 묻는 질문</th>
				</tr>
				<tr>
					<th>찾아오시는 길</th>
				</tr>
			</tbody>
		</table>
		<div>
			고객센터 : 02) 000 - 0000
		</div>
	</div>

<!-- 고객센터 게시판 -->

	<div class="card mb-3" id="table-body">
		<div class="card-header">
	          &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check"></i>&nbsp;&nbsp;<strong>고객센터</strong>
	    </div>
	    <div class="card-body">
	          <div class="table-responsive">
	              <table class="table table-bordered" id="dataTable">
		              <thead>
		                <tr>
		                  <th>번호</th>
		                  <th>구분</th>
		                  <th>제목</th>
		                  <th>작성자</th>
		                  <th>등록일</th>
		                </tr>
		              </thead>
		              <tbody>
		                <tr>
		                  <td>3</td>
		                  <td>로그인</td>
		                  <td>회원가입 했는데 로그인이 안되요.</td>
		                  <td>멍멍이</td>
		                  <td>2018/06/27</td>
		                </tr>
		                <tr>
		                  <td>2</td>
		                  <td>회원가입</td>
		                  <td>전 가입한적 없는데 왜 제 이메일이 중복이죠??</td>
		                  <td>사기꾼</td>
		                  <td>2018/06/24</td>
		                </tr>
		                <tr>
		                  <td>1</td>
		                  <td>기타</td>
		                  <td>홈페이지 예뻐요</td>
		                  <td>칭찬러</td>
		                  <td>2018/06/22</td>
		                </tr>
		              </tbody>
	            </table>
	    	</div>
		</div>
	</div>

<div class="row">
	<div class="col-sm-12 col-md-7">
		<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
			<ul class="pagination">
				<li class="paginate_button page-item previous disabled" id="dataTable_previous">
					<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
				</li>
				<li class="paginate_button page-item active">
					<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
				</li>
				<li class="paginate_button page-item ">
				<a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>
				</li>
				<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a>
				</li>
				<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a>
				</li>
				<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a>
				</li>
				<li class="paginate_button page-item ">
					<a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a>
				</li>
				<li class="paginate_button page-item next" id="dataTable_next">
					<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
				</li>
			</ul>
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

</body>
</html>