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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/sweetalert/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/sweetalert/sweetalert2.all.min.js"></script>
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
    <a class="navbar-brand" href="${pageContext.request.contextPath}/lobby/view.do"><img id="hangOnLogo"src="../resources/image/HangOnLogo_3.png"></a>
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
		<li class="nav-item"><a class="nav-link" id="adminTitle"> 
		  관리자페이지</a>
		</li>
		<!-- 사용자 아이콘 -->
		<li class="nav-item"><a class="nav-link" id="userName"> 
		  <i class="fa fa-user-circle-o"></i>${user.userName}님</a>
		</li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/lobby/view.do" >
            <i class="fa fa-fw fa-sign-out"></i>로비로 가기</a>
        </li>
      </ul>
    </div>
  </nav>
<!-- 검색 -->
  <div class="content-wrapper" id = "contentWrapper">
  <div class="container-fluid">
          <div id="searchContainer">
           <form class="navbar-form navbar-left" role="search">
             <div class="form-group">
               <input type="text" id="roomSearchInput"class="form-control col-md-4 col-lg-4" placeholder="채팅방이름">
               <button id="roomSearchBtn" type="button" class="btn btn-default" data-toggle="modal">검색</button>
               <button id="roomAllhBtn" type="button" class="btn btn-default">전체검색</button>
             </div>
            </form>
          </div>
          <!-- !검색 -->
          <div id="countRoomList">
          </div>
          
		  <!-- 아코디언 예제 시작 -->
          <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
          </div> 
		  <div class="col-md-8 col-xs-12 panel panel-default room-header" id="roomListContent">
		  </div>
		  <!-- 아코디언 예제 끝 -->
  </div>
  
    <!-- /.container-fluid-->
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
    <div>
    </div>
    <!-- modals -->
    <div id="modalWrapper">
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
    <!-- !modal -->
  </div>
    <!-- /.content-wrapper-->
</body>
    <script>var userNo = "${sessionScope.user.userNo}"</script>
<!-- roomMgm JavaScript byEunbee -->
    <script src="${pageContext.request.contextPath}/resources/js/admin/roomMgm.js"></script>


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