<%-- <%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@page import="com.eoot.eootprj.model.Letter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String data = "";
	String code = request.getParameter("code");
	System.out.println(code);
	
	LetterDao letterDao = new MyBLetterDao();
	letterDao.delete(code);
%> --%>