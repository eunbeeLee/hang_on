<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>고객센터</title>
    <link href="${pageContext.request.contextPath}/resources/css/board/detail.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/board/detail.js"></script>
</head>

<body class="fixed-nav sticky-footer" id="page-top">

<!-- 고객센터 게시판 -->

	<div class="card mb-3" id="table-body">
		<div class="card-header">
	          &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check"></i>&nbsp;&nbsp;<strong>고객센터</strong>
	    </div>
	    <div class="card-body">
	          <div class="table-responsive table-condensed">
	          <table class="table table-condensed">
		          <tr>
		          	<td style="width:20%; text-align:center;">카테고리</td>
		          	<td style="width:50%; text-align:center;">제목</td>
		          	<td style="width:30%; text-align:center;">등록일</td>
		          </tr>
		          <tr>
		          	<td style="width:20%; text-align:center;">${board.boardCategory}</td>
		          	<td style="width:50%; text-align:center;">${board.boardTitle}</td>
		          	<td style="width:30%; text-align:center;"><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		          </tr>
		          <tr>
		          	<td colspan="3" style="text-align:right"> 작성자 ${board.boardWriter} 조회수  ${board.viewCnt} </td>
		          </tr>
	          </table>
	          <div style="min-width:200px; min-height:300px; text-align:left; border-top: 1px solid grey; border-bottom: 1px solid grey;">
	          	<c:out value="${board.boardContent}" /><br><br><br>
	          </div>
	    	</div>
		</div>
	</div>
<div id="modAndDel"></div>
<div id="reply"></div>

<script>

$(document).ready(function () {
	if("${board.boardWriter}" == "${sessionScope.userName}") {
		var html = '';
		html += '<a href="${pageContext.request.contextPath}/board/updateForm.do">글 수정하기</a><br>';
		html += '<a href="${pageContext.request.contextPath}/board/delete.do?no=${board.boardNo}">글 삭제하기</a>';
		$("#modAndDel").html(html);
	}
	else if("${sessionScope.userName}" == "admin") {
		var html = '';
		html += '<form action="${pageContext.request.contextPath}/board/replyForm.do">';
		html += '<input type="hidden" name="no" value="${board.boardNo}"></input>';
		html += '<button type="submit">답글달기</button>';
		html += '</form>';
		$("#reply").html(html);
	}
});

name = "${sessionScope.userName}";
console.log(name);

</script>

</body>
</html>