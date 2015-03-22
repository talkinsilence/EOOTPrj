<%@page import="com.eoot.eootprj.model.Letter"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String lcode = request.getParameter("lcode");
System.out.println("lcode : " + lcode);	

LetterDao letterDao = new MyBLetterDao();
Letter l = letterDao.getLetter(lcode);

pageContext.setAttribute("l", l);
%>

<div class="letter-view">
편지뷰뷰뷰뷰뷰뷰뷰뷰뷰
	<p>${l.title}</p>
	<p>${l.content}</p>
</div>
