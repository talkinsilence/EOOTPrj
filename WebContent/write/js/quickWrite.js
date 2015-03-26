
$(document).ready(function(){
	
	$(".qw-btn-close").click(function(){
		$("#qw").css("display","none");
	});
	
	$(".qw-transp-bg").click(function(){
		$("#qw").css("display","none");
	});
});

function iframeOn() {
    textfield1.document.designMode = 'on';
    textfield2.document.designMode = 'on';
}

function bold() {
    textfield1.document.execCommand('bold', false, null);
    textfield2.document.execCommand('bold', false, null);
}
function italic() {
    textfield1.document.execCommand('italic', false, null);
    textfield2.document.execCommand('italic', false, null);
}
function fontSize() {
    var size = $('#size option:selected').val();
    textfield1.document.execCommand('FontSize', false, size);
    textfield2.document.execCommand('FontSize', false, size);
}
function fontColors() {
    var color = $('#colors').val();
    textfield1.document.execCommand('forecolor', false, color);
    textfield2.document.execCommand('forecolor', false, color);
}
