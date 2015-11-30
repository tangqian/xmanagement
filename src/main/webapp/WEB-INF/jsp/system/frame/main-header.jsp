<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="navbar" class="navbar navbar-default">
	<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

	<div class="navbar-container" id="navbar-container">
		<button type="button" class="navbar-toggle menu-toggler pull-left"
			id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">切换滑块</span> <span class="icon-bar"></span>

			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<div class="navbar-header pull-left">
			<a href="./" class="navbar-brand"> <small> <i
					class="fa fa-leaf"></i> Ace管理
			</small>
			</a>
		</div>

		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<li class="light-blue"><a data-toggle="dropdown" href="#"
					class="dropdown-toggle"> <img class="nav-user-photo"
						src="${ctx}/static/Ace/avatars/user.jpg" alt="Jason's Photo" /> <span
						class="user-info"> <small>欢迎您,</small> 唐乾
					</span> <i class="ace-icon fa fa-caret-down"></i>
				</a>

					<ul
						class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li><a href="#"> <i class="ace-icon fa fa-cog"></i>
								设置
						</a></li>

						<li><a href="profile.html"> <i
								class="ace-icon fa fa-user"></i> 个人信息
						</a></li>

						<li class="divider"></li>

						<li><a href="#"> <i class="ace-icon fa fa-power-off"></i>
								退出
						</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- /.navbar-container -->
</div>
