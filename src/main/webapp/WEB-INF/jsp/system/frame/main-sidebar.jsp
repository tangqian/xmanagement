<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar" id="scrollspy">

		<!-- Sidebar user panel (optional) -->
		<%-- <div class="user-panel">
			<div class="pull-left image">
				<img
					src="${pageContext.request.contextPath}/static/AdminLTE/dist/img/user3-128x128.jpg"
					class="img-circle" alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>女神</p>
				<!-- Status -->
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div> --%>

		<!-- search form (Optional) -->
		<!-- 		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..." /> <span class="input-group-btn">
					<button type='submit' name='search' id='search-btn'
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form> -->
		<!-- /.search form -->

		<!-- Sidebar Menu -->
		<ul class="sidebar-menu">
			<li class="header">功能导航</li>
			<!-- Optionally, you can add icons to the links -->
			<li class="treeview active"><a href="#"><i
					class="fa fa-th-list"></i> <span>系统管理</span><i
					class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a href="user" data-target="navTab"><i
							class="fa fa-caret-right"></i>用户管理</a></li>
					<li><a href="menu" data-target="navTab"><i
							class="fa fa-caret-right"></i>菜单管理</a></li>
				</ul></li>
			<li class="treeview"><a href="#"><i class='fa fa-th-list'></i>
					<span>系统运营</span> <i class="fa fa-angle-left pull-right"></i></a>
				<ul class="treeview-menu">
					<li><a href="#"><i class="fa fa-caret-right"></i>监控1</a></li>
					<li><a href="#"><i class="fa fa-caret-right"></i>监控2</a></li>
				</ul></li>
			<li><a href="menu" data-target="navTab"><i
					class='fa fa-th-list'></i> <span>菜单管理</span></a></li>
		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>