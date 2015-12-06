<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>Ace管理后台首页</title>

<meta name="description" content="管理后台" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${ctx}/static/Ace/css/bootstrap.min.css" />
<%-- <link rel="stylesheet" href="${ctx}/static/AdminLTE/plugins/bootstrapDialog/bootstrap-dialog.min.css" /> --%>
<link rel="stylesheet" href="${ctx}/static/Ace/css/bootstrap-dialog.min.css" />
<link rel="stylesheet"
	href="${ctx}/static/Ace/font-awesome/4.2.0/css/font-awesome.min.css" />

<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet"
	href="${ctx}/static/Ace/fonts/fonts.googleapis.com.css" />

<!-- ace styles -->
<link rel="stylesheet" href="${ctx}/static/Ace/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet"
	href="${ctx}/static/css/adjust.css" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="${ctx}/static/Ace/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${ctx}/static/Ace/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="${ctx}/static/Ace/js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="${ctx}/static/Ace/js/html5shiv.min.js"></script>
		<script src="${ctx}/static/Ace/js/respond.min.js"></script>
		<![endif]-->
</head>

<body class="no-skin">

	<jsp:include page="./main-header.jsp"></jsp:include>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<jsp:include page="./main-sidebar.jsp"></jsp:include>
		<div class="main-content">
			<div class="main-content-inner" id="navTab">
				<jsp:include page="./content.jsp"></jsp:include>
			</div>
		</div>
		<jsp:include page="./main-footer.jsp"></jsp:include>
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script src="${ctx}/static/Ace/js/jquery.2.1.1.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="${ctx}/static/Ace/js/jquery.1.11.1.min.js"></script>
<![endif]-->

	<!--[if !IE]> -->
	<script type="text/javascript">
			window.jQuery || document.write("<script src='${ctx}/static/Ace/js/jquery.min.js'>"+"<"+"/script>");
		</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${ctx}/static/Ace/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${ctx}/static/Ace/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script src="${ctx}/static/Ace/js/bootstrap.min.js"></script>
	<script src="${ctx}/static/js/jquery.form.min.js"
		type="text/javascript"></script>
	<!-- jquery valid 1.13.1 -->
	<script src="${ctx}/static/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/messages_zh.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/jquery.validate.custom.js" type="text/javascript"></script>

	<!-- page specific plugin scripts -->
	<script src="${ctx}/static/AdminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${ctx}/static/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script src="${ctx}/static/Ace/js/bootstrap-dialog.min.js"></script>
	
<%-- 	<script src="${ctx}/static/AdminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${ctx}/static/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script> --%>
	
	<script src="${ctx}/static/Ace/js/dataTables.tableTools.min.js"></script>

	<!-- ace scripts -->
	<script src="${ctx}/static/Ace/js/ace-elements.min.js"></script>
	<script src="${ctx}/static/Ace/js/ace.min.js"></script>
	<script src="${ctx}/static/js/adjust.js"></script>
</body>
</html>