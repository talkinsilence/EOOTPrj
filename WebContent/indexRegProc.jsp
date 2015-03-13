<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String regName = request.getParameter("regName");
	String regUid = request.getParameter("regUid");
	String regPwd = request.getParameter("regPwd");	
	String year = request.getParameter("regYear");
	String _month = request.getParameter("regMonth");
	String _day = request.getParameter("regDay");
	String path = "resource/images/default.jpg";
	
	String month = "";
	String day = "";

	if(_month.length() == 1)
		month = "0" + _month;
	else
		month = _month;
	
	if(_day.length() == 1)
		day = "0" + _day;
	else
		day = _day;
			
	String regBirthday = year + month + day;
	
	Member member = new Member();
	
	member.setName(regName);
	member.setMid(regUid);
	member.setPwd(regPwd);
	member.setBirthday(regBirthday);
	member.setProfilePic(path);
	
	MemberDao dao = new MyBMemberDao();
	dao.insert(member);
	
%>
