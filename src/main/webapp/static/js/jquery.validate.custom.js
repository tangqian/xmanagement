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
            success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
                alert('提交成功！');
            },
			error: function(msg) {
				$(form).clearForm();
				$.dialog.alert("删除简历成功！");
                if($(form).find("*[data-dismiss='modal']").length>0){
	                $(form).find("*[data-dismiss='modal']").click();
	                var callfn = $(form).attr("callfn");
	                if(callfn)
	                {
	                	eval(callfn+"()");
	                }
                }
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
    accept: "请输入拥有合法后缀名的字符串",
    maxlength: jQuery.validator.format("请输入一个 长度最多是 {0} 的字符串"),
    minlength: jQuery.validator.format("请输入一个 长度最少是 {0} 的字符串"),
    rangelength: jQuery.validator.format("请输入 一个长度介于 {0} 和 {1} 之间的字符串"),
    range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
    max: jQuery.validator.format("请输入一个最大为{0} 的值"),
    min: jQuery.validator.format("请输入一个最小为{0} 的值")
});