$(document).ready(function () {
    var profileThum = $("#profile-thumbnail");
    var btnUploadSet = $("#btn-upload-set");

    $(function () {
        $("#accordion").accordion({
            heightStyle: "content"
        });
    });

    // 공통으로 처리해야 할 부분
    $('.edit').hover(function () {
        $(this).css("text-decoration", "underline");
    },function () {
        $(this).css("text-decoration", "none");
    });
    $('.view').hover(function () {
        $(this).css("text-decoration", "underline");
    },function () {
        $(this).css("text-decoration", "none");
    });

    $('#accordion input[type="button"]').mousedown(function () {
        $(this).css("background", '#2457BD');
    }).mouseout(function () {
        $(this).css("background", "#427fed");
    });

    $('input[type="button"].btn-cancel').mousedown(function () {
        $(this).css("background", '#3b3b3b');
    }).mouseout(function () {
        $(this).css("background", "#808080");
    });


    // 프로필 사진
    profileThum.mouseover(function () {
        profileThum.css("opacity", "0.3");
    });
    profileThum.mouseout(function () {
        profileThum.css("opacity", "1");
    });
    profileThum.click(function () {
        $('#profile-edit').fadeIn(300);
    });

    $("#btn-upload-select").click(function () {
        $("#profile-edit-file").trigger("click");
    });
    btnUploadSet.mouseover(function () {
        btnUploadSet.css("background", "#0054FF");
    });
    btnUploadSet.mouseout(function () {
        btnUploadSet.css("background", "#3079ed");
    });
    $("#btn-upload-cancel").click(function () {
        $('#profile-edit').fadeOut(400);
    });

    // 프로필
    $('#profile-name-edit').click(function () {
        $("#profile-name-wrapper").css("display", "inline-block");
        $("#profile-name-edit").css("display", "none");
    });

    $('#btn-profile-name').mousedown(function () {
        $(this).css("background", '#2457BD');
    }).mouseout(function () {
        $(this).css("background", "#427fed");
    });

    $("#btn-profile-name").click(function () {
    	updateName();
    	
        $("#profile-name-wrapper").css("display", "none");
        $("#profile-name-edit").css("display", "inline");
        
    });
    
    $('#btn-name-cancel').click(function(){
    	$("#profile-name-wrapper").css("display", "none");
        $("#profile-name-edit").css("display", "inline");
    });

    /////////////////////////////// accordion ///////////////////////////////  

    
    /////////////////////// 우리집 /////////////////////////
    // 이름
    $('#myhome-name-edit').click(function () {
        $("#myhome-name-wrapper").css("display", "inline-block");
        $("#myhome-name-edit").css("display", "none");
    });

    $("#btn-myhome-name").click(function () {       
        $("#myhome-name-wrapper").css("display", "none");
        $("#myhome-name-edit").css("display", "inline");
    });
    
    $('#btn-homename-cancel').click(function(){
    	$("#myhome-name-wrapper").css("display", "none");
        $("#myhome-name-edit").css("display", "inline");
    });

    // 주소 
    $('#myhome-address-edit').click(function () {
        $('#myhome-address-wrapper').css('display', 'block');
        $('#myhome-address-edit').css('display', 'none');
    });

    $('#btn-address-cancel').click(function () {
        $('#myhome-address-wrapper').css('display', 'none');
        $('#myhome-address-edit').css('display', 'inline-block');
    });

    // 구성원
    $('#myhome-member-view').click(function () {
        var view = $("#myhome-member-view");
        
        if (view.text() == "자세히 보기") {
            $('#myhome-member-view-wrapper').css("display", "block");
            view.text("닫기");
        } else if (view.text() == "닫기") {
            $('#myhome-member-view-wrapper').css("display", "none");
            view.text("자세히 보기");
        }        
    });

    // 구성원 관리
    $('#myhome-member-mng-view').click(function () {
        var view = $("#myhome-member-mng-view");

        if (view.text() == "자세히 보기") {
            $('#myhome-member-mng-wrapper').css("display", "block");
            view.text("닫기");
        } else if (view.text() == "닫기") {
            $('#myhome-member-mng-wrapper').css("display", "none");
            view.text("자세히 보기");
        }
    });

    ///////////////////// 이웃 ////////////////////////

    // 목록

    $("#eoot-member-view").click(function () {
        var view = $("#eoot-member-view");

        if (view.text() == "자세히 보기") {
            $("#eoot-member-view-wrapper").css("display", "block");
            view.text("닫기");
        } else if (view.text() == "닫기") {
            $("#eoot-member-view-wrapper").css("display", "none");
            view.text("자세히 보기");
        }
    });

    // 이웃맺기

    $("#eoot-with-view").click(function () {
        var view = $("#eoot-with-view");

        if (view.text() == "자세히 보기") {
            $("#eoot-with-view-wrapper").css("display", "block");
            view.text("닫기");
        } else if (view.text() == "닫기") {
            $("#eoot-with-view-wrapper").css("display", "none");
            view.text("자세히 보기");
        }
    });

    $("input:radio[name='eoot-with-request']").click(function () {
        var radio = $("input:radio[name='eoot-with-request']:checked");
        
        if (radio.val() == "get") {
            $("#eoot-with-get-view").css("display", "block");
            $("#eoot-with-add-view").css("display", "none");
        } else if (radio.val() == "add") {
            $("#eoot-with-add-view").css("display", "block");
            $("#eoot-with-get-view").css("display", "none");
        }
    });

    ///////////////////// 마을 ////////////////////////

    // 거리 옵션

    $("input:radio[name='vil-scope']").click(function () {
        var radio = $("input:radio[name='vil-scope']:checked");
        
        if (radio.val() == "meter") {
            $("#meter-opt").css("visibility", "visible");
        } else if (radio.val() == "dong") {
            $("#meter-opt").css("visibility", "hidden");
        }
    });
    
});

function updateName(){
	$.ajax({
		type:"post",
		url:"updateNameProc.jsp",
		data: {
			nametxt:$('#profile-name-txt').val()
		},
		success:function(data){
			//$("#dd").load('updateNameProc.jsp', data);
		}
	});
}
