<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <div class="container" style="padding:0; max-width:100%" >
	   <tiles:insertAttribute name="header" />
	   <tiles:insertAttribute name="content" />
	   <tiles:insertAttribute name="footer" />
   </div>

</body>
</html>