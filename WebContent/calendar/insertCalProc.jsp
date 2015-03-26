<%@page import="com.eoot.eootprj.model.FamCalendar"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamCalendarDao"%>
<%@page import="com.eoot.eootprj.dao.FamCalendarDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = (String) session.getAttribute("uid");
	String startDate = request.getParameter("datepickerStart");
	String endDate = request.getParameter("datepickerEnd");
	String content = request.getParameter("calendar-content");
	
	MemberDao memberDao = new MyBMemberDao();
	
	Member m = memberDao.getMember(uid);
	String famcode = m.getFamcode();
	
	FamCalendar famCal = new FamCalendar();
	
	famCal.setWriter(uid);
	famCal.setStartdate(startDate);
	famCal.setEnddate(endDate);
	famCal.setTitle(content);
	famCal.setFamcode(famcode);
	
	FamCalendarDao calDao = new MyBFamCalendarDao();
	
	calDao.insertCal(famCal);
	
	response.sendRedirect("calendar.jsp");
%>
