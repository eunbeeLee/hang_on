<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
</head>
<body>
  <section class="notice-manager">
  	<h1 id="noticetitle">공지 게시판</h1>
   <div id="noticeTable">
	   <table class="table table-condensed table-striped table-bordered notice-table">
		  <thead>
		    <tr class="th-tr">
		      <th class="noticeTh" width=50%>공지사항</th>
		      <th class="noticeTh" width=15%>공지일시</th>
		      <th class="noticeTh" width=20%>글쓴이</th>
		      <th class="noticeTh" width=15%>삭제</th>
		    </tr>
		  </thead>
		  <tbody id="noticeBodyTable">
		  </tbody>
		</table>
   </div>
  </section>
  <script type="text/javascript">
  	$("#notiNav").click(function () {
  		$.ajax({
			url : `${pageContext.request.contextPath}/room/noticeList.json`,
			data : {
				roomNo: ${roomNo}
			},
			type: "POST",
			dataType : "json",
			success : function (data) {
				noticeList(data);
			}
		});
  	});
  	
  	function noticeList(data) {
  		var html = "";
  		for(let i = 0; i < data.length ; i++) {
	  		html += "<tr>"+
			      "<td>"+data[i].noticeContent+"</td>"+
			      "<td>"+data[i].noticeDatetoString+"</td>"+
			      "<td>"+data[i].userName+"</td>"+
			      "<td>"+
				      "<div data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
					  	"<i class='material-icons delIcon'>delete_forever</i>"+
					  "</div>"+
				      "<div class='dropdown-menu'>"+
						  "<a class='dropdown-item noticeDel' data[i].notice data-noticeNo='"+data[i].noticeNo+"' href=''>삭제</a>"+
					  "</div>"+
				  "</td>"+
			    "</tr>";
  		}
  		$("#noticeBodyTable").html(html);
  	}
  	$("#noticeBodyTable").on("click", ".noticeDel", function (e) {
  		e.preventDefault();
  		var noticeNo = $(this).attr("data-noticeNo");
  		$.ajax({
			url : `${pageContext.request.contextPath}/room/noticeDelete.json`,
			data : {
				noticeNo: noticeNo,
				roomNo: ${roomNo}
			},
			type: "POST",
			dataType : "json",
			success : function (data) {
				noticeList(data);
			}
		});
  	});
  </script>
</body>
</html>