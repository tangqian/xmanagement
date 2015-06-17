<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理500错误</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="${ctx}/static/AdminLTE/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="${ctx}/static/AdminLTE/dist/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/static/AdminLTE/dist/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="layout-boxed">

	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="margin-left: 0px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>500 错误页</h1>
				<ol class="breadcrumb">
					<li><a href="./"><i class="fa fa-dashboard"></i> 主页</a></li>
					<li class="active">500 错误</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<div class="error-page">
					<h2 class="headline text-red">500</h2>
					<div class="error-content" style="padding-top: 30px;">
						<h3>
							<i class="fa fa-warning text-red"></i> 对不起! 页面出问题了.
						</h3>
						<p>
							我们会尽快解决这个问题. 请先浏览其它页面, 你可以<a href='./'>返回主页</a>
						</p>
					</div>
				</div>
				<!-- /.error-page -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

	</div>
</body>
</html>

