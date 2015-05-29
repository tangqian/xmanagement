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

<style type="text/css">
fieldset {
	border: 0;
}

label {
	display: block;
	margin: 30px 0 0 0;
}

select {
	width: 200px;
}

.overflow {
	height: 100px;
}
</style>
<script type="text/javascript">
$(function() {
    $( "#speed" ).selectmenu();
 
    $( "#files" ).selectmenu();
 
    $( "#number" )
      .selectmenu()
      .selectmenu( "menuWidget" )
        .addClass( "overflow" );
  });
</script>
</head>
<body>
<div class="demo">

<form action="#">

<fieldset>
<label for="speed">Select a speed</label> 
	<select name="speed" id="speed">
		<option>Slower</option>
		<option>Slow</option>
		<option selected="selected">Medium</option>
		<option>Fast</option>
		<option>Faster</option>
	</select> 
	<label for="files">Select a file</label> 
	<select name="files" id="files">
		<optgroup label="Scripts">
			<option value="jquery">jQuery.js</option>
			<option value="jqueryui">ui.jQuery.js</option>
		</optgroup>
		<optgroup label="Other files">
			<option value="somefile">Some unknown file</option>
			<option value="someotherfile">Some other file with a very
			long option text</option>
		</optgroup>
	</select> 
	<label for="number">Select a number</label> 
	<select name="number" id="number">
		<option>1</option>
		<option selected="selected">2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		<option>7</option>
		<option>8</option>
		<option>9</option>
		<option>10</option>
		<option>11</option>
		<option>12</option>
		<option>13</option>
		<option>14</option>
		<option>15</option>
		<option>16</option>
		<option>17</option>
		<option>18</option>
		<option>19</option>
	</select>
</fieldset>

</form>

</div>
</body>
</html>