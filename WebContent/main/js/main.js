$(document).ready(function () {

	/*=======< 가족 홈 페이지 - 상단 왼쪽 영역 >====================*/
	//유저 메뉴 버튼 클릭시 배경 처리 
   $('.user-menu-btn').click(function () {
       $('.user-menu-area').toggle();
   });
   
   $('.user-menu').click(function(){
      $(this).parent().hide();
   });
   
   $('.user-menu-wrapper-bg').click(function(){
      $(this).parent().hide();
   });
   
   //설정 페이지로 이동
   $('.user-menu.settings-main').click(function(){
      location.href="../settings/settings.jsp";
   });
   
   //로그아웃
   $('.user-menu.log-out-main').click(function(){
      var con = confirm("로그아웃 하시겠습니까?");
      if(con == true){
         alert("안녕히가세요~ o(^▽^)o");
         location.href="../logout.jsp";
      }
   });

   /*=======< 가족 홈 페이지 - 하단 오른쪽 영역 >=================*/
   //사진 미리보기 이미지 조정
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
   
    /*=======< 편지 >=============================================*/
    /*편지목록 조회*/
    //가족 홈 페이지 하단 왼쪽 영역 알람 클릭시 편지 영역 보이기
    $('.alarm.let').click(function () {
        $('.letter-view-wrapper, .letter-type-wrapper, .letter-write-wrapper, .letter-add-wrapper').css("display", "none");
        $('.letter, .letter-box-wrapper').fadeIn(200);
    });
    
    //편지 영역 닫기
    $('.btn-close, .letter-transp-bg').click(function () {
       location.reload();
        $('.letter').fadeOut(10);
    });
    
    $('.btn-close-letter-view, .letter-view-transp-bg').click(function () {
        $('.letter-view-wrapper').fadeOut(10);
    });
    
    /*편지목록 관리*/
    //편지목록 관리 버튼 보이기
    $('.letter-mani-area').mouseover(function(){
       $(this).find('.letter-mani-wrapper-bg, .letter-mani-wrapper, .letter-mani').css("display", "block");   
    });
    
    $('.letter-mani-area').mouseout(function(){
       $(this).find('.letter-mani-wrapper-bg, .letter-mani-wrapper, .letter-mani').css("display", "none");
    });
    
    //편지목록 삭제
    $('.letter-mani.delete-letter').click(function(){
       var lcnt = $('#lcnt'); //편지 개수
       var lcntVal = lcnt.html(); //편지 개수의 값

       var thisLetter = $(this).parent().parent().parent(); //선택한 편지
       var lcode = thisLetter.find('.letter-code').html(); //선택한 편지의 코드
       
       var con = confirm("이 편지를 삭제하시겠습니까?");
       if(con == true){
          $.ajax({ //ajax로 편지 삭제 처리
             type:"post",
             url:"deleteLetterControl.jsp",
             data:{
                code:lcode //deleteLetterControl.jsp로 해당 편지 코드 전송
             },
             success:function(){
                thisLetter.remove();
                alert("삭제되었습니다");
                lcnt.empty();
                lcnt.html(lcntVal - 1); //삭제 성공시 편지 개수 -1
             }
          });
       }
    });
    
    /*편지 검색*/
    //검색바 선택
    $('.letter-search').click(function(){
       $(this).select();
    });
    
    //검색버튼 클릭시 비동기 처리
    $('#letter-search').click(function(){
       var input = $(this).parent().find('.letter-search'); //검색어
       
       var lbox = $('.letter-item-box'); //편지 목록이 보이는 영역
       lbox.empty(); //편지 목록 비우기
       lbox.load("letter.jsp?query="+input.val()); //letter.jsp로 검색어 전송
    });

    /*편지내용 조회*/
    //제목 클릭시 편지내용 조회 비동기 처리
    $('.letter-title').click(function(){       
       var lvbox = $('.letter-view-box'); //편지내용 조회 영역
       lvbox.empty(); //편지내용 조회 영역 비우기
       
       var lcode = $(this).parent().find('.letter-code').html(); //선택한 편지의 코드
       lvbox.load("letter_view.jsp?code="+lcode, function(){ //letter_view.jsp로 해당 코드 전송 후 편지지 보이기
          $('.letter-view-wrapper').show();
       });
       $(this).css("color", "#000"); //읽은 편지의 제목 색 변경
    });
    
    /*답장하기*/
    $('.letter-mani.reply-letter').click(function(){
       
       var thisLetter = $(this).parent().parent().parent(); //답장할 편지
       var lwriter = thisLetter.find('.letter-from-mid').html(); //답장 발신인(=편지 수신인) 아이디
       var lwriterName = thisLetter.find('.letter-from-name').html(); //답장 발신인 이름
       var lwriterPic = thisLetter.find('.letter-from-pic').html(); //답장 발신인 프로필사진
       
       var con = confirm("이 편지에 답장하시겠습니까?");
       if(con == true){
          //편지 작성 초기화
          $('#title').val("");
          $('#content').val("");
          $('.letter-box-wrapper').css("display", "none");
          $('.letter-type-wrapper').fadeIn(200);
          
	      $('.letter-type.text').click(function () {
	        $('.letter-type-wrapper').hide(10, function () {
	           $('.letter-write-wrapper').fadeIn(200);
            });
	      });
          
	      //음성 및 영상편지 기능은 준비중
          $('.letter-type.voice').click(function () {alert("음성편지 기능은 아직 준비중입니다.\ne-oot ver.2에서 만나요!(^o^)");});
          $('.letter-type.video').click(function () {alert("영상편지 기능은 아직 준비중입니다.\ne-oot ver.2에서 만나요!(^o^)");});
            
          $('.letter-to-list-add').hide();
          $('#letter-send').hide();
          $('#letter-send-reply').show();
          $('.reply-to-name').html(lwriterName); //답장 수신인에 편지 작성인 이름 추가
          $('.letter-reply-to').children('img').attr("src", lwriterPic); //답장 수신인에 편지 작성인 프로필사진 추가
          $('.letter-reply-to').css("display", "block");
          $('.letter-reply-to').hover(function(){
             $('.reply-to-name').toggle();
          });
          
          $('#letter-send-reply').click(function () {
        	  //편지 작성폼 유효성 검사
              if (($('#title').val() == ""))
                  alert("제목을 입력해주세요.");
              else if (($('#content').val() == ""))
                  alert("내용을 입력해주세요.");
              else {
                 var ltitle = $('textarea#title').val();
                 var lcontent = $('textarea#content').val().replace(/\n/g, "<br />"); //줄바꿈 입력하여 편지내용에 반영하기

                 $.ajax({ //ajax로 편지 답장 처리
                    type:"post",
                    url:"replyLetterControl.jsp",
                    data:{
                       writer:lwriter,
                       title:ltitle,
                       content:lcontent
                    },
                    success:function(){
                       alert("답장이 전송되었습니다");
                       //닫기 및 초기화
                       $('.letter-to-list-add').show();
                       $('#letter-send').show();
                       $('#letter-send-reply').hide();
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
    	//작성폼 초기화
       $('#title').val("");
       $('#content').val("");
       $('#letter-send-reply').hide();
       $('#letter-send').show();
        $('.letter-box-wrapper, .letter-write-wrapper, .letter-add-wrapper').css("display", "none");
        $('.letter, .letter-type-wrapper').fadeIn(200);
        
        //편지지 크기 조정
        if ($('.letter-write-box').height() >= 400)
            $('#content').attr("rows", "19");
        else
            $('#content').attr("rows", "17");
        
        //편지 종류 선택
        $('.letter-type.text').click(function () {
            $('.letter-type-wrapper').hide(10, function () {
                $('.letter-write-wrapper').fadeIn(200);
            });
        });
        
        //음성 및 영상편지 기능은 준비중
        $('.letter-type.voice').click(function () {alert("음성편지 기능은 아직 준비중입니다.\ne-oot ver.2에서 만나요!(^o^)");});
        $('.letter-type.video').click(function () {alert("영상편지 기능은 아직 준비중입니다.\ne-oot ver.2에서 만나요!(^o^)");});
        
        //수신인 목록 추가 영역 열기
        $('.letter-to-list-add').click(function () {
            $('.letter-add-wrapper').slideToggle();
        });
        
        //추가할 수신인들의 목록을 담는 배열 생성
        var readerLists = []; 
        
        //수신인 프로필 사진 클릭할 때마다 배열에 추가됨
        $('.letter-add-list').each(function(){
            $(this).children("img").click(function(){
               
            	//추가하려는 수신인의 아이디
            	var reader = $(this).parent().find('.reader-mid').html();
               
            	//추가되기 전 이미 추가되어있는 수신인 아이디의 목록
                var lists = $('.letter-to-list-wrapper > .letter-add-list');
                lists.each(function(){
                   if($(this).length != 0){
                      readerLists.push($(this).find('.reader-mid').html());
                   }
                });
               
               //수신인 목록에 이미 추가되어있지 않을 경우
               if(jQuery.inArray(reader, readerLists) == -1){
                   var clone = $(this).parent().clone().css("float", "left"); //추가하려는 수신인의 clone 생성
                    clone.append($('<div class="delete"></div>')); //삭제버튼 추가
                    clone.prependTo($('.added')); //수신인 목록에 clone 추가 
                    
                    //추가된 후 
                    readerLists.push(clone.find('.reader-mid').html());
                    
                    //새로 추가한 수신인의 삭제버튼 클릭시
                    $('.delete').click(function () {
                        $(this).parent().remove();
                        var removeItem = $(this).parent().find('.reader-mid').html();
                        //수신인 목록에서 삭제하려는 수신인을 배열에서 제거하기
                        readerLists = jQuery.grep(readerLists, function(n){
                           return n != removeItem;
                        });
                    });
                } else {
                   alert("이미 추가되어 있습니다");
                }
            });  
        });
        
        //삭제버튼 클릭시
        $('.delete').click(function () {
            $(this).parent().remove();
        });

        //작성폼 유효성 검사
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
              var lcontent = $('textarea#content').val().replace(/\n/g, "<br />"); //줄바꿈 입력하여 편지내용에 반영하기
              
              for(var i = 0; i < readerLists.length; i++){
                 $.ajax({ //ajax로 편지 작성 처리
                    type:"post",
                    url:"writeLetterControl.jsp",
                    data:{
                       reader:readerLists[i],
                       title:ltitle,
                       content:lcontent
                    },
                    success:function(){
                       $('.added').empty();
                       $('.letter').fadeOut(200);
                    }
                 });
              }
              alert("편지가 전송되었습니다");
           }
        });
    });

    /*=======< 뉴스피드 >==========================================*/
    //가족 홈 페이지에서 뉴스피드로 이동시 슬라이딩 효과
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

