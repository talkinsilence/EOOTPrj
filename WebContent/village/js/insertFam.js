$(document).ready(function(){
	
/*var villageBoardListWrapper = $('.village-board-list-wrapper');
	
villageBoardListWrapper.load("villageBoardList.jsp");*/

var content;

$(".post-input-button").click(function(){
       content = $(".post-input-text").val();
       alert(content);
       var famPostCode = $(".vil-post-code").html();
       alert(famPostCode);
        $.ajax({
           type:"post",
           url:"updateFamCommentProc.jsp",
           data: { famPostCode : famPostCode
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

