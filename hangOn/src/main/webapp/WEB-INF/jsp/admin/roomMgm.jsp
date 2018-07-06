<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HangOn-adminPage</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin - Start Bootstrap Template</title>
    <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css">
  <link href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/css/sb-admin.css" rel="stylesheet">

  <!-- 아이콘 출력을 위한
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
  <style>
	#hangOnLogo{
	width:45%;
}
  </style>
</head>


<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html"><img id="hangOnLogo"src="../resources/image/HangOnLogo_3.png"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="대쉬보드">
          <a class="nav-link" href="dashBoard.do">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">대쉬보드</span>
          </a>
        </li>
 
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="회의방관리">
          <a class="nav-link" href="roomMgm.do">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">회의방관리</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="회의기록">
          <a class="nav-link" href="userMgm.do">
            <i class="fa fa-clipboard"></i>
            <span class="nav-link-text">회의기록</span>
          </a>
        </li>
      </ul>
      <!-- 토글바 -->
      <ul class="navbar-nav sidenav-toggler">  
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
        
		<!-- 사용자 아이콘 -->
		<li class="nav-item"><a class="nav-link"> 
		  관리자페이지</a>
		</li>
		<!-- 사용자 아이콘 -->
		<li class="nav-item"><a class="nav-link"> 
		  <i class="fa fa-user-circle-o"></i>홍길동님</a>
		</li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>로그아웃</a>
        </li>
      </ul>
    </div>
  </nav>
<!-- 검색 -->
  <div class="content-wrapper">
          <div id="searchContainer">
           <form class="navbar-form navbar-left" role="search">
             <div class="form-group">
               <input type="text" id="roomSearchInput"class="form-control col-md-4 col-lg-4" placeholder="채팅방이름">
               <button type="submit" class="btn btn-default">검색</button>
             </div>
            </form>
          </div>
          <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
         </div> 
          
          
<!-- 아코디언 예제 시작 -->

  <div class=" col-md-10 col-xs-12 panel panel-default">
    <div class=" card mb-3 panel-heading" role="tab" id="headingOne">
      <h4 class="card-header">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    파이널 프로젝트
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
                <div id="existRoomList" class="container col-md-11">
				<form>
			         <div class="form-group">
			           <label for="inputPassword" class="col-md-2 control-label"><strong>회의방설명</strong></label>
			           <div class="col-md-10">
			             <input type="text" class="form-control" placeholder="회의방설명">
			           </div>
			         </div>
			         <div class="form-group">
			           <label for="inputPassword" class="col-md-2 control-label"><strong>비밀번호</strong></label>
			           <div class="col-md-10">
			             <input type="password" class="form-control" id="oldInputPassword" placeholder="기존의 비밀번호를 입력하세요">
			             <input type="password" class="form-control" id="newInputPassword" placeholder="새로운 비밀번호를 입력하세요">
			           </div>
			         </div>
			       <div class="form-group">
			           <label class="col-sm-2 control-label"><strong>생성날짜</strong></label>
			           <div class="col-sm-10">
			             <p class="form-control-static">2018.08.01 15:55</p>
			           </div>
			         </div>
			       <div class="form-group">
			           <label class="col-sm-2 control-label"><strong>총 회의 시간</strong></label>
			           <div class="col-sm-10">
			             <p class="form-control-static">01:34:23</p>
			           </div>
			         </div>
				  <table class="table table-border">
					  <thead>
					    <tr>
					      <th>이름</th>
					      <th>이메일</th>
					      <th>마지막 참여시간</th>
					      <th>권한</th>
					      <th>권한부여</th>
					      <th>삭제</th>
					    </tr>
					  </thead> 
					  
					  <tbody>
					  <tr>
					  	<td>이은비</td>
					  	<td>eundee1224@gmail.com</td>
					  	<td>2018.08.01 15:55</td>
					  	<td>참여자</td>
					  	<td>
						  <label class="switch">
						  <input type="checkbox">
						  <span class="slider round"></span>
						</label>
						</td>
						<td>
						  <button type="button" class="btn btn-sm btn-danger">삭제</button>
						</td>
					  </tr>
					  <tr>
					  	<td>이은비</td>
					  	<td>eundee1224@gmail.com</td>
					  	<td>2018.08.01 15:55</td>
					  	<td>참여자</td>
					  	<td>
						  <label class="switch">
						  <input type="checkbox">
						  <span class="slider round"></span>
						</label>
						</td>
						<td>
						  <button type="button" class="btn btn-sm btn-danger">삭제</button>
						</td>
					  </tr>
					  	
					  </tbody>
				  </table>
				  
				  <button type="submit" class="btn btn-default pull-right">제출</button>
				</form>   	
            </div>
      </div>
    </div>
  </div>
  
  
  <div class=" col-md-10 col-xs-12 panel panel-default">
    <div class=" card mb-3 panel-heading" role="tab" id="headingTwo">
      <h4 class="card-header">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    파이널 프로젝트
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
                <div id="existRoomList" class="container col-md-11">
				<form>
			         <div class="form-group">
			           <label for="inputPassword" class="col-md-2 control-label"><strong>회의방설명</strong></label>
			           <div class="col-md-10">
			             <input type="text" class="form-control" placeholder="회의방설명">
			           </div>
			         </div>
			         <div class="form-	group">
			           <label for="inputPassword" class="col-md-2 control-label">비밀번호</label>
			           <div class="col-md-10">
			             <input type="password" class="form-control" id="oldInputPassword" placeholder="기존의 비밀번호를 입력하세요">
			             <input type="password" class="form-control" id="newInputPassword" placeholder="새로운 비밀번호를 입력하세요">
			           </div>
			         </div>
			       <div class="form-group">
			           <label class="col-sm-2 control-label">생성날짜</label>
			           <div class="col-sm-10">
			             <p class="form-control-static">2018.08.01 15:55</p>
			           </div>
			         </div>
			       <div class="form-group">
			           <label class="col-sm-2 control-label">총 회의 시간</label>
			           <div class="col-sm-10">
			             <p class="form-control-static">01:34:23</p>
			           </div>
			         </div>
				  <table class="table table-border">
					  <thead>
					    <tr>
					      <th>이름</th>
					      <th>이메일</th>
					      <th>마지막 참여시간</th>
					      <th>권한</th>
					      <th>권한부여</th>
					      <th>삭제</th>
					    </tr>
					  </thead> 
					  
					  <tbody>
					  <tr>
					  	<td>이은비</td>
					  	<td>eundee1224@gmail.com</td>
					  	<td>2018.08.01 15:55</td>
					  	<td>참여자</td>
					  	<td>
						  <label class="switch">
						  <input type="checkbox">
						  <span class="slider round"></span>
						</label>
						</td>
						<td>
						  <button type="button" class="btn btn-sm btn-danger">삭제</button>
						</td>
					  </tr>
					  <tr>
					  	<td>이은비</td>
					  	<td>eundee1224@gmail.com</td>
					  	<td>2018.08.01 15:55</td>
					  	<td>참여자</td>
					  	<td>
						  <label class="switch">
						  <input type="checkbox">
						  <span class="slider round"></span>
						</label>
						</td>
						<td>
						  <button type="button" class="btn btn-sm btn-danger">삭제</button>
						</td>
					  </tr>
					  	
					  </tbody>
				  </table>
				  
				  <button type="submit" class="btn btn-default pull-right">제출</button>
				</form>   	
            </div>
      </div>
    </div>
  </div>
  


<!-- 아코디언 예제 끝 -->
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © hangOn 2018</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/js/sb-admin-datatables.min.js"></script>
    <script src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/js/sb-admin-charts.min.js"></script>
</html>