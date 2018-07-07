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
          <a class="nav-link" href="history.do">
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
    <div class="content-wrapper">
    <div class="container-fluid">
      <!-- 검색조건 -->
      <div id="searchPeriod" class="row">
		<form class="form-inline">
		  <div class="form-group">
		    <label class="sr-only" for="exampleInputEmail3">시작일</label>
		    <input type="date" class="form-control" id="exampleInputEmail3" value="2018-07-01">
		  </div> -
		  <div class="form-group">
		    <label class="sr-only" for="exampleInputPassword3">종료일</label>
		    <input type="date" class="form-control" id="exampleInputPassword3" value="2018-07-05">
		  </div>
		  <button type="submit" id="periodSearchBtn"class="btn btn-default">검색</button>
		<div id="recentSearchBtn">
		  <button type="submit" class="btn btn-default btn-sm btn-recent">최근 일주일</button>
		  <button type="submit" class="btn btn-default btn-sm btn-recent">최근 30일</button>
		  <button type="submit" class="btn btn-default btn-sm btn-recent">최근 60일</button>
		  <button type="submit" class="btn btn-default btn-sm btn-recent">최근 90일</button>
		</div>
		</form>
		
      </div>
      <!-- 검색종료 -->
	  
	  
	  <div class="col-md-9" id="tableContainer">
	    <table class="table table-condensed table-striped table-bordered" id="historyTable">
	      <thead>
	        <tr>
	          <th>이름</th>
	          <th>이메일</th>
	          <th>접속일시</th>
	          <th>행동</th>
	          <th>ip주소</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<tr>
	      	  <td>이은비</td>
	      	  <td>eunbee1224@gmail.com</td>
	      	  <td>2018-07-01 15:55</td>
	      	  <td>회의시작</td>
	      	  <td>169.192.10.8</td>
	      	</tr>
	      	<tr>
	      	  <td>이은비</td>
	      	  <td>eunbee1224@gmail.com</td>
	      	  <td>2018-07-01 15:55</td>
	      	  <td>문서공유</td>
	      	  <td>169.192.10.8</td>
	      	</tr>
	      	<tr>
	      	  <td>이은비</td>
	      	  <td>eunbee1224@gmail.com</td>
	      	  <td>2018-07-01 15:55</td>
	      	  <td>회의시작</td>
	      	  <td>169.192.10.8</td>
	      	</tr>
	      	<tr>
	      	  <td>이은비</td>
	      	  <td>eunbee1224@gmail.com</td>
	      	  <td>2018-07-01 15:55</td>
	      	  <td>문서공유</td>
	      	  <td>169.192.10.8</td>
	      	</tr>
	      	<tr>
	      	  <td>이은비</td>
	      	  <td>eunbee1224@gmail.com</td>
	      	  <td>2018-07-01 15:55</td>
	      	  <td>회의시작</td>
	      	  <td>169.192.10.8</td>
	      	</tr>
	      	<tr>
	      	  <td>이은비</td>
	      	  <td>eunbee1224@gmail.com</td>
	      	  <td>2018-07-01 15:55</td>
	      	  <td>문서공유</td>
	      	  <td>169.192.10.8</td>
	      	</tr>
	      	<tr>
	      	  <td>이은비</td>
	      	  <td>eunbee1224@gmail.com</td>
	      	  <td>2018-07-01 15:55</td>
	      	  <td>회의시작</td>
	      	  <td>169.192.10.8</td>
	      	</tr>
	      	<tr>
	      	  <td>이은비</td>
	      	  <td>eunbee1224@gmail.com</td>
	      	  <td>2018-07-01 15:55</td>
	      	  <td>문서공유</td>
	      	  <td>169.192.10.8</td>
	      	</tr>
	      	<tr>
	      	  <td>이은비</td>
	      	  <td>eunbee1224@gmail.com</td>
	      	  <td>2018-07-01 15:55</td>
	      	  <td>회의시작</td>
	      	  <td>169.192.10.8</td>
	      	</tr>
	      	<tr>
	      	  <td>이은비</td>
	      	  <td>eunbee1224@gmail.com</td>
	      	  <td>2018-07-01 15:55</td>
	      	  <td>문서공유</td>
	      	  <td>169.192.10.8</td>
	      	</tr>
	      </tbody>
	    </table>
	  </div>	
	  <div class="row">
   <div class="col-md-3"></div>
    <!-- pagination -->
   <div class="col-md-4">
   <ul class="pagination">
     <li class="paginate_button page-item previous disabled" id="dataTable_previous">
       <a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
     </li>
     <li class="paginate_button page-item active">
       <a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
     </li>
     <li class="paginate_button page-item ">
       <a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>
     </li>
     <li class="paginate_button page-item ">
       <a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a>
     </li>
     <li class="paginate_button page-item ">
       <a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a>
     </li><li class="paginate_button page-item ">
       <a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a>
     </li><li class="paginate_button page-item ">
       <a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a>
     </li>
     <li class="paginate_button page-item next" id="dataTable_next">
       <a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
     </li>
   </ul>
   </div> 
    <!-- !pagination -->
    <div class="col-md-4"></div>
	  </div>
    </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div>
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