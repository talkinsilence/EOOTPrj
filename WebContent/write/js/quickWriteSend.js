/*$(".btn").click(function(){
	    var content =$(".contents").val();
	    var title =$(".writeSearch").val;
	    var src = $();
	     $.ajax({
	        type:"post",
	        url:"famPostControl.jsp",
	        data: { famPostCode : dvImgCode
	        	  ,title : tltle
	              ,content : content 
	              ,src:src
	              },
	        dataType : "json",
	        success:function(data){
	           alert("AA");
	        }
	     });
});*/

$(document).ready(function () {
	  $(".btn").click(function(){
		/*  var com_uid_checkbox = '';
		  $("input:checkbox[name^=check]:checked").each(function(){
		  	com_uid_checkbox+=$(this).val();
		  });*/
		  var content =$("#textContent").contents().find("body").html();
		  var title =$("#textTop").contents().find("body").html();
		 /* alert(title);
		  alert(content);*/
		     $.ajax({
		        type:"post",
		        url:"postControl.jsp",
		        data: {
		        	  title : title
		              ,content : content
		              },
		        dataType : "json",
		        success:function(data){
		           alert("AA");
		        }
		     });
		     /*alert(com_uid_checkbox );*/
	   });
	 
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {                 
              $('#img').attr('src', e.target.result);                                
          }
          reader.readAsDataURL(input.files[0]);          
      }
  }
  $("#imgInp").change(function () {
      readURL(this);
  });
});  