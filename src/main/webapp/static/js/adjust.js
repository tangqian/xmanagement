customMsg = {
	htmlContent : {
		modal : "<div class='modal bootstrap-dialog type-primary fade size-normal in' id='#targetId' role='dialog' aria-hidden='true' data-backdrop='static' data-keyboard='true'>"
				+ "<div class='modal-dialog'><div class='modal-content'></div></div></div>",
		warnTips : "<div class='error-page' style='height: 140px; margin-left: 20px; margin-top: -15px;'><h2 class='headline text-yellow'>#status</h2>"
				+ "<div class='error-content' style='padding-top: 30px;'>"
				+ "<h3><i class='fa fa-warning text-yellow'></i> 对不起! 系统出错了。</h3>"
				+ "<p>请您反馈给系统管理员，我们会尽快解决该问题</p></div></div>"
	},
	_showDialog : function(targetId, url, data) {
		var html = this.htmlContent.modal.replace("#targetId", targetId);
		$("body").append(html)
		$.ajax({
			'type' : data.method || "get",
			'url' : url,
			'data' : data,
			'async' : false,
			'success' : function(data, status) {
				if (status != 'success') {
					$('#' + targetId).modal('hide')
					$('#' + targetId).remove();
					BootstrapDialog.show({
						type : BootstrapDialog.TYPE_WARNING,
						title : '操作提示',
						message : "连接不存在或刷新页面后重新尝试！",
					});
					return;
				} else {
					if (data.indexOf("modal-header") == -1
							&& data.indexOf("error-page") != -1) {// 500错误提示页,由于是在弹出框中显示，需要改为弹出框显示该错误
						$('#' + targetId).modal('hide')
						$('#' + targetId).remove();
						BootstrapDialog.show({
							type : BootstrapDialog.TYPE_WARNING,
							title : '操作提示',
							message : customMsg.htmlContent.warnTips.replace("#status", 500)
						});
					} else{
						$("#" + targetId).find(".modal-content").html(data);
						$('#' + targetId).modal();
					}
				}
			},
			'error' : function(XmlHttpRequest, textStatus, errorThrown) {
				$('#' + targetId).modal('hide')
				$('#' + targetId).remove();
				BootstrapDialog.show({
					type : BootstrapDialog.TYPE_WARNING,
					title : '操作提示',
					message : customMsg.htmlContent.warnTips.replace("#status",
							XmlHttpRequest.status)
				});
				return;
			}
		});
		$('#' + targetId).on('hide.bs.modal', function() {
			$(this).remove();
		})
	},
	dialog : function(targetId, url, data) {
		if (window.top != window) {
			window.top.customMsg._showDialog(targetId, url, data);
		} else {
			customMsg._showDialog(targetId, url, data);
		}
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

function isJson(obj) {
	var isjson = typeof (obj) == "object"
			&& Object.prototype.toString.call(obj).toLowerCase() == "[object object]"
			&& !obj.length;
	return isjson;
}

function newGuid() {
	var guid = "";
	for (var i = 1; i <= 32; i++) {
		var n = Math.floor(Math.random() * 16.0).toString(16);
		guid += n;
	}
	guid += new Date().getTime();
	return guid.toUpperCase();
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

	$("body").delegate("*[data-model='dialog']", "click", function() {
		var targetId = $(this).data("targetId");
		if (targetId == undefined) {
			targetId = newGuid();
		}
		var method = $(this).data("method") || "get";
		var url = $(this).data("url");
		if (!url) {
			url = $(this).attr("href")
		}
		window.top.customMsg.dialog(targetId, url, {
			'method' : method
		});
		return false;
	});

	$("body").delegate("*[data-model='ajaxToDo']", "click", function() {
		// 改操作分单条/批量数据操作
		var url = $(this).data("url");
		if (!url) {
			url = $(this).attr("href")
		}
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
			title : '操作确认',
			message : msg,
			buttons : [ {
				label : '取消',
				action : function(dialogItself) {
					dialogItself.close();
				}
			}, {
				label : '确认',
				cssClass : 'btn-primary',
				action : function(dialogItself) {
					$.ajax({
						type : "post",
				        url : url,
				        data : {"ids" : ids},
				        dataType:'json',
				        success:function(data){
				        	dialogItself.close();
			        		if(data.status == '1') {
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
				            	if(data.status == '500'){
				            		data.msg = customMsg.htmlContent.warnTips.replace("#status", 500);
				            	}
				                BootstrapDialog.show({
									type: BootstrapDialog.TYPE_WARNING,
						            title: '操作结果提示',
						            message: data.msg || "未知错误警告!请您反馈给系统管理员，我们会尽快解决该问题",
						        });
				            }
				        },
				        error:function(XmlHttpRequest, textStatus, errorThrown){
				        	dialogItself.close();
				        	BootstrapDialog.show({
								type: BootstrapDialog.TYPE_DANGER,
					            title: '操作结果提示',
					            message: customMsg.htmlContent.warnTips.replace("#status", XmlHttpRequest.status)
					        });
				        }
				    });
				}
			} ]
		});
		return false;
	});
});