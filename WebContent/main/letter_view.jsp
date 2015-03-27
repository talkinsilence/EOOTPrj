<%@page import="com.eoot.eootprj.model.Letter"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String code = "";
String _code = request.getParameter("code");
if(_code != null && !_code.equals(""))
	code = _code;

LetterDao letterDao = new MyBLetterDao();
letterDao.updateRead(code);
Letter l = letterDao.getLetter(code);

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
