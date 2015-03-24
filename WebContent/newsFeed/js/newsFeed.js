$(document).ready(function () {
	var toolbar = $('#toolbar');
	
	$(window).scroll(function () {
	    if (toolbar.offset().top !== 0) {
	        if (!toolbar.hasClass('shadow')) {
	            toolbar.addClass('shadow');
	        }
	    } else {
	        toolbar.removeClass('shadow');
	    }
	});
	
	$('.toolbar-opt').click(function () {
	    $('.opt-wrapper').toggle();
	});
	$('.opt').click(function(){
		$(this).parent().hide();
	});
	
	$('.user.log-out-toolbar').click(function(){
		var con = confirm("로그아웃 하시겠습니까?");
		if(con == true){
			alert("안녕히가세요~ o(^▽^)o");
			location.href="../logout.jsp";
		}
	});
    /*
	function logout(){
		var confirm = confirm("로그아웃 하시겠습니까?");
		if(confirm == true){
			location.href="../main/logout.jsp";
			//logout을 위해 세션을 제거하는 페이지 호출 
		}else{}	
	};  */
})

