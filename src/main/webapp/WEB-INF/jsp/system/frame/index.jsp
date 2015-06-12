<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理界面</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link
	href="${pageContext.request.contextPath}/static/AdminLTE/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="${pageContext.request.contextPath}/static/AdminLTE/dist/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<%-- <!-- Ionicons -->
<link
	href="${pageContext.request.contextPath}/static/AdminLTE/dist/css/ionicons.min.css"
	rel="stylesheet" type="text/css" /> --%>
<!-- Theme style -->
<link
	href="${pageContext.request.contextPath}/static/AdminLTE/dist/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/static/AdminLTE/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="skin-blue fixed" data-spy="scroll" data-target="#scrollspy">

	<div class="wrapper">
		<jsp:include page="./main-header.jsp"></jsp:include>
		<jsp:include page="./main-sidebar.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					系统管理 <small>菜单</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
					<li class="active">系统管理</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Your Page Content Here -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="./main-footer.jsp"></jsp:include>
		<jsp:include page="./control-sidebar.jsp"></jsp:include>
	</div>
	<!-- ./wrapper -->


	<!-- jQuery 2.1.4 -->
	<script
		src="${pageContext.request.contextPath}/static/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script
		src="${pageContext.request.contextPath}/static/AdminLTE/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/static/AdminLTE/dist/js/app.min.js"
		type="text/javascript"></script>


</body>
</html>