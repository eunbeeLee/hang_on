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
	        	<form action="${pageContext.request.contextPath}/board/write.do" id="form">
				    <div class="form-group">
				        카테고리  <select name="boardCategory" id="category" class="form-control" style="max-width:150px">
								<option value="">선택</option>
								<option value="회원정보">회원정보</option>
								<option value="화상회의">화상회의</option>
								<option value="채팅">채팅</option>
								<option value="기타">기타</option>
							</select>
				    </div>
				    <div class="form-group">
				       	 글쓴이  <input type="text" id="writer" style="max-width:150px" class="form-control" name="boardWriter" readonly value="${sessionScope.userName}" size="30" />
				    </div>   
				    <div class="form-group">
				            제목  <input type="text" id="title" class="form-control" size="50" name="boardTitle"/>
				    </div>   
				    <div class="form-group">
				       	 내용  <textarea rows="5" cols="100" id="content" class="form-control" name="boardContent" ></textarea>
				    </div>   
				    <input type="hidden" name="userNo" id="no"  class="form-control" value="${sessionScope.userNo}" />
				    <button type="submit" id="btn" style="float:right; text-align: right; margin-top: 10px;">글쓰기</button>
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