<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
	    <title>menu</title>
	</head>
	<body>
		menu中国
		<form action="menu/add" method="post">
		
			E-mail: <input type="email" name="user_email" />
			<br/>
			E-mail: <input type="email" name="user_email" />
			<br/>
			Homepage: <input type="url" name="user_url" />
			<input type="submit" value="submit" />
		</form>
	</body>
</html>