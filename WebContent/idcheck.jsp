<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String regUid = request.getParameter("regUid");
	String data = "";	
	
	MemberDao dao = new MyBMemberDao();
	Member m = dao.getMember(regUid);
	
	if(m != null)
		data = "NO";
	else 
		data = "YES";
	
	out.write(data);
%>

