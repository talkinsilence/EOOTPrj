$(document).ready(function () {

    //-----------------상세보기---------------------
    $(".media-list-item-mask").click(function () {
    	$("body").css("overflow","hidden");
        
        var dvImgSrc = $(this).parent().find(".media-list-item-img").attr("src");
        
        var dvImgCode = $(this).parent().find(".media-list-item-code").val();
        
        var dvCommentContainer = $('.dv-comment-container');
        
        dvCommentContainer.empty();
        
        dvCommentContainer.load(
        		  	"famPostView.jsp?famPostCode=" + dvImgCode, 
        		  	function(){
        		  		$(".dv-media-box-img").attr("src", dvImgSrc);
        		  		$(".dv-mask").fadeIn(800);
        			});
    });
    
    $(".dv-btn-close").click(function() {
		$(".dv-content").animate({
			height : "20px"
		}, 500, function() {
			alert($(this).attr("word-break"));
			$(this).css("word-break", "inherit");
			$(".dv-mask").fadeOut(300);
			$("body").css("overflow", "inherit");
		});
	});

    //------------------등록-------------------------
    $(".upload").click(function () {
        $(".ma-mask").fadeIn(400);
    });

    $(".ma-btn-close").click(function () {
        $(".ma-mask").fadeOut(10);
    });

    //------------------메인--------------------------
    $(".folder").click(function () {
        if ($(".folder-list-wrapper").is(":hidden")) {
            $(".folder-list-wrapper").slideDown("fast");
        }
        else {
            $(".folder-list-wrapper").hide();
        }
    });

});