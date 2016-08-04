customMsg = {
	htmlContent : {
		modal : "<div class='modal bootstrap-dialog type-primary fade size-normal in' id='#targetId' role='dialog' aria-hidden='true' data-backdrop='static' data-keyboard='true'>"
				+ "<div class='modal-dialog'><div class='modal-content'></div></div></div>",
		warnTips : "<div class='row'>"
				+ "<div class='col-xs-12 col-lg-4'>"
				+	"<div style='padding-top: 15px; text-align:right'>"
				+ 		"<span class=' bigger-275' style='color:#d15b47 !important'><i class='ace-icon fa fa-wrench icon-animated-wrench'></i> #status</span>"
				+	"</div>" 
				+ "</div>"
				+ "<div class='col-xs-12 col-lg-8'>" 
				+ 	"<div>"
				+ 		"<h3><i class='fa fa-warning' style='color:#d15b47 !important'></i> 对不起! 系统出错了。</h3><p>请您反馈给系统管理员，我们会尽快解决该问题</p>"
				+ 	"</div>" 
				+ "</div>" 
				+ "</div>",
		importAllSuccess : '<div class="alert alert-info"><i class="ace-icon fa fa-hand-o-right"></i> 恭喜您！全部数据导入成功，共导入#allNum条</div>',
		importPartSuccess : '<div class="alert alert-danger"><i class="ace-icon fa fa-hand-o-right"></i> 导入成功#successNum条，导入失败#failureNum条，失败原因如下</div>',
	},
	_showDialog : function(targetId, url, data) {
		var html = this.htmlContent.modal.replace("#targetId", targetId);
		$("body").append(html);
		if(data.width){
			$('#' + targetId).find(".modal-dialog").css("width",data.width);
		}
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

	/*$("body").delegate("a[data-target='navTab']", "click", function() {
		var url = $(this).attr("href");
		if(url.indexOf("?") == -1){
			url += "?t=" + new Date().getTime();
		}else{
			url += "&t=" + new Date().getTime();
		}
		var type = $(this).data("type");
		if (type == 'sidebar') {
			$("ul.nav-list li").removeClass("active");
			//$(this).parent().parent().children("li").removeClass("active");
			var rootLi = $(this).parent();
			rootLi.addClass("active");
			var ul = rootLi.parent();
			while(!ul.hasClass("nav-list")){
				rootLi = ul.parent();
				rootLi.addClass("active");
				ul = rootLi.parent();
			}
		}
		
		//$("#navTab").load(url);
		return false;
	});*/
	
	$("body").delegate("a[data-target='file']", "click", function() {
		var id = $(this).data("id");
		$.ajax({
			'type' : "get",
			'url' : "file/auth",
			'data' : {"id" : id},
			'success' : function(data, status) {
				if( data.status == '1'){
					window.location.href='file/download?responseContent=' + data.data.responseContent + '&path=' + data.data.path;
				}else{
					if(data.status == '500'){
	            		data.msg = customMsg.htmlContent.warnTips.replace("#status", 500);
	            	}
                	BootstrapDialog.show({
    					type: BootstrapDialog.TYPE_WARNING,
    		            title: '操作结果提示',
    		            message: data.msg || "系统出错了!请反馈给系统管理员，我们会尽快解决该问题",
    		        });
				}
			},
			'error' : function(XmlHttpRequest, textStatus, errorThrown) {
				BootstrapDialog.show({
					type : BootstrapDialog.TYPE_WARNING,
					title : '操作提示',
					message : customMsg.htmlContent.warnTips.replace("#status",
							XmlHttpRequest.status)
				});
			}
		});
		return false;
	});

	$("body").delegate("*[data-model='dialog']", "click", function() {
		var targetId = $(this).data("targetId");
		var width = $(this).data("width");
		if (targetId == undefined) {
			targetId = newGuid();
		}
		var method = $(this).data("method") || "get";
		var url = $(this).data("url");
		if (!url) {
			url = $(this).attr("href")
		}
		window.top.customMsg.dialog(targetId, url, {
			'method' : method,
			'width'  : width
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
						            message: data.msg || "系统出错了!请您反馈给系统管理员，我们会尽快解决该问题",
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