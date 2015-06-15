$(document).ready(function () {
   
   /*===========< 뉴스피드 툴바 >========================*/
   var toolbar = $('#toolbar');
   
   //스크롤시 그림자 효과
   $(window).scroll(function () {
       if (toolbar.offset().top !== 0) {
           if (!toolbar.hasClass('shadow')) {
               toolbar.addClass('shadow');
           }
       } else {
           toolbar.removeClass('shadow');
       }
   });
   
   //뉴스피드 옵션 클릭시 배경 처리
   $('.toolbar-opt').click(function () {
       $('.opt-area').toggle();
   });
   
   $('.opt').click(function(){
      $('.opt-area').hide();
   });
   
   $('.opt-wrapper-bg').click(function(){
      $('.opt-area').hide();
   });
   
   //로그아웃
   $('.user.log-out-toolbar').click(function(){
      var con = confirm("로그아웃 하시겠습니까?");
      if(con == true){
         alert("안녕히가세요~ o(^▽^)o");
         location.href="../logout.jsp";
      }
   });

   /*===========< 개별 포스트 >==========================*/
   //개별 포스트 관리 메뉴 보이기
   $('.post-header-wrapper').mouseover(function(){
      $(this).find('.post-user-menu-btn').show();
   });
   
   $('.post-header-wrapper').mouseout(function(){
      $(this).find('.post-user-menu-btn').hide();
   });
   
   $('.post-user-menu-btn').click(function () {
       $(this).parent().find('.post-user-menu-area').toggle();
   });
   
   $('.post-user-menu').click(function(){
      $('.post-user-menu-area').hide();
   });
   
   $('.post-user-menu-wrapper-bg').click(function(){
      $('.post-user-menu-area').hide();
   });
})
