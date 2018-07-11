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
		<div>
			<img src="${pageContext.request.contextPath}/resources/image/loading.gif">
		</div>
		<form id="uploadFileForm" action="/hangOn/document/parser.json" enctype="multipart/form-data">
			<input type="file" name="file" id="documentFileUpload" accept=".pdf">
			<input type="hidden" name="roomNo" value="2">
		</form>
	</div>

    <div class="row">
    
    
        <div id="documentList" class="col-sm-2">
        </div>
        
     
        
        
        <div id="documentShare" class="col-sm-6">
        	
        	<div id="documentChange">
	        	<button class="document-util-btn btn btn-default" title="문서변경">
		        		<i class="material-icons">file_copy</i>
	        	</button>
        	</div>
        	
        	<div id="documentUtilBtns">
        	
        		<button class="document-util-btn btn btn-default" title="마우스">
	        		<i class="fa fa-mouse-pointer doc-util-btn-detail" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default" title="포인터">
	        		<i class="fa fa-dot-circle-o" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default" title="펜">
	        		<i class="fa fa-pencil" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default" title="지우개">
	        		<i class="fa fa-eraser doc-util-btn-detail" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default" title="색변경">
	        		<i class="material-icons doc-util-btn-detail-plus">
						color_lens
					</i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default" title="텍스트">
	        		<i class="fa fa-font doc-util-btn-detail" aria-hidden="true"></i>
        		</button>
        		
        		
        		<button class="document-util-btn btn btn-default" title="도형">
        			<i class="fa fa-cube doc-util-btn-detail" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default" title="차트">
        			<i class="fa fa-pie-chart doc-util-btn-detail" aria-hidden="true"></i>
        		</button>
        		
        		<button class="document-util-btn btn btn-default" title="전체 지우기">
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
        		<img src="">	
        	</div>
        	
        </div>
        
        
        
        
        
        <div id="documentView" class="col-sm-4">
        	<div id="documentViewArea"></div>
        </div>
        
        
    </div>

        
    </div>
</body>
</html>