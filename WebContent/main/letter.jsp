<%@page import="com.eoot.eootprj.model.LetterJoinMember"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String uid = (String) session.getAttribute("uid");

String query = "";
String _query = request.getParameter("query");
if(_query != null && !_query.equals(""))
	query = _query;

LetterDao letterDao = new MyBLetterDao();
List<LetterJoinMember> ls = letterDao.getLetters(uid, query);
pageContext.setAttribute("ls", ls);
%>

<script>	
$('#letter-items-back').click(function(){
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
		alert("letter.jsp에서클릭");
		$('.letter-view-wrapper').fadeIn(10);
	});
	$(this).css("color", "#000");
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
		</li>
	</c:forEach>
</ul>
