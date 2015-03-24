<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamInvitationDao"%>
<%@page import="com.eoot.eootprj.dao.FamInvitationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String acceptmid = request.getParameter("fc");
	String uid = "viovio@eoot.com";
	
	FamInvitationDao faminvDao = new MyBFamInvitationDao();
	
	faminvDao.deleteInv(uid, acceptmid);
	
	response.sendRedirect("settings.jsp");
%>
