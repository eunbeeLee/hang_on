<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>고객센터</title>
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/board/list.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/board/list.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
</head>

<body class="fixed-nav sticky-footer" id="page-top">

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
		                  <th>조회수</th>
		                </tr>
		              </thead>
		              
		              <c:forEach var="board" items="${list}">
		              <tbody>
		                <tr>
		                  <td>${board.boardNo}</td>
		                  <td>${board.boardCategory}</td>
		                  <td><a href="${pageContext.request.contextPath}/board/detail.do?no=${board.boardNo}">${board.boardTitle}</a></td>
		                  <td>${board.boardWriter}</td>
		                  <td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		                  <td>${board.viewCnt}</td>
		                </tr>
		              </tbody>
		              </c:forEach>
	            </table>
	    	</div>
		</div>
	</div>
<div><a href="${pageContext.request.contextPath}/board/writeForm.do">글쓰기</a></div>

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

</body>
</html>