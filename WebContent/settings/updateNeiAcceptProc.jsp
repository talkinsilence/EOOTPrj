<%@page import="com.eoot.eootprj.dao.mybatis.MyBNeighborDao"%>
<%@page import="com.eoot.eootprj.dao.NeighborDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = (String) session.getAttribute("uid");
	String askmid = request.getParameter("askmid");
	
	NeighborDao nei = new MyBNeighborDao();
	
	nei.updateNeiAccept(askmid, uid);
	
	response.sendRedirect("settings.jsp");
%>