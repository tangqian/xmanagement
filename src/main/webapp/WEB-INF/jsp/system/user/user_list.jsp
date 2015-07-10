<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>&nbsp;</h1>
	<ol class="breadcrumb">
		<li><a href="./"><i class="fa fa-dashboard"></i> 主页</a></li>
		<li class="active">系统管理</li>
		<li><a href="user" data-target="navTab">用户管理</a></li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<!-- Custom Tabs -->
			<div class="nav-tabs-custom my-tab">
				<ul class="nav nav-tabs">
					<li class="header">
						<div class="btn-group">
							<button type="button" data-url="user/add" title="点击新增用户"
								data-model="dialog" class="btn btn-primary navbar-btn">
								<i class="fa fa-plus"></i> 新增
							</button>
							<button type="button" data-url="user/batchDelete"
								data-msg="确定批量删除用户吗？" data-model="ajaxToDo"
								data-checkbox-name="chx_default" data-callback="refreshTable"
								class="btn btn-danger navbar-btn">
								<i class="fa fa-trash-o"></i> 批量删除
							</button>
						</div>
					</li>

					<li class="pull-right"><a href="#" class="text-muted"><i
							class="fa fa-gear"></i></a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">
						<table id="default_table"
							class="table table-primary table-hover table-striped">
							<thead>
								<tr>
									<th width="10px" style="padding-right: 10px;"><button title="全选"
											class="btn btn-default btn-xs checkbox-toggle">
											<span></span><i class="fa fa-square-o"></i>
										</button></th>
									<th width="70px"></th>
									<th>用户名</th>
									<th>真实姓名</th>
									<th>电话</th>
									<th>状态</th>
									<th>最近登录</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.tab-pane -->
				</div>
				<!-- /.tab-content -->
			</div>
			<!-- nav-tabs-custom -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>
<script type="text/javascript">
	var defaultTable;
	$(document).ready(function() {
		defaultTable = $('#default_table').DataTable( {
			"ordering": false,
			"pagingType": "full_numbers",
			"autoWidth": false,
			//"scrollX": true,
			"processing": true,
            "serverSide": true,
            "ajax": {
            	"url" : "user/list",
            	"type" : "post",
            	"data": function (data) {
                    data.loginName = $("#loginName").val();
                }
            },
            "language": {
                "url": "<%=basePath%>static/AdminLTE/plugins/datatables/cn.txt",
			},
			"columns": [
			            { "data": null },
			            { "data": null },
				        { "data": "loginName" },
				        { "data": "name" },
				        { "data": "phone" },
				        { "data": "status" },
				        { "data": "lastLogin" },
			 ],
			 "columnDefs": [{
				 "targets": 0,
		          "render": function(data, type, row) {
		        	  var html = "<input type='checkbox' name='chx_default' value='" + row.id + "'/>"
		              return html;
		          }
		      },{
				 "targets": 1,
		          "render": function(data, type, row) {
		        	  var html = "";
		        	  //html += '<a href="user/view?id='+row.id+'" data-model="dialog"><i title="查看" class="fa fa-lg fa-fw fa-info-circle"></i></a>';
		              //html += '<a href="user/edit?id='+row.id+'" data-model="dialog"><i title="修改" class="fa fa-lg fa-fw fa-pencil"></i></a>';
		              //html += '<a href="user/delete?id='+row.id+'" data-msg="确定删除吗？" data-model="ajaxToDo" data-callback="refreshTable"><i title="删除" class="fa fa-lg fa-fw fa-trash"></i></a>';
		              //html += '<a href="user/editRole?id='+row.id+'" data-model="dialog"><i title="分配角色" class="fa fa-lg fa-fw fa-wrench"></i></a>';
		              html += '<div class="btn-group">'
		            	  + '<button type="button" data-url="user/view?id='+ row.id +'" title="点击查看详情" data-model="dialog" class="btn btn-sm btn-primary"><i class="fa fa-sm fa-fw fa-info-circle"></i></button>'
		            	  + '<button type="button" class="btn btn-sm btn-info dropdown-toggle" data-toggle="dropdown" title="更多操作" aria-haspopup="true" aria-expanded="false">'
		            	  + '  <span class="caret"></span>'
		            	  + '  <span class="sr-only">Toggle Dropdown</span>'
		            	  + '</button>'
		            	  + '<ul role="menu" class="dropdown-menu">'
		            	  + '  <li><a href="user/edit?id='+row.id+'" data-model="dialog"><i class="fa fa-pencil"></i>编辑</a></li>'
		            	  + '  <li><a href="user/delete?id='+row.id+'" data-msg="确定删除吗？" data-model="ajaxToDo" data-callback="refreshTable"><i class="fa fa-trash-o"></i>删除</a></li>'
		            	  + '  <li class="divider"></li>'
		            	  + '  <li><a href="user/editRole?id='+row.id+'" data-model="dialog">分配角色</a></li>'
		            	  + '</ul>'
		            	  + '</div>'
		              return html;
		          }
			  }],
		      "drawCallback": function (settings) {
					//Enable iCheck plugin for checkboxes
					//iCheck for checkbox and radio inputs
					$('.table input[type="checkbox"]').iCheck({
						checkboxClass : 'icheckbox_flat-blue',
						radioClass : 'iradio_flat-blue'
					});
		      }
	  	});
		

		// Enable check and uncheck all functionality
		$(".checkbox-toggle").click(function() {
			var clicks = $(this).data('clicks');
			if (clicks) {
				// Uncheck all checkboxes
				$(".table input[type='checkbox']").iCheck("uncheck");
				$(".fa", this).removeClass("fa-check-square-o").addClass(
						'fa-square-o');
			} else {
				// Check all checkboxes
				$(".table input[type='checkbox']").iCheck("check");
				$(".fa", this).removeClass("fa-square-o").addClass(
						'fa-check-square-o');
			}
			$(this).data("clicks", !clicks);
		});
	});
	
	function refreshTable() {
		defaultTable.draw(true);
	}
	

	
</script>