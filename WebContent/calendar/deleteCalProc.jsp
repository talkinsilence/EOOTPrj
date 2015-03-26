<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamCalendarDao"%>
<%@page import="com.eoot.eootprj.dao.FamCalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("code");
	
	FamCalendarDao calDao = new MyBFamCalendarDao();
	
	calDao.deleteCal(code);
%>