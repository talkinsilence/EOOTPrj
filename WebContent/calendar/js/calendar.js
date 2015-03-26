var currentMousePos = {
    x: -1,
    y: -1
};

$(document).ready(function () {
	
    $(document).on("mousemove", function (event) {
        currentMousePos.x = event.pageX;
        currentMousePos.y = event.pageY;

        var trashEl = $('#calendarTrash');

        if (isElemOverDiv()) {

            if (!trashEl.hasClass("to-trash")) {
                trashEl.addClass("to-trash");
            }
        } else {
            if (trashEl.hasClass("to-trash")) {
                trashEl.removeClass("to-trash");
            }
        }
    });
    
    calData();
    
    $("#datepickerStart").datepicker({
        dateFormat: 'yy-mm-dd'
    });
    
    $("#datepickerEnd").datepicker({
        dateFormat: 'yy-mm-dd'
    });

    $("#calendarWrite").click(function () {
        $("#calendar-write-body").fadeIn(200);
    });

    // 버튼 클릭시 처리

    $('#btn-calendar-write').mousedown(function () {
        $(this).css("background", '#2457BD');
    }).mouseout(function () {
        $(this).css("background", "#427fed");
    });
    
    $('#btn-calendar-write').click(function(){
    	var start = $("#datepickerStart");
    	var content = $("#calendar-content");
    	
    	
    	if(start.val() == ""){
    		start.css("border-color","#FFA2A2");
    	} else 
    		start.css("border-color","#a9a9a9");
    		
    	
    	if(content.val() == ""){
    		content.css("border-color","#FFA2A2");
    	} else
    		content.css("border-color","#a9a9a9");
    	
    	if(start.val() != "" && content.val() != ""){
    		$("#calForm").submit();
    	}
    		
    });
    
    $('#btn-calendar-cancel').mousedown(function () {
        $(this).css("background", '#3b3b3b');
    }).mouseout(function () {
        $(this).css("background", "#808080");
    });
    $('#btn-calendar-cancel').click(function () {
    	$("#calendar-write-body").fadeOut(200);
        
    	reset();
    });
});

function reset(){
	var start = $("#datepickerStart");
	var end = $("#datepickerEnd");
	var content = $("#calendar-content");
	
	start.css("border-color","#a9a9a9");
	end.css("border-color","#a9a9a9");
	content.css("border-color","#a9a9a9");
	start.val("");
	end.val("");
    content.val("");
}

function calData(){
	var data;
	
	$.ajax({
		url:"data.jsp",
		data: {
			
		},
		success:function(data){
			data = eval(data);
			
			renderCalendar(data);
		}
	});
}

function renderCalendar(data) {
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        lang: 'ko',
        buttonIcons: false, // show the prev/next text
        weekNumbers: true,
        selectable: true,
        eventDragStop: function (event, jsEvent, ui, view) {
            if (isElemOverDiv()) {
            	deleteCal(event.id);
                $('#calendar').fullCalendar('removeEvents', event.id);
                
                var trashEl = $('#calendarTrash');

                if (trashEl.hasClass("to-trash")) {
                    trashEl.removeClass("to-trash");
                }
            } else {
                console.log("not in trash");
            }
        },
        //loading: function (bool) {
        //    if (!bool) {
        //        $('.fc-left').prependTo('<div id="calendarTrash" class="calendar-trash"><img src="/images/cal-trash.png"></img></div>');
        //    }
        //},
        editable: true,
        eventLimit: true, // allow "more" link when too many events               
        events: data
    });
}

//check if cursor is in trash 
function isElemOverDiv() {
    var trashEl = $('#calendarTrash');

    var ofs = trashEl.offset();

    var x1 = ofs.left;
    var x2 = ofs.left + trashEl.outerWidth(true);
    var y1 = ofs.top;
    var y2 = ofs.top + trashEl.outerHeight(true);

    if (currentMousePos.x >= x1 && currentMousePos.x <= x2 && currentMousePos.y >= y1 && currentMousePos.y <= y2) {
        return true;
    }
    return false;
}

function deleteCal(eventId){
	$.ajax({
		type:"post",
		url:"deleteCalProc.jsp",
		data:{
			code: eventId
		},
		seccess:function(){
			alert("dd");
		}
	})
}