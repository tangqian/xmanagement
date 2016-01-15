<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script src="${ctx}/static/js/ajaxfileupload.js" type="text/javascript"></script>
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
					<label class="col-sm-1 control-label"></label>
					<div class="col-sm-10">
						<input type="file" id="id-input-file-1" name="file" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		<button type="button" id="start" class="btn btn-primary">开始上传</button>
	</div>
</form>
<script type="text/javascript">
	jQuery(function($) {
		var file_input = $('#id-input-file-1').ace_file_input({
			style:'well',
			btn_choose:'拖入文件或点击选择',
			btn_change:null,
			no_icon:'ace-icon fa fa-cloud-upload',
			droppable:true,
			thumbnail:'small',
			allowExt: ["xls", "xlsx"]
			//
		});

		file_input.off('file.error.ace').on('file.error.ace',
				function(e, info) {
					alert("文件类型不符,请选择后缀名为xls或xlsx的文件!");
				});
		
		$("#start").click(function () {
			var filePath = $("#id-input-file-1").val();
			if(filePath == ''){
				alert("请选择excel文件!");
			}else{
				ajaxFileUpload();
			}
        })
	});
	

	function ajaxFileUpload() {
		$.ajaxFileUpload({
			url : 'user/import/upload', //用于文件上传的服务器端请求地址
			secureuri : false, //是否需要安全协议，一般设置为false
			fileElementId : 'id-input-file-1', //文件上传域的ID
			dataType : 'json', //返回值类型 一般设置为json
			success : function(data, status) //服务器成功响应处理函数
			{
            	if( data.status == '1'){
            		var theForm = $("#defForm");
            		var failureNum = 0;
            		var trDiv = '';
            		var rows = data.data;
		            for(var i=0; i < rows.length; i++){
		            	if(!rows[i].success){
		            		failureNum++;
		            		trDiv += '<tr><td>' + (rows[i].rowNum+1) + '</td><td>' + rows[i].loginName + '</td><td>' + rows[i].reason + '</td></tr>';
		            	}
		            }
		            var showDiv;
		            if(failureNum == 0){
		            	showDiv = customMsg.htmlContent.importAllSuccess.replace("#allNum", rows.length);
		            }else {
		            	showDiv = customMsg.htmlContent.importPartSuccess.replace("#failureNum", failureNum).replace("#successNum", rows.length - failureNum);
	                    showDiv += '<table id="simple-table" class="table table-striped table-bordered table-hover">' +
	            		'<thead><tr><th>行号</th><th>用户名</th><th>失败原因</th></tr></thead><tbody>' + trDiv + '</tbody></table>';
		            }
                    BootstrapDialog.show({
    					type: BootstrapDialog.TYPE_SUCCESS,
    		            title: '导入结果',
    		            message: showDiv,
    		            closable: false,
    		            buttons: [{
    		                label: '关闭',
    		                cssClass: 'btn-success',
    		                action: function(dialogRef){
    		            		var callfn = theForm.attr("callfn");
    		            		theForm.clearForm();
    		                    if(theForm.find("*[data-dismiss='modal']").length > 0){
    		                    	theForm.find("*[data-dismiss='modal']").click();
    		                    }
    		                    dialogRef.close();
    			                if(callfn){
    			                	eval(callfn+"()");
    			                }
    		                }
    		            }]
    		        });
                }
                else{
                	if(data.status == '500'){
	            		data.msg = customMsg.htmlContent.warnTips.replace("#status", 500);
	            	}
                	BootstrapDialog.show({
    					type: BootstrapDialog.TYPE_WARNING,
    		            title: '操作结果提示',
    		            message: data.msg || "系统错误警告!请反馈给系统管理员，我们会尽快解决该问题",
    		        });
                }
			},
			error : function(data, status, e)//服务器响应失败处理函数
			{
				alert(e);
			}
		})
		return false;
	}
</script>