$(document).ready(function () {

    //-----------------상세보기---------------------
    $(".media-list-item-mask").click(function () {
    	
    	
        var dvImgSrc = $(this).parent().find(".media-list-item-img").attr("src");
        
        var dvImgCode = $(this).parent().find(".media-list-item-code").html();
        
        /*$('.dv-reg-btn').click(function () {
        	alert(dvImgCode);
        });*/
        
        var dvCommentContainer = $('.dv-comment-container');
        
        dvCommentContainer.empty();
        
        dvCommentContainer.load(
        		  "famPostView.jsp?famPostCode=" + dvImgCode, 
        		  function(){
        			  $(".dv-media-box-img").attr("src", dvImgSrc);
        			  $(".dv-mask").fadeIn(800);
        		  });
        
        $('.dv-reg-btn').click(function () {
        	alert(dvImgCode);
        });
    });
    
    
    $(".dv-btn-close").click(function() {
		$(".dv-mask").fadeOut(300);
		location.reload();
	});
    
    //------------------댓글등록--------------------
    
    /*$('.dv-reg-btn').click(function () {
    	var dvImgCode = $('.media-list-item-code').val();
    	alert(dvImgCode);
    	var comment = $('.dv-reg-input').val();
    	var dvCommentContainer = $('.dv-comment-container');
    	
    	dvCommentContainer.load(
    			"famPostCommentReg.jsp?famPostCode=" + dvImgCode +"&comment="+comment,
    		  	function(){
    		  		$('.dv-reg-input').val("");
    			});
    });*/
    
    
    
    
    $('.dv-reg-btn').click(function (){$(this).removeAttr('val')});
    //------------------등록-------------------------
    
    $(".upload").click(function () {
        $(".ma-mask").fadeIn(400);
    });

    $(".ma-btn-close").click(function () {
        $(".ma-mask").fadeOut(10);
    });

    //------------------메인--------------------------

    

});