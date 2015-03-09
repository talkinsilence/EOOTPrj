<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String regUid = request.getParameter("regUid");
	String data = "";	
	
	MyBMemberDao dao = new MyBMemberDao();
	
	if(dao.getMember(regUid) != null)
		data = "NO";
	else 
		data = "YES";
	
	out.write(data);
%>

