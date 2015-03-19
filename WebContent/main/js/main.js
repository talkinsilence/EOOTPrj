$(document).ready(function () {

	//===========< profile >==============================================
    $('.profile-family-members').mouseover(function () {
        var divLoc = $(this).offset();
        var left = divLoc.left + 26;
        var top = divLoc.top + 35;
        $('.info-wrapper').css({
            "opacity": "1",
            "visibility": "visible",
            "left": left,
            "top": top
        }).show();
    });

    $('.profile-family-members').mouseout(function () {
        $('.info-wrapper').hide();
    });

    $('.info-wrapper').mouseover(function () {
        $(this).show();
    });

    $('.info-wrapper').mouseout(function () {
        $(this).hide();
    });

    //===========< letter >==============================================
    $('.alarm.let').click(function () {
        $('.letter-type-wrapper, .letter-write-wrapper, .letter-add-wrapper').css("display", "none");
        $('.letter, .letter-box-wrapper').fadeIn(200);
    });
    
/*    $('.letter-title').click(function(){
    	
    });*/
    	
    $('#letter-write').click(function () {
        $('.letter-box-wrapper, .letter-write-wrapper, .letter-add-wrapper').css("display", "none");
        $('.letter, .letter-type-wrapper').fadeIn(200);
    });

    $('.btn-close, .letter-transp-bg').click(function () {
        $('.letter').fadeOut(10);
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
    
})