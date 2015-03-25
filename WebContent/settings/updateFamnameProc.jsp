<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String data = "";
	String famnameTxt = request.getParameter("famnametxt");
	String uid = (String) session.getAttribute("uid");
	
	if(famnameTxt != ""){
		MemberDao memberDao = new MyBMemberDao();
		Member member = memberDao.getMember(uid);
		
		Member m = new Member();
		m.setFamname(famnameTxt);
		m.setFamcode(member.getFamcode());
		
		memberDao.updateFamname(m);
		
		data = famnameTxt;
	}
	
	out.write(data);
%>