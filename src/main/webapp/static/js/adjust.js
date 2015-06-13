$(function() {
	$("#defaultModal").on("hidden.bs.modal", function() {
		$(this).removeData("bs.modal");
	});
	
	$("body").delegate("a[data-target='content']","click",function(){
		var url = $(this).attr("href");
		var md = $(this).attr("md");
		if(md=='ajax'){
			
		}else{
			$("#content-container").load(url);
		}
		return false;
	});
});