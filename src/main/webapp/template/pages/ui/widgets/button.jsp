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
    $( "input[type=submit], a, button" )
      .button()
      .click(function( event ) {
        event.preventDefault();
      });
  });
</script>
</head>
<body>
<button>A button element</button>

<input type="submit" value="A submit button"/> <a href="#">An
anchor</a>
</body>
</html>
