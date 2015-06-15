<%@page import="com.eoot.eootprj.model.Letter"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String code = ""; //편지코드
String _code = request.getParameter("code"); //편지코드 임시변수
if(_code != null && !_code.equals("")) //편지코드 유효성 검사
	code = _code;

LetterDao letterDao = new MyBLetterDao(); //LetterDao 객체 생성
letterDao.updateRead(code); //편지읽음 처리
Letter l = letterDao.getLetter(code); //편지내용 조회

pageContext.setAttribute("l", l);
%>

<div class="letter-view">
	<div class="letter-view-title">
		<p>${l.title}</p>
	</div>
	<div class="letter-view-content">
		<p>${l.content}</p>
	</div>
	<img class="letter-img01" src="images/balloon.png" />
</div>
