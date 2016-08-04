jQuery.validator.setDefaults({
	//debug : true,
	errorElement: "p",
    errorClass:"text-danger col-sm-3 p-error",
    errorPlacement: function(error, element) {                             //错误信息位置设置方法
        error.appendTo($(element).closest('.form-group'));                            //这里的element是录入数据的对象
    },
    highlight : function(element) {
        $(element).closest('.form-group').addClass('has-error');
    },
    success : function(label) {
        label.closest('.form-group').removeClass('has-error');
        label.remove();
    },
	submitHandler : function(form) {
		$(form).ajaxSubmit({
            type: 'post', // 提交方式 get/post
            dataType:"json",
            success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
            	if( data.status == '1'){
            		$(form).clearForm();
                    if($(form).find("*[data-dismiss='modal']").length > 0){
                    	$(form).find("*[data-dismiss='modal']").click();
    	                var callfn = $(form).attr("callfn");
    	                if(callfn){
    	                	eval(callfn+"()");
    	                }
                    }
                    BootstrapDialog.show({
    					type: BootstrapDialog.TYPE_SUCCESS,
    		            title: '操作结果提示',
    		            message: data.msg || "操作成功!",
    		            onshown: function(dialogRef){
    		            	setTimeout(function() {
    		            		dialogRef.close();
    						}, 1000);
    		            }
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
			error: function(XmlHttpRequest, textStatus, errorThrown) {
				BootstrapDialog.show({
					type: BootstrapDialog.TYPE_WARNING,
		            title: '操作结果提示',
		            message : customMsg.htmlContent.warnTips.replace("#status", XmlHttpRequest.status)
		        });
			}
        });
	}
});