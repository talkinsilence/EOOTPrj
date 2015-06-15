<%@page import="com.eoot.eootprj.model.LetterJoinMember"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String uid = (String) session.getAttribute("uid"); //로그인한 회원의 아이디

String query = ""; //검색어
String _query = request.getParameter("query"); //검색어 임시변수
if(_query != null && !_query.equals("")) //검색어 유효성 검사
	query = _query;

LetterDao letterDao = new MyBLetterDao(); //LetterDao 객체 생성
List<LetterJoinMember> ls = letterDao.getLetters(uid, query); //수신인이 로그인한 회원과 일치하며, 해당 검색어가 제목 또는 내용에 포함된 편지 목록 조회
pageContext.setAttribute("ls", ls);
%>

<script>	
$('#letter-items-back').click(function(){ //전체목록으로 돌아가기
	$('.letter-items-none').css("display", "none");
	$('.letter-search').val("");
	$('#letter-search').click();
});

if($('.letter-search').val() == "")
	$('#letter-items-back').css("display", "none");
	
$('.letter-title').click(function(){
	var lvbox = $('.letter-view-box');
	lvbox.empty();
	
	var lcode = $(this).parent().find('.letter-code').html();
	lvbox.load("letter_view.jsp?code="+lcode, function(){
		$('.letter-view-wrapper').fadeIn(10);
	});
	$(this).css("color", "#000");
});

/*편지목록 관리*/
//편지목록 관리 버튼 보이기
$('.letter-mani-area').mouseover(function(){
	$(this).find('.letter-mani-wrapper-bg, .letter-mani-wrapper, .letter-mani').css("display", "block");   
});

$('.letter-mani-area').mouseout(function(){
	$(this).find('.letter-mani-wrapper-bg, .letter-mani-wrapper, .letter-mani').css("display", "none");
});

//편지목록 삭제
$('.letter-mani.delete-letter').click(function(){
	var lcnt = $('#lcnt'); //편지 개수
	var lcntVal = lcnt.html(); //편지 개수의 값

	var thisLetter = $(this).parent().parent().parent(); //선택한 편지
	var lcode = thisLetter.find('.letter-code').html(); //선택한 편지의 코드
	
	var con = confirm("이 편지를 삭제하시겠습니까?");
	if(con == true){
		$.ajax({ //ajax로 편지 삭제 처리
			type:"post",
			url:"deleteLetterControl.jsp",
			data:{
				code:lcode //deleteLetterControl.jsp로 해당 편지 코드 전송
			},
			success:function(){
				thisLetter.remove();
				alert("삭제되었습니다");
				lcnt.empty();
				lcnt.html(lcntVal - 1); //삭제 성공시 편지 개수 -1
			}
		});
	}
});
</script>

<c:if test="${empty ls}">
	<p class="letter-items-none">검색 결과가 없습니다</p>
</c:if>
<button id="letter-items-back">전체 목록으로 돌아가기</button>
<ul class="letter-items">
	<c:forEach var="i" items="${ls}" >
		<c:if test="${i.read == 1}">
		<li class="letter-item">
		</c:if>
		<c:if test="${i.read == 0}">
		<li class="letter-item red">
		</c:if>
			<div class="letter-code hidden">${i.code}</div>
		    <div class="letter-read hidden">${i.read}</div>
			<div class="letter-title">${i.title}</div>
			<div class="letter-from">from: ${i.name}</div>
			<div class="letter-date"><fmt:formatDate value="${i.sendDate}" pattern="yyyy년 MM월 dd일 " /></div>
			<div class="letter-mani-area">
                <div class="letter-mani-wrapper-bg"></div>
                <div class="letter-mani-wrapper">
	             	<div class="letter-mani reply-letter"></div>
	             	<div class="letter-mani delete-letter"></div>
            	</div>
           	</div>			
		</li>
	</c:forEach>
</ul>
