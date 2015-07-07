<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!-- Content Header (Page header) -->
<section class="content-header">
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
			<div class="box">
				<div class="box-header">
					<a class="btn btn-primary" title="增加用户" role="button"
						data-toggle="modal" href="user/add" data-target="#defaultModal">增加</a>
					<button data-url="user/add" title="点击新增用户" data-toggle="modal"
						data-target="#defaultModal" class="btn btn-primary">
						<i class="fa fa-fw fa-plus"></i>新增
					</button>
					<button type="button" data-url="user/batchDelete"
						data-msg="确定批量删除用户吗？" data-model="ajaxToDo"
						data-checkbox-name="chx_default" data-callback="refreshTable"
						class="btn btn-danger">
						<i class="fa fa-fw fa-remove"></i>批量删除
					</button>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="default_table"
						class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th width="10px"><button
										class="btn btn-default btn-xs checkbox-toggle">
										<span></span><i class="fa fa-square-o"></i>
									</button></th>
								<th>用户名</th>
								<th>邮箱</th>
								<th>电话</th>
								<th>描述</th>
								<th>最近登录</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
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
			"createdRow": function (row, data, index ) {
				$('td:eq(0)', row).html("<input type='checkbox' name='chx_default' value='" + data.id + "'/>");
	        },
			"columns": [
			            { "data": "id" },
				        { "data": "loginName" },
				        { "data": "email" },
				        { "data": "phone" },
				        { "data": "description" },
				        { "data": "lastLogin" },
				        { "data": null },
			 ],
			 "columnDefs": [{
				 "targets": 6,
		          "render": function(data, type, row) {
		        	  var html = "";
		        	  html += '<a href="user/view?id='+row.id+'" data-target="#defaultModal" data-toggle="modal"><i title="查看" class="fa fa-lg fa-fw fa-info-circle"></i></a>';
		           	  //<shiro:hasPermission name="user/edit">
		              html += '<a href="user/edit?id='+row.id+'" data-target="#defaultModal" data-toggle="modal"><i title="修改" class="fa fa-lg fa-fw fa-pencil"></i></a>';
		              //</shiro:hasPermission>
		              //<shiro:hasPermission name="user/delete">
		              html += '<a href="user/delete?id='+row.id+'" data-msg="确定删除吗？" data-model="ajaxToDo" data-callback="refreshTable"><i title="删除" class="fa fa-lg fa-fw fa-trash"></i></a>';
		              //</shiro:hasPermission>
		              //<shiro:hasPermission name="user/editRole">
		              html += '<a href="javascript: void(0)" data-url="user/editRole?id='+row.id+'" data-model="dialog"><i title="分配角色" class="fa fa-lg fa-fw fa-wrench"></i></a>';
		              //</shiro:hasPermission>
		              return html;
		          }
		      }],
		      /* "initComplete": function () {
					//Enable iCheck plugin for checkboxes
					//iCheck for checkbox and radio inputs
					$('.box-body input[type="checkbox"]').iCheck({
						checkboxClass : 'icheckbox_flat-blue',
						radioClass : 'iradio_flat-blue'
					});
		      } */
	  	});
		

		// Enable check and uncheck all functionality
		$(".checkbox-toggle").click(function() {
			var clicks = $(this).data('clicks');
			if (clicks) {
				// Uncheck all checkboxes
				$(".box-body input[type='checkbox']").iCheck("uncheck");
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