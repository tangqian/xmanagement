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
	$("#sortable").sortable();
	$("#sortable").disableSelection();
  });
</script>
<style type="text/css">
#sortable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 60%;
}

#sortable li {
	margin: 0 3px 3px 3px;
	padding: 0.4em;
	padding-left: 1.5em;
	font-size: 1.4em;
	height: 18px;
}

#sortable li span {
	position: absolute;
	margin-left: -1.3em;
}
</style>
</head>
<body>
<ul id="sortable">
	<li class="ui-state-default"><span
		class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
	<li class="ui-state-default"><span
		class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
	<li class="ui-state-default"><span
		class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
	<li class="ui-state-default"><span
		class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
	<li class="ui-state-default"><span
		class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
	<li class="ui-state-default"><span
		class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
	<li class="ui-state-default"><span
		class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
</ul>
</body>
</html>
