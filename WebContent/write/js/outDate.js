var now = new Date();
var week = new Array('일', '월', '화', '수', '목', '금', '토');
document.write(now.getFullYear() + '년');
document.write('<br/>' + now.getUTCMonth() + '월');
document.write('&nbsp;' + now.getUTCDate() + '일');
document.write('&nbsp;' + week[now.getDay()] + '요일' + '<br />');