<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String regName = request.getParameter("reg-name");
	String regUid = request.getParameter("reg-uid");
	String regPwd = request.getParameter("reg-pwd");		
	String regBirthday = request.getParameter("user-birthday-year") + request.getParameter("user-birthday-month") + request.getParameter("user-birthday-day");
	
	/* Member member = new Member();
	
	member.setName(regName);
	member.setMid(regUid);
	member.setPwd(regPwd);
	member.setBirthday(regBirthday);
	
	MyBMemberDao dao = new MyBMemberDao();
	dao.insert(member); */
%>

<%=regName%>
<%=regUid%>
<%=regPwd%>
<%=regBirthday%>