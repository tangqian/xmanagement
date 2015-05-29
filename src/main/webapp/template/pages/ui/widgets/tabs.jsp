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
<title>jQuery UI Demos导航主页</title>
<link href="<%=basePath%>jqueryui/1.11.4/jquery-ui.min.css" rel="stylesheet"
	type="text/css" />
<script src="//code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
<script src="<%=basePath%>jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
    $("#tabs").tabs();
  });
</script>
</head>
<body>
<div id="tabs">
<ul>
	<li><a href="#tabs-1">Nunc tincidunt</a></li>
	<li><a href="#tabs-2">Proin dolor</a></li>
	<li><a href="#tabs-3">Aenean lacinia</a></li>
</ul>
<div id="tabs-1">
<p>jquery ui在显示tabs页时，会与base标签冲突。原理分析如下：tabs初始化构造的时候，构造函数先对选项卡的href属性进行分析，以是否#开头为依据，会有两种不同的处理方式。

如果不是#开头的href，这个href会被作为一个url去访问服务器，然后返回的数据当作选项卡的内容。

以#开始的则把去掉#之后的部分，拿去跟某个div的id去匹配，然后把把这个div关联到选项卡。

但是tabs控件的解析比较粗糙，所以在有base标签存在的情况下，#开头的href就会被当作
url去访问远端服务器了，跟div实际没关联上。 </p>
</div>
<div id="tabs-2">
<p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus
gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie
turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie
lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem.
Suspendisse sed ligula in ligula suscipit aliquam.</p>
</div>
<div id="tabs-3">
<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti.
Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu
congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti
sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent
eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium
nec, feugiat nec, luctus a, lacus.</p>
</div>
</div>
</body>
</html>
