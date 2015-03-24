﻿$(document).ready(function () {

	/*===========< upper-left >========================================*/
	$('.user-menu-btn').click(function () {
	    $('.user-menu-area').toggle();
	});
	
	$('.user-menu').click(function(){
		$(this).parent().hide();
	});
	
	$('.user-menu-wrapper-bg').click(function(){
		$(this).parent().hide();
	});
	
	$('.user-menu.settings-main').click(function(){
		location.href="../settings/settings.jsp";
	});
	
	$('.user-menu.log-out-main').click(function(){
		var con = confirm("로그아웃 하시겠습니까?");
		if(con == true){
			alert("안녕히가세요~ o(^▽^)o");
			location.href="../logout.jsp";
		}
	});

	/*===========< lower-right >========================================*/
	$('.preview-pic').each(function(){
		if($(this).height() >= $(this).width()){
			$(this).css({
			    "width": "100%",
				"height": "auto",
			    "left": "0",
				"top": "50%",
		    	"-webkit-transform": "translate(0, -50%)"
			})
		}
	});
	
    /*===========< letter >=============================================*/
    $('.alarm.let').click(function () {
        $('.letter-view-wrapper, .letter-type-wrapper, .letter-write-wrapper, .letter-add-wrapper').css("display", "none");
        $('.letter, .letter-box-wrapper').fadeIn(200);
    });
    
    $('.btn-close, .letter-transp-bg').click(function () {
    	location.reload();
        $('.letter').fadeOut(10);
    });
    
    $('.btn-close-letter-view, .letter-view-transp-bg').click(function () {
        $('.letter-view-wrapper').fadeOut(10);
    });
    
    $('.letter-search').click(function(){
    	$(this).select();
    });
    
    $('#letter-search').click(function(){
    	var input = $(this).parent().find('.letter-search');
    	
    	var lbox = $('.letter-item-box');
    	lbox.empty();
    	lbox.load("letter.jsp?query="+input.val());
    });

    $('.letter-title').click(function(){    	
    	var lvbox = $('.letter-view-box');
    	lvbox.empty();
    	
    	var lcode = $(this).parent().find('.letter-code').html();
    	lvbox.load("letter_view.jsp?code="+lcode, function(){
    		alert("main에서 클릭");
    		$('.letter-view-wrapper').show();
    	});
		$(this).css("color", "#000");
    });

    $('#letter-write').click(function () {
        $('.letter-box-wrapper, .letter-write-wrapper, .letter-add-wrapper').css("display", "none");
        $('.letter, .letter-type-wrapper').fadeIn(200);
    });

    if ($('.letter-write-box').height() >= 400)
        $('#write').attr("rows", "19");
    else
        $('#write').attr("rows", "17");

    $('.letter-type.text').click(function () {
        $('.letter-type-wrapper').hide(10, function () {
            $('.letter-write-wrapper').fadeIn(200);
        });
    });
    
    $('.letter-type.voice').click(function () {
        alert("음성편지 기능은 아직 준비중입니다.\ne-oot ver.2에서 만나요!(^o^)");
    });
    
    $('.letter-type.video').click(function () {
        alert("영상편지 기능은 아직 준비중입니다.\ne-oot ver.2에서 만나요!(^o^)");
    });

    $('.delete').click(function () {
        $(this).parent().remove();
    });

    $('.letter-to-list-add').click(function () {
    	//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> bug!!!
        $('.letter-write-wrapper').css("display", "block");

        var loc = $('.letter-write-wrapper').offset();
        var wid = $('.letter-write-wrapper').width();
        $('.letter-add-wrapper').offset({ left: loc.left + wid + 70, top: loc.top });

        $('.letter-add-wrapper').fadeIn(100, 'linear');
    });
    
    $('.letter-add-list').each(function(){
        
        //var clicked = 0;
        
        $(this).children("img").click(function(){
           //alert($('.letter-to-list-wrapper > img ').attr("name"));
           //clicked = 1;
           //alert(clicked);

           var name = $(this).attr("name");
            alert(name);
           
           //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> bug!!!
            if($('.letter-to-list-wrapper > .letter-add-list').find("*").attr("name")!=name){
                             
               //clicked = 0;
               //alert(clicked);
               
               var clone = $(this).parent().clone().css("float", "left");
               clone.append($('<div class="delete"></div>'));
               clone.prependTo($('.letter-to-list-wrapper'));
                             
                $('.delete').click(function () {
                    $(this).parent().remove();
                });
            }

        });
        
     });
    
    $('#letter-add-cancel').click(function () {
        $('.letter-add-wrapper').fadeOut(10);
    });

    $('#letter-send').click(function () {
        if ($('.letter-to-list' || '.letter-add-list').length == 0)
            alert("수신인을 한 명 이상 지정해야 합니다.");
        else if (($('#write').val() == ""))
            alert("편지 내용을 입력해주세요.");
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> bug!!!
        else {
            $('.letter-write-wrapper, .letter-add-wrapper').hide(800, function () {
                alert("편지가 전송되었습니다^ㅇ^");
            });
        }
    });

    /*===========< newsFeed >=============================================*/
    $('.alarm.news').click(function () {
    	$(this).unbind('click');
        //alert($('.main').height());
        //alert($('.lower').height());
        
        var pushMain = $('.main').height() + $('.lower').height();
        //alert(pushMain);
    	
        $('.main').animate({
        	'marginTop': -pushMain + 'px'
        }, 600, function(){
        	location.href="../newsFeed/newsFeed.jsp";
        });
    }); 	
})
