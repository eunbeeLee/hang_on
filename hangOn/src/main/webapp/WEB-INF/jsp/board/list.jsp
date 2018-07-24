<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>고객센터</title>
    <meta name="google-signin-client_id" content="880617749149-u3k5io2lv7d6i0u5mccdl283j6tgratg.apps.googleusercontent.com">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/board/list.css" rel="stylesheet">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
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
	    <div class="col-md-2" style="text-align: right">
			전체 <c:out value="${boardResult.boardCount}"/>개
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
		              
		              <c:forEach var="board" items="${boardList}">
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
	    	
 	
	    	<c:if test="${boardResult.boardCount != 0}">
			<nav>
		  <ul class="pagination">
			    <li class="<c:if test="${boardResult.prevPage eq false}">disabled</c:if>">
			      <a href="<c:if test="${boardResult.prevPage eq true}">list.do?pageNo=${boardResult.prev - 1}</c:if>" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li> 

				<c:forEach var="i" begin="${boardResult.prev}" end="${boardResult.next}">
				    <c:choose>
				    	<c:when test="${i eq boardResult.pageNo+1}">
						    <li class="active"><a href="#1">${i}</a></li>
				    	</c:when>
				    	<c:otherwise>
						    <li><a href="list.do?pageNo=${i}">${i}</a></li>
				    	</c:otherwise>
				    </c:choose>
				</c:forEach>
				
 			    <li class="<c:if test="${boardResult.nextPage eq false}">disabled</c:if>">
			      <a href="<c:if test="${boardResult.nextPage eq true}">list.do?pageNo=${boardResult.next + 1}</c:if>" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li> 
			    	    
			  </ul>
			</nav>
		</c:if>
			    	
	    	
		<div class="btn ">
			<button id="write" type="button" onclick="window.location.href='${pageContext.request.contextPath}/board/writeForm.do'">글쓰기</button>
		</div>
	</div>
	</div>


<script>
	$(()=>{
		console.log("${boardResult.lastPage}")	// 모든 페이지의 끝
		console.log("${boardResult.pageNo+1}")	// 현재 페이지
		console.log("${boardResult.prev}")	// 현재 페이지
		console.log("${boardResult.next}")	// 현재 페이지
	})

	$("ul.nav.navbar-nav > li").removeClass("active");
	$("ul.nav.navbar-nav > li:eq(2)").addClass("active");

</script>

</body>
</html>