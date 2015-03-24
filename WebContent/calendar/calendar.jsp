<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리 함께 | e - oot</title>
<link href="../resource/css/reset.css" rel="stylesheet">
<script src="../resource/js/jquery-2.1.3.js"></script>
<script src="../resource/js/modernizr.js" type="text/javascript"></script>
<link href="../resource/css/bind_menu.css" rel="stylesheet" type="text/css">
<script src="../resource/js/menu.js"></script>
<script src="js/calendar.js" type="text/javascript"></script>
<link href='css/bind_calendar.css' rel='stylesheet' />

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<link href='css/fullcalendar.css' rel='stylesheet' />
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='js/moment.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script src='js/ko.js'></script>
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../resource/inc/menu.jsp"></jsp:include>

	<main id="main">
        <h1 class="hidden">달 력</h1>
        <div id="content-wrapper">         
            <div id="calendar-vertical1">
                <div id="calendar-vertical2">
                    <div id="calendar-body">
                        <div>
                            <div id="calendarWrite">
                                <img src="images/cal-write2.png" />
                            </div>
                            <div id="calendarTrash" class="calendar-trash">
                                <img src="images/cal-trash.png" />
                            </div>
                        </div>

                        <div id="calendar-write-body">
                            <div class="calendar-wrapper">
                                날짜 : <input type="text" id="datepicker" readonly="readonly" />
                            </div>
                            <div class="calendar-wrapper">
                                내용 : 
                                <textarea id="calendar-content" rows="8"></textarea>
                            </div>
                            <div id="calendar-btn-wrapper">
                                <input type="button" id="btn-calendar-write" value="작성"/>
                                <input type="button" id="btn-calendar-cancel" value="취소" />
                            </div>
                        </div>

                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>