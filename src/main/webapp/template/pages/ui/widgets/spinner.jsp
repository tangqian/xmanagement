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
    var spinner = $( "#spinner" ).spinner();
 
    $( "#disable" ).click(function() {
      if ( spinner.spinner( "option", "disabled" ) ) {
        spinner.spinner( "enable" );
      } else {
        spinner.spinner( "disable" );
      }
    });
    $( "#destroy" ).click(function() {
      if ( spinner.spinner( "instance" ) ) {
        spinner.spinner( "destroy" );
      } else {
        spinner.spinner();
      }
    });
    $( "#getvalue" ).click(function() {
      alert( spinner.spinner( "value" ) );
    });
    $( "#setvalue" ).click(function() {
      spinner.spinner( "value", 5 );
    });
 
    $( "button" ).button();
  });
</script>
</head>
<body>
<p>
  <label for="spinner">Select a value:</label>
  <input id="spinner" name="value"/>
</p>
 
<p>
  <button id="disable">Toggle disable/enable</button>
  <button id="destroy">Toggle widget</button>
</p>
 
<p>
  <button id="getvalue">Get value</button>
  <button id="setvalue">Set value to 5</button>
</p>
</body>
</html>
