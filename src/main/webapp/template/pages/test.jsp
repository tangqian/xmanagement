<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>jQuery UI Demos导航主页</title>
<base href="<%=basePath%>"/>  
<link href="jqueryui/1.11.4/jquery-ui.min.css" rel="stylesheet"
	type="text/css" />
<script src="jqueryui/jquery.js" type="text/javascript"></script>
<script src="jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
    $( "#draggable" ).draggable();
  });
</script>
<style type="text/css">
#draggable { width: 150px; height: 150px; padding: 0.5em; }
</style>
</head>
<body>
<div id="draggable" class="ui-widget-content">
  <p>Drag me around</p>
</div>

<div style="height: 32px; line-height: 32px; text-align: center;">
Copyright © 2011-2012 www.ligerui.com</div>
<div style="display: none"></div>
</body>
</html>
