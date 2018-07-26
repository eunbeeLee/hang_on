<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HangOn</title>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" sizes="16x16">
</head>
<body>
   <div class="container" style="padding:0; max-width:100%" >
	   <tiles:insertAttribute name="header" />
	   <tiles:insertAttribute name="content" />
	   <tiles:insertAttribute name="footer" />
   </div>
</body>
</html>