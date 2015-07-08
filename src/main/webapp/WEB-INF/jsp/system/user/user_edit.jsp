<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<form class="form-horizontal" role="form" action="user/edit"
	method="post" id="defForm" callfn="refreshTable">
	<div class="modal-header">
		<div class='bootstrap-dialog-header'>
			<div class='bootstrap-dialog-close-button' style='display: block;'>
				<button class='close' data-dismiss='modal' aria-label='Close'>×</button>
			</div>
			<div class='bootstrap-dialog-title'>修改用户</div>
		</div>
	</div>
	<div class="modal-body">
		<div class="container-fluid">
			<div class="form-group">
				<input type="hidden" name="id" value="${entity.id}"> <label
					for="loginName" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-7">
					<input id="loginName" value="${entity.loginName}" type="text"
						maxlength="32" class="form-control" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-7">
					<input id="password" name="password" type="password" maxlength="32"
						minlength="2" value="" class="form-control" placeholder="为空时将不修改原有密码">
				</div>
			</div>
			<div class="form-group">
				<label for="repassword" class="col-sm-2 control-label">重复密码</label>
				<div class="col-sm-7">
					<input id="repassword" type="password"
						maxlength="32" minlength="2" equalTo="#password" class="form-control"
						placeholder="请再次输入密码">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">真实姓名</label>
				<div class="col-sm-7">
					<input id="name" name="name" value="${entity.name}" type="text"
						maxlength="32" class="form-control required" placeholder="请输入真实姓名">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-7">
					<input id="email" name="email" value="${entity.email}" type="text"
						maxlength="32" class="form-control required" placeholder="请输入邮箱">
				</div>
			</div>
			<div class="form-group">
				<label for="phone" class="col-sm-2 control-label">电话</label>
				<div class="col-sm-7">
					<input id="phone" name="phone" value="${entity.phone}" type="text"
						maxlength="32" class="form-control required" placeholder="请输入电话">
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