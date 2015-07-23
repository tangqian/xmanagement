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
			<!-- Custom Tabs -->
			<div class="nav-tabs-custom my-tab">
				<ul class="nav nav-tabs">
					<li class="header">
						<div class="btn-group">
							<button type="button" data-url="user/add" title="点击新增用户"
								data-model="dialog" class="btn btn-primary navbar-btn btn-sm">
								<i class="fa fa-plus"></i> 新增
							</button>
							<button type="button" data-url="user/batchDelete"
								data-msg="确定批量删除用户吗？" data-model="ajaxToDo"
								data-checkbox-name="chx_default" data-callback="refreshTable"
								class="btn btn-danger navbar-btn btn-sm">
								<i class="fa fa-trash-o"></i> 批量删除
							</button>
						</div>
					</li>

					<li class="pull-right"><a href="javascript:;" class="text-muted"><i
							class="fa fa-gear"></i></a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">
						<table id="default_table"
							class="table table-primary table-hover table-striped">
							<thead>
								<tr>
									<th width="10px" style="padding-right: 12px;"><input
										title="全选" type='checkbox' id="defaultCheck" /></th>
									<th width="20px" style="padding-right: 12px;"></th>
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
		"pagingType": "simple_numbers",
		"autoWidth": false,
		//"scrollX": true,
		"processing": true,
		"serverSide": true,
		"searching" :false,
		"filter" : false,
		"ajax": {
			"url" : "user/list",
			"type" : "post",
			"data": function (data) {
				data.keyword = $("#keyword").val();
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
				var html = htmlTpl.dropdown.prefix
				+ '  <li><a href="user/view?id='+row.id+'" data-model="dialog" data-width="650"><i class="fa fa-info-circle"></i>查看</a></li>'
				+ '  <li><a href="user/edit?id='+row.id+'" data-model="dialog"><i class="fa fa-pencil"></i>编辑</a></li>'
				+ '  <li><a href="user/delete?id='+row.id+'" data-msg="确定删除吗？" data-model="ajaxToDo" data-callback="refreshTable"><i class="fa fa-trash-o"></i>删除</a></li>'
				+ '  <li class="divider"></li>'
				+ '  <li><a href="user/editRole?id='+row.id+'" data-model="dialog">分配角色</a></li>'
				+ htmlTpl.dropdown.suffix;
				return html;
			}
		}],
		"drawCallback": function (settings) {
			drawICheck('defaultCheck', 'chx_default');
		},
		"initComplete": function () {
			var others = '<div class="input-group input-group-sm input-adjust">'
				+ '<div class="input-group-addon">'
				+ '<label for="startTime"><i class="fa fa-calendar"></i></label>'
				+ '</div>' 
				+ '<input id="startTime" readonly name="startTime" type="text" class="form-control" placeholder="请输入开始时间" />'
				+ '</div>'
			initSearchForm(others, "搜索用户名和真实姓名");
			$("#startTime").datetimepicker({
				format : 'yyyy-mm-dd hh:ii',
				language : 'zh',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 0,
				forceParse : 0,
				showMeridian : 0,
				pickerPosition : "bottom-left"
			});
		}
	});
});
	
	function refreshTable(toFirst) {
		//defaultTable.ajax.reload();
		if(toFirst){//表格重绘，并跳转到第一页
			defaultTable.draw();
		}else{//表格重绘，保持在当前页
			defaultTable.draw(false);
		}
	}
	

	
</script>