<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		用户<small>列表</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="./"><i class="fa fa-dashboard"></i> 主页</a></li>
		<li class="active">系统管理</li>
		<li class="active">用户管理</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">

	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Hover Data Table</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="default_table" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th width="10px"><input type='checkbox' data-aim='reselect'
									data-name='chx_user' /></th>
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
			"scrollY": "350px",
               "scrollCollapse": "true",
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
				$('td:eq(0)', row).html("<input type='checkbox' name='chx_user' value='" + data.userId + "'/>");
	        },
			"columns": [
			            { "data": "userId" },
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
		           	  //<shiro:hasPermission name="user/edit">
		              html += '<a href="javascript: void(0)" data-url="user/edit?userId='+row.userId+'" data-model="dialog" data-targetid="my_modal" data-backdrop="static"><i title="修改" class="glyphicon glyphicon-pencil"></i></a>';
		              //</shiro:hasPermission>
		              //<shiro:hasPermission name="user/delete">
		              html += '<a href="javascript: void(0)" data-url="user/delete?userId='+row.userId+'" data-msg="确定删除吗？" data-model="ajaxToDo" data-targetid="my_delete_modal" data-form-btn="userListFormBtn"><i title="删除" class="glyphicon glyphicon-trash"></i></a>';
		              //</shiro:hasPermission>
		              //<shiro:hasPermission name="user/editRole">
		              html += '<a href="javascript: void(0)" data-url="user/editRole?userId='+row.userId+'" data-model="dialog" data-targetid="my_modal" data-backdrop="static"><i title="授权" class="glyphicon glyphicon-wrench"></i></a>';
		              //</shiro:hasPermission>
		              return html;
		          }
		      }]
	  	});
	});
	
	function refreshTable() {
		defaultTable.draw(true);
	}
</script>