<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
</head>
<body>
  <section class="cloud-manager">
   	<form class="form-inline">
         <div class="input-group">
           <input class="form-control" type="text" placeholder="모두 검색" >
           <span class="input-group-append">
             <button class="btn" type="button">
               <i class="fa fa-search"></i>
             </button>
	      	 <button class="btn btn-upload" type="button">
               <i class="material-icons">cloud_upload</i>
               	업로드
	         </button>
           </span>
         </div>
      </form>
    <div class="cloud-title">
          <span>파일</span>
    </div>
    <form id="cloudForm" style="display:none;" method="post" enctype="multipart/form-data"> 
	    <input type="text" name="id" value="test" /><br /> 
	    <input type="text" name="path" value="123" /><br /> 
	    <input id="cloudUpload" type="file" name="attachFile" multiple="multiple" /><br /> 
	    <input type="submit" value="업로드" /> 
	</form>
    
    
    
   <table class="table table-hover table-cloud">
	  <thead>
	    <tr>
	      <th><i class="material-icons">insert_drive_file</i></th>
	      <th>이름</th>
	      <th></th>
	      <th>수정한 날짜</th>
	      <th>촬영한 날짜</th>
	      <th>크기</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th><i class="material-icons">folder</i></th>
	      <td><a href="#">폴더</a></td>
	      <td class="more-btn">
		      <div data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  	<i class="material-icons">more_vert</i>
			  </div>
		      <div class="dropdown-menu">
				  <a class="dropdown-item" href="#">공유</a>
				  <div class="dropdown-divider"></div>
				  <a class="dropdown-item" href="#">다운로드</a>
				  <a class="dropdown-item" href="#">삭제</a>
				  <a class="dropdown-item" href="#">이동</a>
				  <a class="dropdown-item" href="#">복사</a>
				  <div class="dropdown-divider"></div>
				  <a class="dropdown-item" href="#">세부 정보</a>
			  </div>
		  </td>
	      <td colspan="2">2015년 12월 24일</td>
	      <td>2.3GB</td>
	    </tr>
	    <tr>
	      <th><i class="material-icons">photo</i></th>
	      <td><a>20180717_112131</a></td>
	      <td class="more-btn"><i class="material-icons">more_vert</i></td>
	      <td>7월 13일</td>
	      <td>7월 13일</td>
	      <td>3.22MB</td>
	    </tr>
	    <tr>
	      <th><i class="material-icons">movie_creation</i></th>
	      <td><a>20180717_112131</a></td>
	      <td class="more-btn"><i class="material-icons">more_vert</i></td>
	      <td colspan="2">토 오후 8:36</td>
	      <td>102MB</td>
	    </tr>
	  </tbody>
	</table>
    
  </section>
</body>

</html>
