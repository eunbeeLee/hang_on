<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <section class="notice-manager">
  	<h1 id="noticetitle">공지사항</h1>
  	<div id="noticeSearch">
   		<form class="form-inline">
         <div class="input-group">
           <input class="form-control" type="text" placeholder="단어 검색" >
           <span class="input-group-append">
             <button class="btn" type="button">
               <i class="fa fa-search"></i>
             </button>
           </span>
         </div>
         </form>
  	</div>
    
   <div id="noticeTable">
	   <table class="table table-hover table-cloud">
		  <thead>
		    <tr>
		      <th>번호</th>
		      <th>공지사항</th>
		      <th>공지 일시</th>
		      <th>글쓴이</th>
		      <th></th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>1</td>
		      <td>hangon 공지사항입니다 공지사항공지공지공지</td>
		      <td>18.07.17 17:50 공지</td>
		      <td colspan="2">hangon관리자</td>
		      <td class="more-btn">
			      <div data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				  	<i class="material-icons">more_vert</i>
				  </div>
			      <div class="dropdown-menu">
					  <a class="dropdown-item" href="#">삭제</a>
				  </div>
			  </td>
		    </tr>
		  </tbody>
		</table>
   </div>
    
  </section>
</body>
</html>