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

		<header class="main-header">
			<!-- Logo -->
			<!-- Logo -->
			<a href="../index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Admin</b>LTE</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li><a href="http://almsaeedstudio.com">Almsaeed Studio</a></li>
						<li><a href="http://almsaeedstudio.com/premium">Premium
								Templates</a></li>
					</ul>
				</div>
			</nav>
		</header>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.1.4 -->
	<script
		src="${pageContext.request.contextPath}/static/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script
		src="${pageContext.request.contextPath}/static/AdminLTE/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>


</body>
</html>