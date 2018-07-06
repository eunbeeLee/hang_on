<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="documentArea">
	<div id="documentReadyScreen">
		<h1>파일을 올려주세요</h1>
		<h1>지금은 pdf 파일만 가능합니다</h1>
		<h1>이 화면은 테스트용 화면입니다</h1>
		<h1>기능 개발시 사라지고 바로 파일 업로드 화면이 나옵니다</h1>
		<button class="document-attach">파일 올리기</button>
		<input type="file" id="documentFileUpload">
	</div>

    <div class="row">
    
    
        <div id="documentList" class="col-sm-2">
        	
        	<div class="document-list-prev">
        		<img src="${pageContext.request.contextPath}/resources/image/documentSample.png">
        		<span>1</span>
        	</div>
        	
        	<div class="document-list-prev">
        		<img src="${pageContext.request.contextPath}/resources/image/documentSample.png">
        		<span>2</span>
        	</div>
        	
        	<div class="document-list-prev">
        		<img src="${pageContext.request.contextPath}/resources/image/documentSample.png">
        		<span>3</span>
        	</div>
        	
        	<div class="document-list-prev">
        		<img src="${pageContext.request.contextPath}/resources/image/documentSample.png">
        		<span>4</span>
        	</div>
        	
        	<div class="document-list-prev">
        		<img src="${pageContext.request.contextPath}/resources/image/documentSample.png">
        		<span>5</span>
        	</div>
        	
        	<div class="document-list-prev">
        		<img src="${pageContext.request.contextPath}/resources/image/documentSample.png">
        		<span>6</span>
        	</div>
        	
        	<div class="document-list-prev">
        		<img src="${pageContext.request.contextPath}/resources/image/documentSample.png">
        		<span>7</span>
        	</div>
        	
        </div>
        
        
        
        
        <div id="documentShare" class="col-sm-6">
        	
        	<div id="documentUtilBtns">
        	
        		<button class="document-util-btn btn btn-default">
	        		<i class="fa fa-mouse-pointer doc-util-btn-detail" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default">
	        		<i class="fa fa-dot-circle-o" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default">
	        		<i class="fa fa-pencil" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default">
	        		<i class="fa fa-eraser doc-util-btn-detail" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default">
	        		<i class="material-icons doc-util-btn-detail-plus">
						color_lens
					</i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default">
	        		<i class="fa fa-font doc-util-btn-detail" aria-hidden="true"></i>
        		</button>
        		
        		
        		<button class="document-util-btn btn btn-default">
        			<i class="fa fa-cube doc-util-btn-detail" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default">
        			<i class="fa fa-pie-chart doc-util-btn-detail" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default">
        			<i class="document-screen-clear">clear</i>
        		</button>
		
        	</div>

        	<div id="documentPageView">  		
        		<button id="doc-util-btn-left" class="document-util-btn btn btn-default">
        			<i class="fa fa-chevron-left " aria-hidden="true"></i>
        		</button>
        		<span>
        		  <input class="form-control" id="documentViewPageOrder"
        		  type="text" aria-describedby="idHelp" value="1"> <i>/&nbsp;&nbsp;<i>100</i></i>
        		</span>
        		
        		<button id="doc-util-btn-right" class="document-util-btn btn btn-default">
        			<i class="fa fa-chevron-right " aria-hidden="true"></i>
        		</button>        	
        	</div>
        	
        	
        	<div id="documentShareView">
        		
        		<%-- 샘플테스트 --%>
        		<img src="${pageContext.request.contextPath}/resources/image/documentSample2.png">
        		
        	</div>
        	
        </div>
        
        
        
        
        
        <div id="documentView" class="col-sm-4">
        	<div id="documentViewArea"></div>
        </div>
        
        
    </div>

        
    </div>
</body>
</html>