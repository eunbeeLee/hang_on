<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HangOn-adminPage</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin - Start Bootstrap Template</title>
<link
	href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link
	href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css">
<link
	href="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/css/sb-admin.css"
	rel="stylesheet">

<style>
#hangOnLogo {
	width: 45%;
}
</style>
</head>


<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/lobby/view.do"><img
			id="hangOnLogo" src="../resources/image/HangOnLogo_3.png"></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="대쉬보드"><a class="nav-link" href="dashBoard.do"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">대쉬보드</span>
				</a></li>

				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="회의방관리"><a class="nav-link" href="roomMgm.do"> <i
						class="fa fa-fw fa-wrench"></i> <span class="nav-link-text">회의방관리</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="회의기록"><a class="nav-link" href="history.do"> <i
						class="fa fa-clipboard"></i> <span class="nav-link-text">회의기록</span>
				</a></li>
			</ul>
			<!-- 토글바 -->
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown">
					<!-- 사용자 아이콘 -->
				<li class="nav-item"><a class="nav-link" id="adminTitle"> 관리페이지</a></li>
				<!-- 사용자 아이콘 -->
				<li class="nav-item"><a class="nav-link"  id="userName"> <i
						class="fa fa-user-circle-o"></i>${user.userName}님
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/lobby/view.do"> <i
						class="fa fa-fw fa-sign-out"></i>로비로 가기
				</a></li>
			</ul>
		</div>
	</nav>
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- 검색조건 -->
			<div id="searchPeriod" class="row">
				<form class="form-inline">
					<div class="form-group">
						<label class="sr-only" for="exampleInputEmail3">시작일</label> <input
							type="date" class="form-control" id="startHistory">
					</div>
					-
					<div class="form-group">
						<label class="sr-only" for="exampleInputPassword3">종료일</label> <input
							type="date" class="form-control" id="endHistory">
					</div>
					<button type="button" id="periodSearchBtn" class="btn btn-default">검색</button>
					<div id="recentSearchBtn">
						<button id="sevenBtn" type="button"
							class="btn btn-default btn-sm btn-recent">최근 일주일</button>
						<button id="thirtyBtn" type="button"
							class="btn btn-default btn-sm btn-recent">최근 30일</button>
						<button id="sixtyBtn" type="button"
							class="btn btn-default btn-sm btn-recent">최근 60일</button>
						<button id="ninetyBtn" type="button"
							class="btn btn-default btn-sm btn-recent">최근 90일</button>
						<button id="allPeriodBtn" type="button"
							class="btn btn-default btn-sm btn-recent">전체기간</button>
					</div>
				</form>

			</div>
			<!-- 검색종료 -->


			<div class="col-md-9" id="tableContainer">
				<table class="table table-condensed table-striped table-bordered"
					id="historyTable">

				</table>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<!-- pagination -->
				<div class="col-md-4">
					<ul class="pagination" id="paginationContent">
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>
</body>
<script>
	var userNo = "${sessionScope.user.userNo}"
</script>
<!-- history JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/history.js"></script>


<!-- Bootstrap core JavaScript-->
<script
	src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script
	src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script
	src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/chart.js/Chart.min.js"></script>
<script
	src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/datatables/jquery.dataTables.js"></script>
<script
	src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages-->
<script
	src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->
<script
	src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/js/sb-admin-datatables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/startbootstrap-sb-admin-gh-pages/js/sb-admin-charts.min.js"></script>
</html>