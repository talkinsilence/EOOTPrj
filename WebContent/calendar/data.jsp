<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamCalendarDao"%>
<%@page import="com.eoot.eootprj.dao.FamCalendarDao"%>
<%@page import="com.eoot.eootprj.model.FamCalendar"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String uid = (String) session.getAttribute("uid");
	String famcode = "viovio@eoot.com";
	
	FamCalendarDao calDao = new MyBFamCalendarDao();
	
	List<FamCalendar> calList = calDao.getCals(famcode);
	
	String data = "[";
	
	for(int i=0; i < calList.size(); i++){
		FamCalendar cal = calList.get(i);
		
		data += String.format(
				"{'id':'%s', 'title':'%s', 'start':'%s', 'end':'%s'}",
				 cal.getCode(), cal.getTitle(), cal.getStartdate(), cal.getEnddate());
		if (i != calList.size() - 1)
			data += ",";
	}
	
	data += "]";
	
	out.print(data);
%>