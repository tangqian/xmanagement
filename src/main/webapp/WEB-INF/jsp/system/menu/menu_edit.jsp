<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<form class="form-horizontal" role="form" action="menu/edit"
	method="post" id="defForm" callfn="refreshTable">
	<input type="hidden" name="id" value="${entity.id}">
	<div class="modal-header">
		<div class='bootstrap-dialog-header'>
			<div class='bootstrap-dialog-close-button' style='display: block;'>
				<button class='close' data-dismiss='modal' aria-label='Close'>×</button>
			</div>
			<div class='bootstrap-dialog-title'>修改菜单</div>
		</div>
	</div>
	<div class="modal-body">
		<div class="container-fluid">
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">菜单名</label>
				<div class="col-sm-7">
					<input id="name" name="name" value="${entity.name}" type="text"
						maxlength="32" class="form-control required" placeholder="请输入菜单名">
				</div>
			</div>
			<div class="form-group">
				<label for="url" class="col-sm-2 control-label">url</label>
				<div class="col-sm-7">
					<input id="url" name="url" type="text" value="${entity.url}" maxlength="32"
						class="form-control required" placeholder="请输入url">
				</div>
			</div>
			<div class="form-group">
				<label for="icon" class="col-sm-2 control-label">图标</label>
				<div class="col-sm-7">
					<input id="icon" name="icon" value="${entity.icon}" type="text"
						maxlength="32" class="form-control" placeholder="请输入图标">
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-2 control-label">描述</label>
				<div class="col-sm-7">
					<textarea id="description" name="description" class="form-control"
						rows="3">${entity.description}</textarea>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		<button type="submit" class="btn btn-primary">保存</button>
	</div>
</form>
<script type="text/javascript">
	$("#defForm").validate();
</script>