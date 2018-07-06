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
          <a class="nav-link" href="tables.html">
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
    <div class="col-lg-4 col-md-6 col-xs-12">
            <!-- Example Bar Chart Card-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-bar-chart"></i>사용량</div>
            <div class="card-body">
              <div class="row">
                <div class="col-sm-8 my-auto">
                  <canvas id="myBarChart" width="100" height="50"></canvas>
                </div>
                <div class="col-sm-4 text-center my-auto">
                  <div class="h4 mb-0 text-primary">$34,693</div>
                  <div class="small text-muted">YTD Revenue</div>
                  <hr>
                  <div class="h4 mb-0 text-warning">$18,474</div>
                  <div class="small text-muted">YTD Expenses</div>
                  <hr>
                  <div class="h4 mb-0 text-success">$16,219</div>
                  <div class="small text-muted">YTD Margin</div>
                </div>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
          </div>
  <div class="col-lg-4 col-md-6 col-xs-12">
  <!-- 월별 회의갯수-->
   <div class="card mb-3" id="pieChartContent">
     <div class="card-header">
       <i class="fa fa-pie-chart"></i>회의 갯수</div>
     <div class="card-body">
       <canvas id="myPieChart" width="100%" height="100"></canvas>
     </div>
     <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
   </div>
   </div>
   
    <div class="col-lg-10 col-md-10 col-xs-12">
         <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-area-chart"></i> Area Chart Example</div>
        <div class="card-body">
          <canvas id="myAreaChart" width="100%" height="30"></canvas>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>
    </div>
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