<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true">×</button>
	<h4 class="modal-title" id="myModalLabel">增加用户</h4>
</div>
<div class="modal-body">按下 ESC 按钮退出。</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">关闭
	</button>
	<button type="button" class="btn btn-primary">提交更改</button>
</div>