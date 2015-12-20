<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<form class="form-horizontal" role="form" action="user/add"
	method="post" id="defForm" callfn="refreshTable">
	<div class="modal-header">
		<div class='bootstrap-dialog-header'>
			<div class='bootstrap-dialog-close-button' style='display: block;'>
				<button class='close' data-dismiss='modal' aria-label='Close'>×</button>
			</div>
			<div class='bootstrap-dialog-title'>导入用户</div>
		</div>
	</div>

	<div class="modal-body">
		<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<label for="loginName" class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-7">
						<input id="loginName" name="loginName" type="text" maxlength="32"
							minlength="3" class="form-control required" placeholder="请输入用户名">
					</div>
				</div>
				<div class="form-group">
					<label for="description" class="col-sm-2 control-label">描述</label>
					<div class="col-sm-7">
						<textarea id="description" name="description" class="form-control"
							rows="3"></textarea>
					</div>
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