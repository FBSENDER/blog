// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	
	$("#form_content").on("ajax:success", function(e, data, status, xhr){
		rsp = JSON.parse(xhr.responseText);
		if(rsp["success"] == true){
			alert("提交成功！");
		}
	});
});