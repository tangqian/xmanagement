<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar responsive menu-min" id="sidebar"
	data-sidebar="true" data-sidebar-scroll="true"
	data-sidebar-hover="true">
	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'fixed')
		} catch (e) {
		}
	</script>

	<div id="sidebar-shortcuts" class="sidebar-shortcuts">
		<div id="sidebar-shortcuts-large" class="sidebar-shortcuts-large">
			<button class="btn btn-success">
				<i class="ace-icon fa fa-signal"></i>
			</button>

			<button class="btn btn-info">
				<i class="ace-icon fa fa-pencil"></i>
			</button>

			<button class="btn btn-warning">
				<i class="ace-icon fa fa-users"></i>
			</button>

			<button class="btn btn-danger">
				<i class="ace-icon fa fa-cogs"></i>
			</button>
		</div>

		<div id="sidebar-shortcuts-mini" class="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span> <span class="btn btn-info"></span>

			<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
		</div>
	</div>
	<!-- /.sidebar-shortcuts -->

	<ul class="nav nav-list" style="top: 0px;">

		<li class="active open"><a class="dropdown-toggle" href="#">
				<i class="menu-icon fa fa-list"></i> <span class="menu-text">
					系统管理 </span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>

			<ul class="submenu">
				<li class="active"><a href="user/list" data-target='navTab'> <i
						class="menu-icon fa fa-caret-right"></i> 用户管理
				</a> <b class="arrow"></b></li>
				
				<li class=""><a href="menu/tree" data-target='navTab'> <i
						class="menu-icon fa fa-caret-right"></i> 菜单管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href="404" data-target='navTab'> <i
						class="menu-icon fa fa-caret-right"></i> 404page
				</a> <b class="arrow"></b></li>
			</ul></li>

		<li class=""><a href="widgets.html"> <i
				class="menu-icon fa fa-list-alt"></i> <span class="menu-text">
					插件 </span>
		</a> <b class="arrow"></b></li>

		<li class=""><a class="dropdown-toggle" href="#"> <i
				class="menu-icon fa fa-file-o"></i> <span class="menu-text">
					Other Pages <span class="badge badge-primary">5</span>
			</span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>

			<ul class="submenu">
				<li class=""><a href="faq.html"> <i
						class="menu-icon fa fa-caret-right"></i> FAQ
				</a> <b class="arrow"></b></li>

				<li class=""><a href="error-404.html"> <i
						class="menu-icon fa fa-caret-right"></i> Error 404
				</a> <b class="arrow"></b></li>
			</ul></li>
	</ul>
	<!-- /.nav-list -->

	<div id="sidebar-collapse" class="sidebar-toggle sidebar-collapse">
		<i data-icon2="ace-icon fa fa-angle-double-right"
			data-icon1="ace-icon fa fa-angle-double-left"
			class="ace-icon fa fa-angle-double-right"></i>
	</div>

	<script type="text/javascript">
		try {
			ace.settings.check('sidebar', 'collapsed')
		} catch (e) {
		}
	</script>
</div>