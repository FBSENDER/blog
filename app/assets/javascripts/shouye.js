// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	
	$("#form_content").on("ajax:success", function(e, data, status, xhr){
		rsp = JSON.parse(xhr.responseText);
		if(rsp["success"] == true){
			alert("提交成功！");
		}
	});

	var content_height = $("#contain_content").height();
	var tmp = 0

	$("#contain_content").bind("keyup", function(){
		// $(this).attr("rows", parseInt($(this)[0]["rows"]) + 1)
		// $(this).height($(this).scrollTop() + content_height);
		// var ss = $(this).scrollTop();
		// if(ss > tmp){
		// 	tmp = ss;
		// 	content_height += ss
		// 	$(this).height(content_height);
		// }
		$(this).height(this.scrollHeight);
	})
});