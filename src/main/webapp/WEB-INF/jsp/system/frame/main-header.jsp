<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Main Header -->
<header class="main-header">

	<!-- Logo -->
	<a href="index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>好视</b></span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>好视</b>后台</span>
	</a>

	<!-- Header Navbar -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="javascript:;" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<!-- Navbar Right Menu -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account Menu -->
				<li class="dropdown user user-menu">
					<!-- Menu Toggle Button --> <a href="javascript:;" class="dropdown-toggle"
					data-toggle="dropdown"> <!-- The user image in the navbar--> <img
						src="${pageContext.request.contextPath}/static/AdminLTE/dist/img/user3-128x128.jpg" class="user-image"
						alt="User Image" /> <!-- hidden-xs hides the username on small devices so only the image appears. -->
						<span class="hidden-xs">女神</span>
				</a>
					<ul class="dropdown-menu">
						<!-- The user image in the menu -->
						<li class="user-header"><img src="${pageContext.request.contextPath}/static/AdminLTE/dist/img/user3-128x128.jpg"
							class="img-circle" alt="User Image" />
							<p>
								女神 - 开发工程师 <small>上次登录 2015-05-12 14:45:50</small>
							</p></li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="javascript:;" class="btn btn-default btn-flat">个人信息</a>
							</div>
							<div class="pull-right">
								<a href="javascript:;" class="btn btn-default btn-flat">退出</a>
							</div>
						</li>
					</ul>
				</li>
				<!-- Control Sidebar Toggle Button -->
				<li><a href="javascript:;" data-toggle="control-sidebar"><i
						class="fa fa-gears"></i></a></li>
			</ul>
		</div>
	</nav>
</header>