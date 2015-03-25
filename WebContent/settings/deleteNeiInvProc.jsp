<%@page import="com.eoot.eootprj.dao.mybatis.MyBNeighborDao"%>
<%@page import="com.eoot.eootprj.dao.NeighborDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String askmid = request.getParameter("askmid");
	String uid = (String) session.getAttribute("uid");
	
	NeighborDao nei = new MyBNeighborDao();
	
	nei.deleteInvMe(askmid, uid);
	
	response.sendRedirect("settings.jsp");
%>
