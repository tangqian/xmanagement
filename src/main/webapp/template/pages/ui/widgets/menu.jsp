<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<title>jQuery UI Demos导航主页</title>
<link href="jqueryui/1.11.4/jquery-ui.min.css" rel="stylesheet"
	type="text/css" />
<script src="jqueryui/jquery.js" type="text/javascript"></script>
<script src="jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$("#menu").menu();
  });
</script>
<style type="text/css">
.ui-menu {
	width: 150px;
}
</style>
</head>
<body>
<ul id="menu">
	<li class="ui-state-disabled">Aberdeen</li>
	<li>Ada</li>
	<li>Adamsville</li>
	<li>Addyston</li>
	<li>Delphi
	<ul>
		<li class="ui-state-disabled">Ada</li>
		<li>Saarland</li>
		<li>Salzburg an der schönen Donau</li>
	</ul>
	</li>
	<li>Saarland</li>
	<li>Salzburg
	<ul>
		<li>Delphi
		<ul>
			<li>Ada</li>
			<li>Saarland</li>
			<li>Salzburg</li>
		</ul>
		</li>
		<li>Delphi
		<ul>
			<li>Ada</li>
			<li>Saarland</li>
			<li>Salzburg</li>
		</ul>
		</li>
		<li>Perch</li>
	</ul>
	</li>
	<li class="ui-state-disabled">Amesville</li>
</ul>
</body>
</html>