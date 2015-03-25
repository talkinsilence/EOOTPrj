$(document).ready(function () {
	
	var dvImgCode;
	var dvCommentContainer

    //-----------------상세보기---------------------
	
    $(".media-list-item-mask").click(function () {
    	$("body").css("overflow","hidden");
        
        var dvImgSrc = $(this).parent().find(".media-list-item-img").attr("src");
        
        dvImgCode = $(this).parent().find(".media-list-item-code").html();
        
        alert(dvImgCode);
        
        dvCommentContainer = $('.dv-comment-container');
        
        dvCommentContainer.empty();
        
        dvCommentContainer.load(
        		  	"famPostView.jsp?famPostCode=" + dvImgCode, 
        		  	function(){
        		  		$(".dv-media-box-img").attr("src", dvImgSrc);
        		  		$(".dv-mask").fadeIn(800);
        			});
    });
     
    
    $(".dv-btn-close").click(function() {
		$(".dv-mask").fadeOut(300);
	});

    //코멘트저장
    $(".dv-reg-btn").click(function(){
    	var content =$(".dv-reg-input").val();
    
        $.ajax({
        	type:"post",
        	url:"famPostControl.jsp",
        	data: { famPostCode : dvImgCode
        			,content : content
        			},
        	dataType : "json",
        	success:function(data){
        		dvCommentContainer.load("famPostView.jsp?famPostCode=" + dvImgCode);
        	}
        });
    });
    
    // ------------------등록-------------------------
    $(".upload").click(function () {
        $(".ma-mask").fadeIn(400);
    });

    $(".ma-btn-close").click(function () {
        $(".ma-mask").fadeOut(10);
    });

    //------------------메인--------------------------
    
    /*$(".filed").click(function () {
        if ($(".filed-list-wrapper").is(":hidden")) {
            $(".filed-list-wrapper").slideDown("fast");
        }
        else {
            $(".filed-list-wrapper").hide();
        }
    });*/

});


