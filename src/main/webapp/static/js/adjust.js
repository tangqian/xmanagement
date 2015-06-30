customMsg = {
	htmlContent : {
		modal : "<div class='modal bootstrap-dialog type-primary fade size-normal in' id='showMsgModal' tabindex='-1' role='dialog' data-backdrop='static' aria-hidden='true'>"
				+ "<div class='modal-dialog'>"
				+ "<div class='modal-content'>"
				+ "<div class='modal-header'>"
				+ "<h4 class='modal-title'>操作结果提示</h4>"
				+ "</div>"
				+ "<div class='modal-body'><div class='alert #show_style'>#msg</div></div>"
				+ "<div class='modal-footer'>"
				+ "<button type='button' class='btn btn-default' data-dismiss='modal'>关闭</button>"
				+ "</div>"
				+ "</div><!-- /.modal-content -->"
				+ "</div><!-- /.modal-dialog -->" + "</div><!-- /.modal -->"
	},
	_showMsg : function(type, msg) {

	},
	_showModal : function(css, msg, autoClose) {
		var htmlText = this.htmlContent.modal.replace("#show_style", css);
		htmlText = htmlText.replace("#msg", msg);
		$("body").append(htmlText);
		if (autoClose) {
			$('#showMsgModal').on('shown.bs.modal', function() {
				setTimeout(function() {
					$('#showMsgModal').modal('hide');
				}, 1000);
			});
		}
		$('#showMsgModal').on('hide.bs.modal', function() {
			$(this).remove();
		});
		$('#showMsgModal').modal();
	},
	success : function(msg, autoClose) {
		window.top.customMsg._showModal("alert-success", msg, autoClose);
	},
	warning : function(msg, autoClose) {
		window.top.customMsg._showModal("alert-warning", msg, autoClose);
	},
	error : function(msg, autoClose) {
		window.top.customMsg._showModal("alert-danger", msg, autoClose);
	}
}

function getCheckboxItem(checkBoxName) {
	var allSel = "";
	var ids = $("input[name='" + checkBoxName + "']");

	$(ids).each(function(i) {
		if (this.disabled == false) {
			if (this.checked) {
				if (allSel == "")
					allSel = this.value;
				else
					allSel = allSel + "," + this.value;
			}
		}
	});
	return allSel;
}

$(function() {
	$('#defaultModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var url = button.data('url') // Extract info from data-* attributes
		var modal = $(this);
		if (url != undefined) {
			modal.find('.modal-content').load(url)
		}
	})

	$("#defaultModal").on("hidden.bs.modal", function() {
		$(this).removeData("bs.modal");
	});

	$("body").delegate("a[data-target='navTab']", "click", function() {
		var url = $(this).attr("href");
		var md = $(this).attr("md");
		if (md == 'ajax') {

		} else {
			$("#navTab").load(url);
		}
		return false;
	});

	$("body").delegate("*[data-model='ajaxToDo']", "click", function() {
		// 改操作分单条/批量数据操作
		var url = $(this).data("url");
		var msg = $(this).data("msg");
		var callback = $(this).data("callback");// 回调函数
		var checkboxName = $(this).data("checkboxName"); // 多选框NAME，批量操作时才会有值

		var ids = "";
		if (checkboxName != undefined) {
			// 批量操作
			ids = getCheckboxItem(checkboxName);
			if (ids == "") {
				BootstrapDialog.show({
					type : BootstrapDialog.TYPE_WARNING,
					title : '操作提示',
					message : '请先勾选数据！',
					onshown : function(dialogRef) {
						setTimeout(function() {
							dialogRef.close();
						}, 1000);
					}
				});
				return false;
			}
		} else {
			// 单条数据操作
		}

		BootstrapDialog.show({
			message : '操作确认',
			buttons : [ {
				label : '取消',
				action : function(dialogItself) {
					dialogItself.close();
				}
			}, {
				label : '确认',
				cssClass : 'btn-primary',
				action : function() {
					alert('Hi Orange!');
				}
			} ]
		});

		/*obj.callback=function(){
		    $.ajax({
		        url:url,
		        data : {
		        	"ids" : ids
		        },
		        dataType:'json',
		        success:function(data){
		        	$('#'+targetid).modal("hide");
		            if(data.status) {
		                if(callback)
		                {
		                	eval(callback + "()");
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
		            }else{
		                BootstrapDialog.show({
							type: BootstrapDialog.TYPE_WARNING,
				            title: '操作结果提示',
				            message: data.msg || "未知错误警告!请您反馈给系统管理员，我们会尽快解决该问题",
				        });
		            }
		        },
		        error:function(XmlHttpRequest, textStatus, errorThrown){
		        	$('#'+targetid).modal("hide");
		        	BootstrapDialog.show({
						type: BootstrapDialog.TYPE_WARNING,
			            title: '操作结果提示',
			            message: "操作失败!请求状态为：" + XmlHttpRequest.status + ",状态信息为:" + textStatus + ",异常详细信息为:" + errorThrown.message + "。请您反馈给系统管理员，我们会尽快解决该问题"
			        });
		        }
		    });
		}*/
		//dialogMng.comfirm(obj);
	});
});