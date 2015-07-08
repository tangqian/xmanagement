<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<form class="form-horizontal" role="form">
	<div class="modal-header">
		<div class='bootstrap-dialog-header'>
			<div class='bootstrap-dialog-close-button' style='display: block;'>
				<button class='close' data-dismiss='modal' aria-label='Close'>×</button>
			</div>
			<div class='bootstrap-dialog-title'>查看用户</div>
		</div>
	</div>
	<div class="modal-body">
		<div class="container-fluid">
			<div class="form-group">
				<label for="loginName" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-7">
					<span class="form-control show-only-bottom">${entity.loginName}</span>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">真实姓名</label>
				<div class="col-sm-7">
					<span class="form-control show-only-bottom">${entity.name}</span>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-7">
					<span class="form-control show-only-bottom">${entity.email}</span>
				</div>
			</div>
			<div class="form-group">
				<label for="phone" class="col-sm-2 control-label">电话</label>
				<div class="col-sm-7">
					<span class="form-control show-only-bottom">${entity.phone}</span>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-2 control-label">描述</label>
				<div class="col-sm-7"><textarea disabled="disabled" class="form-control"
						rows="3">${entity.description}</textarea></div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-2 control-label">创建人</label>
				<div class="col-sm-4">
					<span class="form-control show-only-bottom">${entity.creator}</span>
				</div>
				<label for="description" class="col-sm-2 control-label">创建时间</label>
				<div class="col-sm-4">
					<span class="form-control show-only-bottom"><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm"/></span>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-2 control-label">修改人</label>
				<div class="col-sm-4">
					<span class="form-control show-only-bottom">${entity.modifier}</span>
				</div>
				<label for="description" class="col-sm-2 control-label">修改时间</label>
				<div class="col-sm-4">
					<span class="form-control show-only-bottom"><fmt:formatDate value="${entity.modifyTime}" pattern="yyyy-MM-dd HH:mm"/></span>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	</div>
</form>