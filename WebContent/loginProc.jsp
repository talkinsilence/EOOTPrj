<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String data = "";
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	
	MemberDao dao = new MyBMemberDao();
	
	Member m = dao.getMember(uid);
	
	if(m == null)
		data = "아이디 없음";
	else if(!m.getPwd().equals(pwd))
		data = "비밀번호나 아이디 틀림";

	out.print(data);
%>