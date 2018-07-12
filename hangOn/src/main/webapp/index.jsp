<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href='<c:url value="/document/35/view.do"/>'>
		문서공유 페이지 바로가기
	</a>
	<hr>
	<a href='<c:url value="/lobby/view.do"/>'>
		lobby 바로가기
	</a>
	<hr>
	<a href='<c:url value="/admin/dashBoard.do"/>'>
		admin-dashBoard 바로가기
	</a>
	<hr>
	<a href='<c:url value="/main/login.do"/>'>
		메인 바로가기
	</a>
	<hr>

</body>
</html>