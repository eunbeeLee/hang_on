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
	  	<img  id="loader" alt="" src="https://trello-attachments.s3.amazonaws.com/5b349f3848c32368c660fc5d/5b35eef6c9545d84a3cc64d3/3375ebf832089f9f597d891f7704116d/30.gif">
   	<form class="form-inline">
         <div class="input-group">
           <span class="input-group-append">
	      	 <button class="btn btn-newFolder" type="button">
               <i class="material-icons">create_new_folder</i>
               	새폴더
	         </button>
	      	 <button class="btn btn-upload" type="button">
               <i class="material-icons">cloud_upload</i>
               	업로드
	         </button>
           </span>
       		<div id="cloudUsage">
	       		<span id="cloudUsageNum">여기가숫자</span>
	       		<div id="cloudUsageProgress">
		       		<div id="cloudUsageBar"></div>
				</div>
       		</div>
         </div>
      </form>
    <div class="cloud-title">
          <span><a href="#">파일</a></span>
    </div>
    <form id="cloudForm" style="display:none;" method="post" enctype="multipart/form-data"> 
	    <input type="text" name="id" value="test" /><br /> 
	    <input type="text" name="path" value="" /><br /> 
	    <input id="cloudUpload" type="file" name="attachFile" multiple="multiple" /><br /> 
	    <input type="submit" value="업로드" /> 
	</form>
	
	<div id="modalNewFolder" >
		<h5 class="modal-title" id="exampleModalLabel">
			<strong>새 폴더</strong>
		</h5>
		<input type="text" name="folderName" />
		<button class="btn btn-primary">
			만들기
		</button>
	</div>



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
		  </tbody>
		</table>
    
  </section>
</body>

</html>
