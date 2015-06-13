<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

用户信息
<form action="menu/add" method="post">

	E-mail: <input type="email" name="user_email" /> <br /> E-mail: <input
		type="email" name="user_email" /> <br /> Homepage: <input type="url"
		name="user_url" /> <input type="submit" value="submit" />
</form>