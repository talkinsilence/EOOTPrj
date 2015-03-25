<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String data = "";
	String nametxt = request.getParameter("nametxt");
	String uid = (String) session.getAttribute("uid");
	
	if(nametxt != ""){
		Member m = new Member();
		
		m.setName(nametxt);
		m.setMid(uid);
		
		MemberDao memberDao = new MyBMemberDao();
		memberDao.updateName(m);
		
		data = nametxt;
	}
	
	out.write(data);
%>