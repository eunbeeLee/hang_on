<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    <div id="myPage" >
        <div id="myPageProfileArea" class="container card">
        
        
            <button id="myPageClose" type="button" class="btn btn-default" style="padding: 0px !important;">
				<i class="material-icons">close</i>
			</button>
			
			
            <div>
                <div id="myPageImgArea">
                    <img src="/hangOn/resources/image/defalutImg.jpg"/>
                </div>
                <div id="myPageProfileImgBtns">
                    <span>
                        <input type="radio" id="myPageProfileImgBtn1" name="myPageProfileImgBtn" checked/>
                        <label for="myPageProfileImgBtn1">기본이미지</label><br><br>
                    </span>
                    <span>
                        <input type="radio" id="myPageProfileImgBtn2" name="myPageProfileImgBtn" />
                        <label for="myPageProfileImgBtn2">사진 불러오기(jpg,gif,png)</label><br><br>
                    </span>
                    <input class="form-control" id="myPageImgURL" type="text" aria-describedby="idHelp" readonly value="">
                    <button id="myPageAttachImgBtn" type="button" class="btn btn-default" style="padding: 0px !important;">
					  <i class="material-icons">attach_file</i>
					</button>
                    <input id="myPageImgInput" type="file"/>
                </div>
            </div>
            
            
	        <div class="form-group">
	          <label for="myPageName">이름</label>
	          <button id="myPageNameUpdateBtn" type="button" class="btn btn-default" style="padding: 0px !important;">
			  	<i class="material-icons">create</i>
			  </button>
	          <input class="form-control" id="myPageName" type="text" aria-describedby="idHelp" readonly value="정진솔">
	        </div>
	        
	        
	        <div class="form-group">
	          <label for="myPageEmail">이메일</label>
	          <input class="form-control" id="myPageEmail" type="email" aria-describedby="emailHelp" readonly value="abcd@gmail.com">
	        </div>
        
        
            <div>
                <button id="myPagePassBtn">비밀번호 변경</button>
                <button id="myPageOutBtn">회원탈퇴</button>
            </div>
          
            
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/mypage/view.js"></script>
</body>
</html>