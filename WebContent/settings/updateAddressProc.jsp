<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String data = "";
	String addressTxt = request.getParameter("addresstxt");
	String uid = "viovio@eoot.com";
	
	if(addressTxt != ""){
		MemberDao memberDao = new MyBMemberDao();
		Member member = memberDao.getMember(uid);
		
		Member m = new Member();
		m.setAddress(addressTxt);
		m.setFamcode(member.getFamcode());
		
		memberDao.updateAddress(m);
		
		data = addressTxt;
	}
	
	out.write(data);
%>