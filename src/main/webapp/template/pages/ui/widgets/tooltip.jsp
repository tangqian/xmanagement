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
    $( document ).tooltip();
  });
</script>
<style type="text/css">
  label {
    display: inline-block;
    width: 5em;
  }
  </style>
</head>
<body>
<p><a href="#" title="That&apos;s what this widget is">Tooltips</a> can be attached to any element. When you hover
the element with your mouse, the title attribute is displayed in a little box next to the element, just like a native tooltip.</p>
<p>But as it's not a native tooltip, it can be styled. Any themes built with
<a href="http://jqueryui.com/themeroller/" title="ThemeRoller: jQuery UI&apos;s theme builder application">ThemeRoller</a>
will also style tooltips accordingly.</p>
<p>Tooltips are also useful for form elements, to show some additional information in the context of each field.</p>
<p><label for="age">Your age:</label><input id="age" title="We ask for your age only for statistical purposes."/></p>
<p>Hover the field to see the tooltip.</p>
</body>
</html>
