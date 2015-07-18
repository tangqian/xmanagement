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
									<th width="10px" style="padding-right: 12px;">
										<input title="全选" type='checkbox' id="defaultCheck"/>
									</th>
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
            "lengthMenu": [[10, 1, 6, -1], [10, 1, 6, "All"]],
            "ajax": {
            	"url" : "user/list",
            	"type" : "post",
            	"data": function (data) {
                    data.keyword = $("#keyword").val();
                }
            },
            /* "infoCallback": function( settings, start, end, max, total, pre ) {
                return start +" to "+ end;
             }, */
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
		        	  var html = '<div class="btn-group">'
		        		  + '<a title="更多操作" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-lg fa-cog"></i></a>'
		            	  + '<ul role="menu" class="dropdown-menu">'
		            	  + '  <li><a href="user/view?id='+row.id+'" data-model="dialog" data-width="650"><i class="fa fa-info-circle"></i>查看</a></li>'
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
					$('#defaultCheck').iCheck({
						checkboxClass: 'icheckbox_minimal-blue my-check',
		    			increaseArea: '20%' // optional
					});
					
					$('.table input[name="chx_default"]').iCheck({
						checkboxClass : 'icheckbox_flat-blue',
						radioClass : 'iradio_flat-blue'
					});

					$('#defaultCheck').on('ifChanged', function(event){
						if($(this).is(':checked')) {
							$(".table input[name='chx_default']").iCheck("check");
						}else{
							$(".table input[name='chx_default']").iCheck("uncheck");
						}
						
					});
		      },
		      "initComplete": function () {
		    	  $("#defTool").append('<div class="input-group input-group-sm">'
		    			   + '<input type="text" placeholder="搜索用户名和真实姓名" name="keyword" id="keyword" class="form-control">'
		    			   + '<span class="input-group-btn">'
		    			   + '<button type="button" class="btn btn-primary btn-flat" id="mybtn" onclick="javacript:refreshTable(1);">搜索</button>'
		    			   + '</span>'
		    			   + '</div>');
		    	  $("#defTool").keydown(function(e){ 
		              var curKey = e.which; 
		              if(curKey == 13){ 
		                  $("#mybtn").click(); 
		                  return false; 
		              }
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