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

    renderCalendar();

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
    		start.css("border-color","red");
    	}
    	
    	if(content.val() == ""){
    		content.css("border-color","");
    	}
    	
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
        
    	$("#datepickerStart").val("");
    	$("#datepickerEnd").val("");
        $("#calendar-content").val("");
    });
});


function renderCalendar() {
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
        //editable: true,
        eventLimit: true, // allow "more" link when too many events               
        events: "data.jsp",/*[{
            id: "1",
            title: '123123',
            start: '2015-02-01',
            end : null
        }],*//*[
            {
                id: 14,
                title: 'All Day Event',
                start: '2015-02-01'
            },
            {
                id: 31,
                title: 'Repeating Event',
                start: '2015-02-09T16:00:00'
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: '2015-02-16T16:00:00'
            },
            {
                id: 2,
                title: 'Conference',
                start: '2015-02-11',
                end: '2015-02-13'
            },
            {
                id: 1,
                title: 'Meeting',
                start: '2015-02-12T10:30:00',
                end: '2015-02-12T12:30:00'
            },
            {
                id: 'Choi',
                title: 'Lunch',
                start: '2015-02-12T12:00:00'
            },
            {
                id: 12,
                title: 'Meeting',
                start: '2015-02-12T14:30:00'
            },
            {
                id: 16,
                title: 'Happy Hour',
                start: '2015-02-12T17:30:00'
            },
            {
                id: 1563,
                title: 'Dinner',
                start: '2015-02-12T20:00:00'
            },
            {
                id: 1653,
                title: 'Birthday Party',
                start: '2015-02-13T07:00:00'
            },
            {
                id: 145,
                title: 'Click for Google',
                url: 'http://google.com/',
                start: '2015-02-28'
            }
        ]*/
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