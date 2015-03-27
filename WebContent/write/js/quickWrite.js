window.addEventListener("load", function() {

	var editFrame;
	var editFrameContent;
	var editDoc;
	var editDocContent;
	var editBody;
	var editBodyContent;
    var textarea1;
    var textarea2;
    var bold;
    var italic;
    var fontSize;
    var fontColor;

	initEditable();	
	
	function initEditable() {
		textarea1 = document.querySelector("#textarea1");
		editFrame = document.querySelector("#textTop");
		
		textarea2 = document.querySelector("#textarea2");
		editFrameContent = document.querySelector("#textContent");
		
		bold = document.querySelector("#bold");
		italic = document.querySelector("#italic");
		fontsize = document.querySelector("#size");
		fontColor  = document.querySelector("#colors");
		
		editDoc = editFrame.contentWindow.document;
		editDocContent = editFrameContent.contentWindow.document;
		
		editBody = editDoc.body;
		editBodyContent = editDocContent.body;
	
		// turn off spellcheck
		if ('spellcheck' in editBody) { // Firefox
			editBody.spellcheck = false;
		}
	
		if ('contentEditable' in editBody) {
			// allow contentEditable
			editBody.contentEditable = true;
		} else { // Firefox earlier than version 3
			if ('designMode' in editDoc) {
				// turn on designMode
				editDoc.designMode = "on";
			}
		}
		if ('spellcheck' in editBodyContent) { // Firefox
			editBodyContent.spellcheck = false;
		}
		
		if ('contentEditable' in editBodyContent) {
			// allow contentEditable
			editBodyContent.contentEditable = true;
		} else { // Firefox earlier than version 3
			if ('designMode' in editDocContent) {
				// turn on designMode
				editDocContent.designMode = "on";
			}
		}

		editBody.addEventListener("keyup",function(){
			textarea1.innerText = editBody.innerHTML;
		} );
		
		editBodyContent.addEventListener("keyup",function(){
			textarea2.innerText = editBodyContent.innerHTML;
		} );
		
		bold.addEventListener("click",function(){			
			editDoc.execCommand('bold', false, null);
			editDocContent.execCommand('bold', false, null);
		});
		
		italic.addEventListener("click",function(){			
			editDoc.execCommand('italic', false, null);
			editDocContent.execCommand('italic', false, null);
		});
		
		fontsize.addEventListener("change",function(){	
			var size = $('#size option:selected').val();
			editDoc.execCommand('FontSize', false, size);
			editDocContent.execCommand('FontSize', false, size);
		});
		
		fontColor.addEventListener("change",function(){	
			var color = $('#colors').val();
			editDoc.execCommand('forecolor', false, color);
			editDocContent.execCommand('forecolor', false, color);
		});
	};
});

/*
 * function iframeOn() { iframfield1.document.designMode = 'on';
 * textfield2.document.designMode = 'on';
 * 
 * 
 * iframfield1.document.body.addEventListner("keyup",function(){ alert("aaa");
 * });
 *  }
 * 
 * function bold() { textfield1.document.execCommand('bold', false, null);
 * textfield2.document.execCommand('bold', false, null); } function italic() {
 * textfield1.document.execCommand('italic', false, null);
 * textfield2.document.execCommand('italic', false, null); } function fontSize() {
 * var size = $('#size option:selected').val();
 * textfield1.document.execCommand('FontSize', false, size);
 * textfield2.document.execCommand('FontSize', false, size); } function
 * fontColors() { var color = $('#colors').val();
 * textfield1.document.execCommand('forecolor', false, color);
 * textfield2.document.execCommand('forecolor', false, color); }
 * 
 * 
 * $(document).ready(function(){
 * 
 * $(".qw-btn-close").click(function(){ $("#qw").css("display","none"); });
 * 
 * $(".qw-transp-bg").click(function(){ $("#qw").css("display","none"); }); });
 */