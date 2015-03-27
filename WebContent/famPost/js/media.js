$(document).ready(function () {
	
	var dvImgCode;
	var dvCommentContainer;
	var detailView = $('.detail-view');
	var cnt = 0;
	/*var addClickCnt = 0;
	
	$(".add-item-btn").click(function(){
		addClickCnt++;
		$('media-lists').load("media.jsp?addClickCnt="+ addClickCnt);
		alert(addClickCnt);
	});*/
	
    //-----------------상세보기---------------------
	$(".dv-like-cnt").click(function(){
		cnt++;
	});
	
	
    $(".img-mask").click(function () {
    	$("body").css("overflow","hidden");
    	
        var dvImgSrc = $(this).parent().find(".media-list-item-img").attr("src");
        
        dvImgCode = $(this).parent().find(".media-list-item-code").html();

        dvCommentContainer = $('.dv-comment-container');
        
        dvCommentContainer.empty();
        
        dvCommentContainer.load(
        		  	"famPostView.jsp?famPostCode=" + dvImgCode, 
        		  	function(){
        		  		$(".dv-media-box-img").attr("src", dvImgSrc);
        		  		$(".dv-mask").fadeIn(800);
        			});
    });
    
    $('.dv-btn-next').click(function(){
    	detailView.load("nextView.jsp?curCode=" + dvImgCode,
    			function(){
    				dvImgCode = $('.current-code').html();
    	});
    });
    
    $('.dv-btn-pre').click(function(){
    	detailView.load("preView.jsp?curCode=" + dvImgCode,
    			function(){
    				dvImgCode = $('.current-code').html();
    	});
    });
    
    $(".dv-btn-close").click(function() {
		$(".dv-mask").fadeOut(300);
		$("body").css("overflow","auto");
	});
    
    //comment
    $(".dv-reg-btn").click(
    	    function(){
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
    	    			$(".dv-reg-input").val("");
    	    		}
    	    	});
    	    });
    
    $(".dv-reg-input").keypress(function(event) { 
    	if (event.which == 13){
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
        			$(".dv-reg-input").val("");
        		}
        	});
        }    
    });
    
    
    
    // ------------------등록-------------------------
    $(".upload").click(function () {
        $(".ma-mask").fadeIn(400);
    });

    $(".ma-btn-close").click(function () {
        $(".ma-mask").fadeOut(10);
    });

    //------------------메인--------------------------
});


