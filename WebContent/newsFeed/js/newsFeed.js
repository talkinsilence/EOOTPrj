$(document).ready(function () {
   
   /*===========< toolbar >========================*/
   var toolbar = $('#toolbar');
   
   $(window).scroll(function () {
       if (toolbar.offset().top !== 0) {
           if (!toolbar.hasClass('shadow')) {
               toolbar.addClass('shadow');
           }
       } else {
           toolbar.removeClass('shadow');
       }
   });
   
   $('.toolbar-opt').click(function () {
       $('.opt-area').toggle();
   });
   $('.opt').click(function(){
      $('.opt-area').hide();
   });
   $('.opt-wrapper-bg').click(function(){
      $('.opt-area').hide();
   });
   
   $('.user.log-out-toolbar').click(function(){
      var con = confirm("로그아웃 하시겠습니까?");
      if(con == true){
         alert("안녕히가세요~ o(^▽^)o");
         location.href="../logout.jsp";
      }
   });

   /*===========< post >========================*/
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
