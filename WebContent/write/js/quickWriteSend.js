$(document).ready(function () {
	  $(".btn").click(function(){
		  var checked= '';
		  $("input:checkbox[name^=check]:checked").each(function(){
			  checked+=$(this).val();
		  });
		  if(checked==1){
			  var content =$("#textContent").contents().find("body").html();
			  var title =$("#textTop").contents().find("body").html();
			  var shareNei =1;
			  var shareVil = 0;
			     $.ajax({
			        type:"post",
			        url:"fanPostControl.jsp",
			        data: {
			        	  title : title
			              ,content : content
			              ,shareNei :shareNei
			              ,shareVil : shareVil
			              },
			        dataType : "json",
			        success:function(data){
			           alert("AA");	          
			        }
			     });
		  }
		  else if(checked==2){
			  var content =$("#textContent").contents().find("body").html();
			  var title =$("#textTop").contents().find("body").html();
			  var shareNei =1;
			  var shareVil = 1;
			  $.ajax({
			        type:"post",
			        url:"fanPostControl.jsp",
			        data: {
			        	  title : title
			              ,content : content
			              ,shareNei :shareNei
			              ,shareVil : shareVil
			              },
			        dataType : "json",
			        success:function(data){
			           alert("AA");	          
			        }
			     });
			     $.ajax({
			        type:"post",
			        url:"vilPostControl.jsp",
			        data: {
			        	  title : title
			              ,content : content
			              },
			        dataType : "json",
			        success:function(data){
			           alert("BB");			          
			        }
			     });
		  }
		  else {
			  var content =$("#textContent").contents().find("body").html();
			  var title =$("#textTop").contents().find("body").html();
			  var shareNei =0;
			  var shareVil = 0;
			 /* alert(title);
			  alert(content);*/
			     $.ajax({
			        type:"post",
			        url:"fanPostControl.jsp",
			        data: {
			        	  title : title
			              ,content : content
			              ,shareNei :shareNei
			              ,shareVil : shareVil
			              },
			        dataType : "json",
			        success:function(data){
			           alert("AA");	          
			        }
			     });
		  }
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