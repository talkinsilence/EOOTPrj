<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamInvitationDao"%>
<%@page import="com.eoot.eootprj.dao.FamInvitationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String askmid = request.getParameter("askmid");
	String uid = (String) session.getAttribute("uid");
	
	FamInvitationDao faminvDao = new MyBFamInvitationDao();
	
	faminvDao.deleteInv(askmid, uid);
	
	response.sendRedirect("settings.jsp");
%>
