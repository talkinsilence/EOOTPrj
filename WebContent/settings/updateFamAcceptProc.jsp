<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamInvitationDao"%>
<%@page import="com.eoot.eootprj.dao.FamInvitationDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String askmid = request.getParameter("askmid");
	String uid = (String) session.getAttribute("uid");
	
	String address = "";
	String famcode = "";
	String famname = "";
	String profilebg = "";
	
	MemberDao memberDao = new MyBMemberDao();
	
	Member memberAsk = memberDao.getMember(askmid);
	
	if(memberAsk != null){
		address = memberAsk.getAddress();
		famcode = memberAsk.getFamcode();
		famname = memberAsk.getFamname();
		profilebg = memberAsk.getProfilebg();
		
		Member memberAccept = new Member();
		
		memberAccept.setMid(uid);
		memberAccept.setAddress(address);
		memberAccept.setFamcode(famcode);
		memberAccept.setFamname(famname);
		memberAccept.setProfilebg(profilebg);
		
		memberDao.updateFamAccept(memberAccept);
		
		FamInvitationDao fam = new MyBFamInvitationDao();
		
		fam.updateFamAccept(askmid, uid);
	}
	
	response.sendRedirect("../main/main.jsp");
%>