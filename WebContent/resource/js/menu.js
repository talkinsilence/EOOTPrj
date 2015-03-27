$(document).ready(function () {

    // 메뉴 슬라이드 효과
    $("#menu1 #menu_button").click(function () {
        $("#menu1").animate({ left: '-70px' });
        $("#menu2").animate({ left: '0px' });
    });
    $("#menu2 #menu_button").click(function () {
        $("#menu2").animate({ left: '-200px' });
        $("#menu1").animate({ left: '0px' });
    });

    $("#menu1-eoot").click(function () {
        $("#menu1").animate({ left: '-70px' });
        $("#menu3").animate({ left: '0px' });
    });
    $("#menu3 #menu_button").click(function () {
        $("#menu3").animate({ left: '-200px' });
        $("#menu1").animate({ left: '0px' });
    });
    
    $("#btn-write").click(function(){
    	$(location).attr("href", "../write/quickWrite.jsp");
    });
    
    //마우스 롤오버, 아웃 효과
    $(".button").mouseover(function () {
        $(this).css("background", "#fff");
    });
    $(".button").mouseout(function () {
        $(this).css("background", "#404148");
    });


    // 하위 메뉴 클릭시 페이지 이동
    $("#menu1-myhome").click(function () {
        $(location).attr("href", "../main/main.jsp");
    });
    
    $("#menu1-village").click(function(){
    	$(location).attr("href", "../village/villageIndex.jsp");
    });
    
    $("#menu2-calendar").click(function () {
        $(location).attr("href", "../calendar/calendar.jsp");
    });

    $("#menu2-album").click(function () {
        $(location).attr("href", "../famPost/famPost.jsp");
    });

    $("#menu2-setting").click(function () {
        $(location).attr("href", "../settings/settings.jsp");
    });
    
    $("#img-scrapped").click(function (){
    	alert("준비중 입니다 ^^");
    });
});

function eootLink(eid){
	$(location).attr("href","../main/main_e.jsp?eid="+eid);
}