<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>고객센터</title>
    <link href="${pageContext.request.contextPath}/resources/css/board/writeForm.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/board/writeForm.js"></script>
</head>

<body class="fixed-nav sticky-footer" id="page-top">

<!-- 고객센터 게시판 -->

	<div class="card mb-3" id="table-body">
		<div class="card-header">
	          &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check"></i>&nbsp;&nbsp;<strong>고객센터</strong>
	    </div>
	    <div class="card-body">
	        <div class="table-responsive">
	        	<form action="${pageContext.request.contextPath}/board/reply.do" id="form" method="post">
				        글쓴이 : <input type="text" id="writer" name="boardWriter" readonly value="admin" size="30" /><br>
				        제목 : <input type="text" id="title" size="50" name="boardTitle" value="${board.boardTitle} 의 답글입니다"/><br>
				        내용 : <textarea rows="5" cols="100" id="content" name="boardContent">
----------------------------기존 내용------------------------------
${board.boardContent}
---------------------------------------------------------------------
</textarea>
				        <input type="hidden" name="userNo" value="${sessionScope.userNo}" /><br>
				        <input type="hidden" name="refNo" value="${board.refNo}" />
				        <input type="hidden" name="levNo" value="1" />
				        <input type="hidden" name="depthNo" value="${board.depthNo}" />
				        <input type="hidden" name="boardCategory" value="답변" />
<!-- 				        <input type="hidden" name="boardNo" value="" /> -->
				    <button type="submit" id="btn">글쓰기</button>
	        	</form>
	    	</div>
		</div>
	</div>

<script>

var email = '${userEmail}';
console.log(email);

var no = '${userNo}';
console.log(no);

var name = '${userName}';
console.log(name);
console.log(${board.refNo});
console.log(${board.depthNo});


$("#btn").click(function (e) {
	e.preventDefault();
	
	if( $("#category").val() == "") {
		document.querySelector("#categoryModalBtn").click();
		return false;
	}
	else if ( $("#title").val() == "") {
		document.querySelector("#titleModalBtn").click();
		return false;
	}
	else if ( $("#content").val() == "") {
		document.querySelector("#contentModalBtn").click();
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