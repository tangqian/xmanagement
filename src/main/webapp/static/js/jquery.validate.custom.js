jQuery.validator.setDefaults({
	//debug : true,
	errorElement: "p",
    errorClass:"text-danger col-sm-3 p-error",
    errorPlacement: function(error, element) {                             //错误信息位置设置方法
        error.appendTo( element.parent().parent());                            //这里的element是录入数据的对象
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
            success: function(responseText) { // data 保存提交后返回的数据，一般为 json 数据
            	if( "1" == responseText.status){
            		$(form).clearForm();
                    if($(form).find("*[data-dismiss='modal']").length > 0){
                    	$(form).find("*[data-dismiss='modal']").click();
    	                var callfn = $(form).attr("callfn");
    	                if(callfn){
    	                	eval(callfn+"()");
    	                }
                    }
                    customMsg.success(responseText.msg || "成功", true);
                }
                else{
                	customMsg.warning(responseText.msg || "警告", false);
                }
            },
			error: function(XmlHttpRequest, textStatus, errorThrown) {
				customMsg.error("操作失败,状态信息为:" + textStatus + ",异常详细信息为:" + errorThrown.message, false);
			}
        });
	}
});

jQuery.extend(jQuery.validator.messages, {
    required: "必填字段",
    remote: "请修正该字段",
    email: "请输入正确格式的电子邮件",
    url: "请输入合法的网址",
    date: "请输入合法的日期",
    dateISO: "请输入合法的日期 (ISO).",
    number: "请输入合法的数字",
    digits: "只能输入整数",
    creditcard: "请输入合法的信用卡号",
    equalTo: "请输入相同的值",
    accept: "请输入拥有合法后缀名的文本",
    maxlength: jQuery.validator.format("输入的文本长度请小于 {0} "),
    minlength: jQuery.validator.format("输入的文本长度请大于 {0} "),
    rangelength: jQuery.validator.format("输入的文本长度请介于 {0} 和 {1} "),
    range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
    max: jQuery.validator.format("请输入一个最大为{0} 的值"),
    min: jQuery.validator.format("请输入一个最小为{0} 的值")
});