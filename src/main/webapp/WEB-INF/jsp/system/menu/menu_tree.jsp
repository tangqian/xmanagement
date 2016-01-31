<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
		<li class="active"><a href="menu/list" data-target='navTab'>菜单管理</a></li>
	</ul>
	<!-- /.breadcrumb -->

</div>

<div class="page-content">

	<div class="page-header">
		<button class="btn btn-white btn-info btn-round" data-model="dialog"
			data-url="menu/add">
			<i class="ace-icon fa fa-floppy-o bigger-120 blue"></i> 新增
		</button>

	</div>
	<div class="row">
		<div class="col-xs-12">

			<div class="clearfix">
				<div class="pull-right tableTools-container"></div>
			</div>

			<div class="dd dd-draghandle" style="width: 300px;">
				<ol class="dd-list">
				<c:forEach var="menu" items="${menus}">
					<li class="dd-item dd2-item" data-id="${menu.id}">
						<div class="dd-handle dd2-handle" title="拖放菜单可排序">
							<i class="normal-icon ace-icon fa fa-comments blue bigger-130"></i>

							<i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
						</div>
						<div class="dd2-content">${menu.name}
							<div class="pull-right action-buttons">
								<a class="blue" data-model="dialog" href="menu/edit?id=${menu.id}">
									<i class="ace-icon fa fa-pencil bigger-130"></i>
								</a>
								<a class="red" data-model="ajaxToDo" data-callback="refreshTable" data-msg="确定删除吗？" href="menu/delete?id=${menu.id}">
									<i class="ace-icon fa fa-trash-o bigger-130"></i>
								</a>
							</div>
						</div>
						
					</li>
				</c:forEach>

					<!-- <li class="dd-item dd2-item" data-id="14">
						<div class="dd-handle dd2-handle">
							<i class="normal-icon ace-icon fa fa-clock-o pink bigger-130"></i>

							<i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
						</div>
						<div class="dd2-content">Recent Posts</div>
					</li>

					<li class="dd-item dd2-item" data-id="15">
						<div class="dd-handle dd2-handle">
							<i class="normal-icon ace-icon fa fa-signal orange bigger-130"></i>

							<i class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
						</div>
						<div class="dd2-content">Statistics</div>
					</li>

					<li class="dd-item dd2-item" data-id="19">
						<div class="dd-handle dd2-handle">
							<i class="normal-icon ace-icon fa fa-bars blue bigger-130"></i> <i
								class="drag-icon ace-icon fa fa-arrows bigger-125"></i>
						</div>
						<div class="dd2-content">Menu</div>
					</li> -->
				</ol>
			</div>
		</div>
	</div>
</div>

<script src="${ctx}/static/Ace/js/jquery.nestable.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.dd').nestable().on('change', function(){
        var r = $('.dd').nestable('serialize');
        var data = eval(JSON.stringify(r));
        var ids = new Array();
        for(var i = 0; i < data.length; i++)  
        {  
        	ids.push(data[i].id);
        }
		$.ajax({
			'type' : "post",
			'url' : "menu/sort",
			'data' : {
				"ids" : ids
			},
			'success' : function(data, status) {
				if(data.status == '1') {
	                BootstrapDialog.show({
						type: BootstrapDialog.TYPE_SUCCESS,
			            title: '排序结果提示',
			            message: data.msg || "操作成功!",
			            onshown: function(dialogRef){
			            	setTimeout(function() {
			            		dialogRef.close();
							}, 1000);
			            }
			        });
	            }else{
	            	if(data.status == '500'){
	            		data.msg = customMsg.htmlContent.warnTips.replace("#status", 500);
	            	}
	                BootstrapDialog.show({
						type: BootstrapDialog.TYPE_WARNING,
			            title: '排序结果提示',
			            message: data.msg || "未知错误警告!请您反馈给系统管理员，我们会尽快解决该问题",
			        });
	            }
				refreshTable();
			}
		});

	});

	$('.dd-handle a').on('mousedown', function(e) {
		e.stopPropagation();
	});
});

function refreshTable() {
	$("#navTab").load("menu/tree?t=" + new Date().getMilliseconds());
}
</script>