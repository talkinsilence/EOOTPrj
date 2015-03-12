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
        $('.letter-write-wrapper').css("display", "block");

        var loc = $('.letter-write-wrapper').offset();
        var wid = $('.letter-write-wrapper').width();
        $('.letter-add-wrapper').offset({ left: loc.left + wid + 70, top: loc.top });

        $('.letter-add-wrapper').fadeIn(100, 'linear');
    });

    
    
    //여기
    

    $('#letter-send').click(function () {
        if ($('.letter-to-list').length == 0)
            alert("수신인을 한 명 이상 지정해야 합니다.");
        else if (($('#write').val() == ""))
            alert("편지 내용을 입력해주세요.");
        else {
            $('.letter-write-wrapper, .letter-add-wrapper').hide(800, function () {
                alert("편지가 전송되었습니다^ㅇ^");
            });
        }
    });
    
    
    $('.letter-add-list').each(function(){
    	$(this).children("img").click(function(){
    		var src = $(this).attr("src");
        	alert(src);
        	$('.letter-to-list').clone().prependTo($('.letter-to-list-wrapper'));
    	});
    });
    	//$('.letter-to-list').attr("src", src);
    	//$('.letter-to-list-wrapper').append($('.letter-to-list'));


    
})