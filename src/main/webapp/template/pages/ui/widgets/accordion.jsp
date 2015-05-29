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
	$("#accordion").accordion();
  });
</script>
</head>
<body>
<div id="accordion">
<h3>Section 1</h3>
<div>
<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam.
Integer ut neque. Vivamus nisi metus, molestie vel, gravida in,
condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi.
Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu
ante scelerisque vulputate.</p>
</div>
<h3>Section 2</h3>
<div>
<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit
amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis
porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non
quam. In suscipit faucibus urna.</p>
</div>
<h3>Section 3</h3>
<div>
<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque
lobortis. Phasellus pellentesque purus in massa. Aenean in pede.
Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed
commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis
leo purus venenatis dui.</p>
</div>
<h3>Section 4</h3>
<div>
<p>Cras dictum. Pellentesque habitant morbi tristique senectus et
netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis
in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean
lacinia mauris vel est.</p>
<p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
consequat lectus. Class aptent taciti sociosqu ad litora torquent per
conubia nostra, per inceptos himenaeos.</p>
</div>
</div>
</body>
</html>
