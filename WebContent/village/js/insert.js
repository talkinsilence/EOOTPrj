$(".post-input-button").click(function() {
	updateComment();
});

function updateComment() {
	$.ajax({
		type : "post",
		url : "updateCommentProc.jsp",
		data : {
			content : $(".post-input-text").val()
		}
	});
}
