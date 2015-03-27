$(document).ready(function(){
	
/*var villageBoardListWrapper = $('.village-board-list-wrapper');
	
villageBoardListWrapper.load("villageBoardList.jsp");*/

var content;

$(".post-input-button").click(function(){
       content = $(".post-input-text").val();
       //alert(content);
       var vilPostCode = $(".vil-post-code").html();
       //alert(vilPostCode);
        $.ajax({
           type:"post",
           url:"updateCommentProc.jsp",
           data: { vilPostCode : vilPostCode
                 , content : content
                 },
           dataType : "json",
           success:function(data){
              location.reload();
              /*villageBoardListWrapper.load("villageBoardList.jsp");*/
           }
        });
    });
});

