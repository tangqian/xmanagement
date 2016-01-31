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
		<li><a href="user/list" data-target='navTab'>用户管理</a></li>
		<li class="active"><a href="user/import/list" data-target='navTab'>导入管理</a></li>
	</ul>
	<!-- /.breadcrumb -->

	<div class="nav-search" id="nav-search" title="搜索名称">
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
		<button class="btn btn-white btn-info btn-round" data-width="560" data-model="dialog" data-url="user/import/upload">
			<i class="ace-icon glyphicon glyphicon-upload bigger-120 blue"></i> 导入用户
		</button>
		<a class="pull-right btn btn-white btn-info btn-round" href="user/import/template">
			<i class="ace-icon glyphicon glyphicon-download bigger-120 blue"></i> 下载模板
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
							<th width="20%">导入名称</th>
							<th width="15%">成功数/总数</th>
							<th width="15%">创建时间</th>
							<th width="15%">操作人</th>
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
		"ordering" : false,
		"pagingType" : "simple_numbers",
		"autoWidth" : false,
		"processing" : true,
		"serverSide" : true,
		"searching" : false,
		"filter" : false,
		"ajax" : {
			"url" : "user/import",
			"type" : "post",
			"data" : function(data) {
				data.keyword = $("#keyword").val();
			}
		},
		"language" : {
			"url" : "<%=basePath%>static/AdminLTE/plugins/datatables/cn.txt",
		},
		"columns": [
			{ "data": "name" },
			{ "data": "null" },
			{ "data": "createTime" },
			{ "data": "creator" },
			{ "data": null },
		],
		"columnDefs": [{
			"targets": 1,
			"render": function(data, type, row) {
				return row.successNum + '/' + row.totalNum;
			}},{
			"targets": 4,
			"render": function(data, type, row) {
				var html = '<div class="hidden-sm hidden-xs btn-group">'
				+ '<a class="btn btn-xs btn-success" title="下载详细导入结果" data-target="file" data-id=' + row.fileId + ' href="#" >'
					+ '<i class="ace-icon fa fa-download bigger-120"></i>'
				+ '</a>'
				+ '</div>';
				if(row.status == 'running'){
					html = '';
				}
				return html;
			}}],
		"drawCallback": function (settings) {
			//drawAceCheck('defaultCheck', 'chx_default');
		},
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