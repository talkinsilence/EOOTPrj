$(document).ready(function () {

    //-----------------상세보기---------------------
    $(".media-list-item-mask").click(function () {
        $(".dv-mask").fadeIn(400);
        $("body").css("overflow","hidden");
        
        var dvImgSrc = $(this).parent().find(".media-list-item-img").attr("src");
        $(".dv-media-box-img").attr("src", dvImgSrc);
        
        var dvImgCode = $(this).parent().find("#media-list-item-code").serialize();
        alert(dvImgCode);

        $.ajax({
        	type:"post",
        	url:"famPostControl.jsp",
        	data:"famPostCode="+dvImgCode,
        	success:function(data){
        		callback(data);
        	}
        });
        
        
        
        /*$('#letter-search').click(function(){
        	//var input = $(this).parent().find(".letter-search");
        	
        	var lbox = $('.letter-item-box');
        	lbox.empty();
        	lbox.load("letter.jsp?query="+$('.letter-search').val());
        });*/
        
        /*var dvCommentContainer = ${'#dv-comment-container'}*/
        /*dvCommentContainer.empty()*/;
        /*dvCommentContainer.load("famPostDetailView.jsp");*/
    });
    
    $(".dv-content").click(function () {
        if ($(this).css("word-break") == "normal") {
            $(this).stop()
                   .animate({ height: "474px" }, 600)
                   .css("word-break", "break-all");
        }
        else {
            $(this).stop()
                   .animate({ height: "22px" }, 500, function () {
                       $(this).css("word-break", "inherit");
                   });
        }
    });
    
    $(".dv-btn-close").click(function () {
        $(".dv-mask").fadeOut(10);
        $(".dv-content").animate({ height: "22px" }, 500, function () {
            $(this).css("word-break", "inherit");
        });
        $("body").css("overflow", "inherit");
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