

$(document).ready(function () {
    var profileThum = $("#profile-pic-box-main");
    var myhomeThum = $("#myhome-profilebgc-box-main");
    var btnUploadSet = $("#btn-upload-set");
    var element_wrap = document.getElementById("myhome-address-search-wrapper");
    
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

    $('#accordion input[type="button"].btn-cancel').mousedown(function () {
    	$(this).css("background", '#5D5D5D');
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
    btnUploadSet.click(function(){
    	var file = $("#profile-edit-file");
    	
    	if(file.val() == ""){
    		alert("사진을 선택해주세요");
    	} else
    		$("#formProfile").submit();
    });
    
    
    $("#btn-upload-cancel").click(function () {
    	$('#profile-edit-thumbnail').attr('src', '');
        $('#profile-edit').fadeOut(400);
    });
    
    // 우리집
    myhomeThum.mouseover(function(){
    	myhomeThum.css("opacity","0.3");
    });
    myhomeThum.mouseout(function(){
    	myhomeThum.css("opacity","1");
    });
    myhomeThum.click(function(){
    	$("#myhome-edit").fadeIn(300);
    });
    
    $("#btn-myhome-upload-select").click(function () {
        $("#myhome-edit-file").trigger("click");
    });
    
    $("#btn-myhome-upload-set").click(function(){
    	var file = $("#myhome-edit-file");
    	
    	if(file.val() == "")
    		alert("사진을 선택해주세요");
    	else
    		$("#formMyhome").submit();
    });
    
    $("#btn-myhome-upload-cancel").click(function(){
    	$('#myhome-edit-thumbnail').attr('src', '');
    	$("#myhome-edit").fadeOut(400);
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
    
    /*$('#btn-name-cancel').mousedown(function () {
        $(this).css("background", '#5D5D5D');
    }).mouseout(function () {
        $(this).css("background", "#808080");
    })*/
    $('#btn-name-cancel').mousedown(function () {
    	$(this).css("background", '#5D5D5D');
    }).mouseout(function () {
    	$(this).css("background", "#808080");
    });
    $('#btn-name-cancel').click(function(){
    	$("#profile-name-wrapper").css("display", "none");
        $("#profile-name-edit").css("display", "inline");
    });

    /////////////////////////////// accordion ///////////////////////////////  

    
    /////////////////////// 우리집 /////////////////////////
    // 가족 초대 영역
    
    // 이름
    $('#myhome-name-edit').click(function () {
        $("#myhome-name-wrapper").css("display", "inline-block");
        $("#myhome-name-edit").css("display", "none");
    });
    
    $("#btn-myhome-name").mousedown(function () {
        $(this).css("background", '#2457BD');
    }).mouseout(function () {
        $(this).css("background", "#427fed");
    });

    $("#btn-myhome-name").click(function () {
    	updateFamname();
    	
        $("#myhome-name-wrapper").css("display", "none");
        $("#myhome-name-edit").css("display", "inline");
    });
    
    /*$('#btn-homename-cancel').mousedown(function () {
        $(this).css("background", '#5D5D5D');
    }).mouseout(function () {
        $(this).css("background", "#808080");
    })*/
    $('#btn-homename-cancel').click(function(){
    	$("#myhome-name-wrapper").css("display", "none");
        $("#myhome-name-edit").css("display", "inline");
    });

    // 주소 
    $('#myhome-address-edit').click(function () {
        $('#myhome-address-wrapper').css('display', 'block');
        $('#myhome-address-edit').css('display', 'none');
    });

    $("#myhome-address-txt").click(function(){
    	sample3_execDaumPostcode();
    });
    
    /*$("#btn-myhome-address").mousedown(function () {
        $(this).css("background", '#2457BD');
    }).mouseout(function () {
        $(this).css("background", "#427fed");
    });*/
    
    $("#btn-myhome-address").click(function(){
    	updateAddress();
    	
    	$("#myhome-address-search-wrapper").css("display","none");
        $('#myhome-address-wrapper').css('display', 'none');
        $('#myhome-address-edit').css('display', 'inline-block');
    });
    
    /*$('#btn-address-cancel').mousedown(function () {
        $(this).css("background", '#5D5D5D');
    }).mouseout(function () {
        $(this).css("background", "#EAEAEA");
    })*/
    $('#btn-address-cancel').click(function () {
    	$("#myhome-address-search-wrapper").css("display","none");
    	$("#myhome-address-txt").val("");
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
    $("#btn-member-inv").click(function(){
    	var acceptmid = $("#myhome-member-mng-txt").val();
    	$("#myhome-member-mng-inv-view").load("insertFamInvProc.jsp?acceptmid="+acceptmid);
    	$("#myhome-member-mng-txt").val("");
    });
    
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
    
    $("#myhome-background-edit").click(function(){
    	var wrapper = $("#myhome-background-edit");
    	
    	if(wrapper.text() == "설정"){
    		$("#myhome-background-wrapper").css("display", "block");
    		wrapper.text("닫기");
    	} else if(wrapper.text() == "닫기"){
    		$("#myhome-background-wrapper").css("display", "none");
    		wrapper.text("설정");
    	}
    });
    
    // 배경화면
    $("#btn-myhome-upload-select").click(function () {
        $("#myhome-background-file").trigger("click");
    });
    $("#btn-myhome-upload-set").mouseover(function () {
    	$("#btn-myhome-upload-set").css("background", "#0054FF");
    });
    $("#btn-myhome-upload-set").mouseout(function () {
    	$("#btn-myhome-upload-set").css("background", "#3079ed");
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
    
    $("#btn-eoot-member-inv").click(function(){
    	var acceptmid = $("#eoot-member-mng-txt").val();
    	
    	$("#eoot-with-add-view").load("insertNeiInvProc.jsp?acceptmid="+acceptmid);
    	$("#eoot-member-mng-txt").val("");
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
    
    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 및 영문주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample3_postcode1').value = data.postcode1;
                //document.getElementById('sample3_postcode2').value = data.postcode2;
                document.getElementById('myhome-address-txt').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+"px";
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
});

function updateName(){
	$.ajax({
		type:"post",
		url:"updateNameProc.jsp",
		data: {
			nametxt:$('#profile-name-txt').val()
		},
		success:function(data){
			if($.trim(data) != ""){
				$("#profile-name-val").text($.trim(data));
			}
		}
	});
}

function updateFamname(){
	$.ajax({
		type:"post",
		url:"updateFamnameProc.jsp",
		data:{
			famnametxt:$("#myhome-name-txt").val()
		},
		success:function(data){
			if($.trim(data) != ""){
				$("#profile-myhome-name-val").text($.trim(data));
				$("#profile-famname-val").text($.trim(data));
			}
		}
	});
}

function updateAddress(){
	$.ajax({
		type:"post",
		url:"updateAddressProc.jsp",
		data:{
			addresstxt:$("#myhome-address-txt").val()
		},
		success:function(data){
			if($.trim(data) != ""){
				$("#profile-address-val").text($.trim(data));
				$("#profile-myhome-address-val").text($.trim(data));
			}
		}
	});
}

function famInvMeReject(askmid){
	$(location).attr("href","deleteFamInvProc.jsp?askmid="+askmid);
}

function famInvMeAccept(askmid){
	var check = confirm("정말 수락하시겠습니까?");
	
	if(check)
		$(location).attr("href","updateFamAcceptProc.jsp?askmid="+askmid);
}

function profileReadURL(input) {
	isCheck = false;
    filename    = $("#profile-edit-file").val();
    file_len    = filename.length;
    file_gubun  = filename.substr(file_len - 3, file_len);

    if (file_gubun.toLowerCase() == "jpg" || file_gubun.toLowerCase() == "gif")
    {
        isCheck = true;
    }
    if (isCheck == false)
    {
        alert("확장자가 jpg, gif 인 파일만 업로드가 가능합니다.");
        
        return false;
    }
    else
    {
    	if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#profile-edit-thumbnail').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    	
        return true;
    }
	
}

function myHomeReadURL(input) {
	isCheck = false;
    filename    = $("#myhome-edit-file").val();
    file_len    = filename.length;
    file_gubun  = filename.substr(file_len - 3, file_len);

    if (file_gubun.toLowerCase() == "jpg" || file_gubun.toLowerCase() == "gif")
    {
        isCheck = true;
    }
    if (isCheck == false)
    {
        alert("확장자가 jpg, gif 인 파일만 업로드가 가능합니다.");
        
        return false;
    }
    else
    {
    	if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#myhome-edit-thumbnail').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    	
        return true;
    }
}
