customMsg = {
	htmlContent:{
        warning:"<div class='alert alert-warning'><a href='#' class='close' data-dismiss='alert'>&times;</a><strong>警告！</strong>#msg。 </div>",
        success:"<div class='alert alert-success'><a href='#' class='close' data-dismiss='alert'>&times;</a><strong>成功！</strong>#msg。 </div>",
    },
    _showMsg: function(type, msg){
    	
    },
	warning:function(msg){
		window.top.customMsg._showMsg("warning",msg);
	},
    success:function(msg){
		window.top.customMsg._showMsg("success",msg);
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

	$("body").delegate("a[data-target='content']", "click", function() {
		var url = $(this).attr("href");
		var md = $(this).attr("md");
		if (md == 'ajax') {

		} else {
			$("#content-container").load(url);
		}
		return false;
	});
});