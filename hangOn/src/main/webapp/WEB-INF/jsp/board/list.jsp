<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>고객센터</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/list.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/history.css">
	<script src="${pageContext.request.contextPath}/resources/js/board/list.js"></script>
</head>

<body class="fixed-nav sticky-footer" id="page-top">

<!-- 고객센터 게시판 -->

	<div class="card mb-3" id="table-body">
		<div class="card-header">
	          &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check"></i>&nbsp;&nbsp;<strong>고객센터</strong>
	    </div>
	    <div class="col-md-12" style="text-align: right; margin-top: 10px; padding-right: 20px;">
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
	    	
	    	<!-- 페이징 -->
	    	<c:if test="${boardResult.boardCount != 0}">
			<nav>
		  	  <ul class="pagination" style="padding-left: 25%;">
			    <li class="paginate_button page-items previous <c:if test="${boardResult.prevPage eq false}">disabled</c:if> ">
			      <a href="<c:if test="${boardResult.prevPage eq true}">list.do?pageNo=${boardResult.prev - 1}</c:if>" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li> 

				<c:forEach var="i" begin="${boardResult.prev}" end="${boardResult.next}">
				    <c:choose>
				    	<c:when test="${i eq boardResult.pageNo+1}">
						    <li class="paginate_button page-items "><a href="#1" tabindex="0" aria-controls="dataTable" class="page-link">${i}</a></li>
				    	</c:when>
				    	<c:otherwise>
						    <li class="paginate_button page-items "><a href="list.do?pageNo=${i}" tabindex="0" aria-controls="dataTable" class="page-link">${i}</a></li>
				    	</c:otherwise>
				    </c:choose>
				</c:forEach>
				
 			    <li id="dataTable_next" class=" paginate_button page-items next <c:if test="${boardResult.nextPage eq false}">disabled</c:if> ">
			      <a href="<c:if test="${boardResult.nextPage eq true}">list.do?pageNo=${boardResult.next + 1}</c:if>" aria-controls="dataTable" tabindex="0" class="page-link" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li> 
			    	    
			  </ul>
			</nav>
		</c:if>
	    	
		<div id="btn-write" style="text-align: right; width: 100%;">
			<button  type="button" id="btn" class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/board/writeForm.do'">글쓰기</button>
		</div>
	</div>
	</div>

<script>

	$(document).ready(function () {
		
		console.log("${boardResult.lastPage}")	// 모든 페이지의 끝
		console.log("${boardResult.pageNo+1}")	// 현재 페이지
		console.log("${boardResult.prev}")	// 현재 페이지
		console.log("${boardResult.next}")	// 현재 페이지
		console.log("${userEmail}");
	
		if ("${user}" == "") {
			console.log("유저가 죽어있어!!");
		}
		else if ("${user}" != "") {
			console.log("유저가 살아있어!!");
		}
	});
	
	$("#btn-write").hover(function () {
		$(this).css("color", "#8d68cc");
	});
	
	$("ul.nav.navbar-nav > li").removeClass("active");
	$("ul.nav.navbar-nav > li:eq(2)").addClass("active");

</script>

</body>
</html>