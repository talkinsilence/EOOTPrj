$(document).ready(function () {

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
    	/*reset_writeForm();*/
        $('.letter').fadeOut(10);
    });
    
    $('.btn-close-letter-view, .letter-view-transp-bg').click(function () {
        $('.letter-view-wrapper').fadeOut(10);
    });
    
    $('.letter-mani-area').mouseover(function(){
    	$(this).find('.letter-mani-wrapper-bg, .letter-mani-wrapper, .letter-mani').css("display", "block");   
    });
    
    $('.letter-mani-area').mouseout(function(){
    	$(this).find('.letter-mani-wrapper-bg, .letter-mani-wrapper, .letter-mani').css("display", "none");
    });
    
    $('.letter-mani.delete-letter').click(function(){
    	var lcnt = $('#lcnt');
    	var lcntVal = lcnt.html();

    	var thisLetter = $(this).parent().parent().parent();
    	var lcode = thisLetter.find('.letter-code').html();
    	
    	var con = confirm("이 편지를 삭제하시겠습니까?");
		if(con == true){
    		$.ajax({
    			type:"post",
    			url:"deleteLetterControl.jsp",
    			data:{
    				code:lcode
    			},
    			success:function(){
    				thisLetter.remove();
    				alert("삭제되었습니다");
    				lcnt.empty();
    				lcnt.html(lcntVal - 1);
    			}
    		});
		}
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
    		//alert("main에서 클릭");
    		$('.letter-view-wrapper').show();
    	});
		$(this).css("color", "#000");
    });
    
    /*===< 답장하기 >===*/
    $('.letter-mani.reply-letter').click(function(){
    	
    	var thisLetter = $(this).parent().parent().parent();
    	var lwriter = thisLetter.find('.letter-from-mid').html();
    	var lwriterName = thisLetter.find('.letter-from-name').html();
    	var lwriterPic = thisLetter.find('.letter-from-pic').html();
    	
    	var con = confirm("이 편지에 답장하시겠습니까?");
    	if(con == true){
    		
    		$('#title').val("");
        	$('#content').val("");
            $('.letter-box-wrapper').css("display", "none");
            $('.letter-type-wrapper').fadeIn(200);
    		
            $('.letter-type.text').click(function () {
                $('.letter-type-wrapper').hide(10, function () {
                    $('.letter-write-wrapper').fadeIn(200);
                });
            });
            $('.letter-type.voice').click(function () {alert("음성편지 기능은 아직 준비중입니다.\ne-oot ver.2에서 만나요!(^o^)");});
            $('.letter-type.video').click(function () {alert("영상편지 기능은 아직 준비중입니다.\ne-oot ver.2에서 만나요!(^o^)");});
            
    		$('.letter-to-list-add').hide();
    		$('.reply-to-name').html(lwriterName);
    		$('.letter-reply-to').children('img').attr("src", lwriterPic);
    		$('.letter-reply-to').css("display", "block");
    		$('.letter-reply-to').hover(function(){
    			$('.reply-to-name').toggle();
    		});
    		
    		$('#letter-send').click(function () {
    		    if (($('#title').val() == ""))
    		        alert("제목을 입력해주세요.");
    		    else if (($('#content').val() == ""))
    		        alert("내용을 입력해주세요.");
    		    else {
    		    	var ltitle = $('textarea#title').val();
    		    	var lcontent = $('textarea#content').val().replace(/\n/g, "<br />");

    		    	$.ajax({
    	    			type:"post",
    	    			url:"replyLetterControl.jsp",
    	    			data:{
    	    				writer:lwriter,
    	    				title:ltitle,
    	    				content:lcontent
    	    			},
    	    			success:function(){
    	    				alert("답장전송!!!");
    	    				$('.letter-to-list-add').show();
    	    	    		$('.reply-to-name').html("");
    	    	    		$('.letter-reply-to').children('img').attr("src", "");
    	    	    		$('.letter-reply-to').css("display", "none");
    	    				$('.letter').fadeOut(200);
    	    			}
    		    	});	
    		    }
    	    });
    	}
    });
    
    /*===< 편지쓰기 >===*/
    $('#letter-write').click(function () {
    	$('#title').val("");
    	$('#content').val("");
        $('.letter-box-wrapper, .letter-write-wrapper, .letter-add-wrapper').css("display", "none");
        $('.letter, .letter-type-wrapper').fadeIn(200);
        
        if ($('.letter-write-box').height() >= 400)
            $('#content').attr("rows", "19");
        else
            $('#content').attr("rows", "17");

        $('.letter-type.text').click(function () {
            $('.letter-type-wrapper').hide(10, function () {
                $('.letter-write-wrapper').fadeIn(200);
            });
        });
        
        $('.letter-type.voice').click(function () {alert("음성편지 기능은 아직 준비중입니다.\ne-oot ver.2에서 만나요!(^o^)");});
        $('.letter-type.video').click(function () {alert("영상편지 기능은 아직 준비중입니다.\ne-oot ver.2에서 만나요!(^o^)");});

        $('.letter-to-list-add').click(function () {
            $('.letter-add-wrapper').slideToggle();
        });
        
        var readerLists = [];
        $('.letter-add-list').each(function(){
            $(this).children("img").click(function(){
            	
            	var reader = $(this).parent().find('.reader-mid').html();
            	//추가하려는 수신인의 mid

            	var lists = $('.letter-to-list-wrapper > .letter-add-list');
            	lists.each(function(){
            		if($(this).length != 0){
            			readerLists.push($(this).find('.reader-mid').html());
            		}
            	});
            	//추가되기 전 왼쪽에 이미 추가되어있는 mid의 목록

            	if(jQuery.inArray(reader, readerLists) == -1){
                	var clone = $(this).parent().clone().css("float", "left");
                    clone.append($('<div class="delete"></div>'));
                    clone.prependTo($('.added'));
                    
                    readerLists.push(clone.find('.reader-mid').html());
                    //추가된 후 
           
                    $('.delete').click(function () {
                        $(this).parent().remove();
                        var removeItem = $(this).parent().find('.reader-mid').html();
                        readerLists = jQuery.grep(readerLists, function(n){
                        	return n != removeItem;
                        });
                    });
                } else {
                	alert("이미 추가되어 있습니다");
                }
            });  
        });
        
        $('.delete').click(function () {
            $(this).parent().remove();
        });

        $('#letter-send').click(function(){
        	alert(readerLists);
        	if (readerLists.length == 0)
                alert("수신인을 한 명 이상 지정해야 합니다.");
        	else if (($('#title').val() == ""))
                alert("제목을 입력해주세요.");
        	else if (($('#content').val() == ""))
                alert("내용을 입력해주세요.");
            else {            	
            	var ltitle = $('textarea#title').val();
        		var lcontent = $('textarea#content').val().replace(/\n/g, "<br />");
        		
        		for(var i = 0; i < readerLists.length; i++){
        			$.ajax({
        				type:"post",
        				url:"writeLetterControl.jsp",
        				data:{
        					reader:readerLists[i],
        					title:ltitle,
        					content:lcontent
        				},
        				success:function(){
        					alert("편지전송!!!");
        					$('.added').empty();
        					$('.letter').fadeOut(200);
        				}
        	    	});	
        		}        	
            }
        });
    });

    /*===========< newsFeed >=============================================*/
    $('.alarm.news').click(function () {
    	$(this).unbind('click');
        var pushMain = $('.main').height() + $('.lower').height();
    	
        $('.main').animate({
        	'marginTop': -pushMain + 'px'
        }, 600, function(){
        	location.href="../newsFeed/newsFeed.jsp";
        });
    }); 	
})


