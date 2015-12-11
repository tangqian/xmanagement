<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="breadcrumbs" id="breadcrumbs">
	<script type="text/javascript">
		try {
			ace.settings.check('breadcrumbs', 'fixed')
		} catch (e) {
		}
	</script>

	<ul class="breadcrumb">
		<li><i class="ace-icon fa fa-home home-icon"></i> <a href="./">主页</a>
		</li>
		<li class="active"><a href="user/list" data-target='navTab'>用户管理</a></li>
	</ul>
	<!-- /.breadcrumb -->

	<div class="nav-search" id="nav-search" title="搜索用户名,姓名,电话和邮箱">
					<span class="input-icon"> <input type="text" name="keyword"
				placeholder="搜索..." class="nav-search-input"
				id="keyword" autocomplete="off" /> <i id="search-icon"
				class="ace-icon fa fa-search nav-search-icon click" title="点击搜索"></i>
			</span>
	</div>
	<!-- /.nav-search -->
</div>

<div class="page-content">

	<div class="page-header">
		<button class="btn btn-white btn-info btn-round" data-model="dialog" data-url="user/add">
			<i class="ace-icon fa fa-floppy-o bigger-120 blue"></i> 新增
		</button>
		<button class="btn btn-white btn-danger btn-round" data-url="user/batchDelete"
								data-msg="确定删除这些用户吗？" data-model="ajaxToDo"
								data-checkbox-name="chx_default" data-callback="refreshTable">
			<i class="ace-icon fa fa-trash-o bigger-120 orange"></i> 删除
		</button>
		
		<a class="btn btn-white btn-danger btn-round" href="user/import/list" data-target='navTab'>
			<i class="ace-icon fa fa-trash-o bigger-120 orange"></i> 导入
		</a>
	</div>
	<div class="row">
		<div class="col-xs-12">

			<div class="clearfix">
				<div class="pull-right tableTools-container"></div>
			</div>
			
			<!-- div.table-responsive -->
			<!-- div.dataTables_borderWrap -->
			<div>
				<table id="dynamic-table"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="center" width="6%"><label class="pos-rel"> <input
									type="checkbox" class="ace" id="defaultCheck" /> <span class="lbl"></span>
							</label></th>
							<th width="13%">用户名</th>
							<th width="10%">真实姓名</th>
							<th width="11%">电话</th>
							<th width="15%">邮箱</th>
							<th width="5%">状态</th>
							<th width="20%">最近登录</th>
							<th width="20%"></th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var defaultTable;
$(document).ready(function() {
		//initiate dataTables plugin
	defaultTable = $('#dynamic-table').DataTable({
		/* "aoColumns" : [ {
			"bSortable" : false
		}, null, null, null, null, null, {
			"bSortable" : false
		} ], */

		"ordering" : false,
		"pagingType" : "simple_numbers",
		"autoWidth" : false,
		"processing" : true,
		"serverSide" : true,
		"searching" : false,
		"filter" : false,
		"ajax" : {
			"url" : "user",
			"type" : "post",
			"data" : function(data) {
				data.keyword = $("#keyword").val();
			}
		},
		"language" : {
			"url" : "<%=basePath%>static/AdminLTE/plugins/datatables/cn.txt",
		},
		"columns": [
			{ "data": null },
			{ "data": "loginName" },
			{ "data": "name" },
			{ "data": "phone" },
			{ "data": "email" },
			{ "data": "status" },
			{ "data": "lastLogin" },
			{ "data": null },
		],
		"columnDefs": [{
			"targets": 0,
			"render": function(data, type, row) {
				var html = '<label class="pos-rel">'
				+ '<input class="ace" type="checkbox" name="chx_default" value="' + row.id + '"/>'
				+ '<span class="lbl"></span>'
				+ '</label>'
				return html;
			}},{
			"targets": 7,
			"render": function(data, type, row) {
				var html = '<div class="hidden-sm hidden-xs btn-group">'
				+ '<button class="btn btn-xs btn-success" data-model="dialog" data-url="user/view?id=' + row.id + '">'
					+ '<i class="ace-icon fa fa-search-plus bigger-120"></i>'
				+ '</button>'
				+ '<button class="btn btn-xs btn-info" data-model="dialog" data-url="user/edit?id=' + row.id + '">'
					+ '<i class="ace-icon fa fa-pencil bigger-120"></i>'
				+ '</button>'
				+ '<button class="btn btn-xs btn-danger" data-model="ajaxToDo" data-callback="refreshTable" data-msg="确定删除吗？" data-url="user/delete?id=' + row.id + '">'
					+ '<i class="ace-icon fa fa-trash-o bigger-120"></i>'
				+ '</button>'
				+ '<button class="btn btn-xs btn-warning" data-model="dialog" data-url="user/editRole?id=' + row.id + '">'
					+ '<i class="ace-icon fa fa-flag bigger-120"></i>'
				+ '</button>'
				+ '</div>';
				return html;
			}}],
		"createdRow": function ( row, data, index ) {
			$('td', row).eq(0).addClass("center");
        },
		"drawCallback": function (settings) {
			//drawAceCheck('defaultCheck', 'chx_default');
		},
	});
	
	var tableTools_obj = new $.fn.dataTable.TableTools( defaultTable, {
		"sRowSelector": "td:not(:last-child)",
		"sRowSelect": "multi",
		"fnRowSelected": function(row) {
			//check checkbox when row is selected
			try { $(row).find('input[type=checkbox]').get(0).checked = true }
			catch(e) {}
		},
		"fnRowDeselected": function(row) {
			//uncheck checkbox
			try { $(row).find('input[type=checkbox]').get(0).checked = false }
			catch(e) {}
		},
		"sSelectedClass": "success",
	});
	
	$('#dynamic-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) tableTools_obj.fnSelect(row);
			else tableTools_obj.fnDeselect(row);
		});
	});
	
	//select/deselect a row when the checkbox is checked/unchecked
	$('#dynamic-table').on('click', 'td input[type=checkbox]' , function(){
		var row = $(this).closest('tr').get(0);
		if(!this.checked) tableTools_obj.fnSelect(row);
		else tableTools_obj.fnDeselect($(this).closest('tr').get(0));
	});
	
	$("#nav-search").keydown(function(e) {
		var curKey = e.which;
		if (curKey == 13) {
			refreshTable(1);
			return false;
		}
	});
	
	$('#search-icon').on('click', function(){
		refreshTable(1);
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