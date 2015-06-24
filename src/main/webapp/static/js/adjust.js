customMsg = {
	htmlContent:{
        modal: "<div class='modal bootstrap-dialog type-primary fade size-normal in' id='showMsgModal' tabindex='-1' role='dialog' data-backdrop='static' aria-hidden='true'>"
        		+	"<div class='modal-dialog'>"
        			+	"<div class='modal-content'>"
        				+	"<div class='modal-header'>"
        					+	"<h4 class='modal-title'>操作结果提示</h4>"
        				+	"</div>"
        				+	"<div class='modal-body'><div class='alert #show_style'>#msg</div></div>"
        				+	"<div class='modal-footer'>"
        					+	"<button type='button' class='btn btn-default' data-dismiss='modal'>关闭</button>"
        				+	"</div>"
        			+	"</div><!-- /.modal-content -->"
        		+	"</div><!-- /.modal-dialog -->"
        	+	"</div><!-- /.modal -->"
    },
    _showMsg: function(type, msg){
    	
    },
    _showModal: function(css, msg, autoClose){
    	var htmlText = this.htmlContent.modal.replace("#show_style",css);
    	htmlText = htmlText.replace("#msg", msg);
    	$("body").append(htmlText);
		if (autoClose) {
			$('#showMsgModal').on('shown.bs.modal', function() {
				setTimeout(function() {
					$('#showMsgModal').modal('hide');
				}, 1000);
			});
		}
		$('#showMsgModal').on('hide.bs.modal', function () {
            $(this).remove();
        });
        $('#showMsgModal').modal();
    },
	success:function(msg, autoClose){
    	window.top.customMsg._showModal("alert-success", msg, autoClose);
    },
    warning:function(msg, autoClose){
    	window.top.customMsg._showModal("alert-warning", msg, autoClose);
    },
    error:function(msg, autoClose){
    	window.top.customMsg._showModal("alert-danger", msg, autoClose);
    }
}

$(function() {
	$('#defaultModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
	  	var url = button.data('url') // Extract info from data-* attributes
	  	var modal = $(this);
	  	if(url != undefined){
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
			$("#content-container").load(url);
		}
		return false;
	});
});