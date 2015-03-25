<%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	try {
		String code = request.getParameter("code");
		
		LetterDao letterDao = new MyBLetterDao();
		letterDao.delete(code);

	} catch (Exception e) {
		e.printStackTrace();
		response.getWriter().println("{result : FAIL}");
	}

	JSONObject jo = new JSONObject();
	jo.put("result", "SUCC");
	System.out.println("@@" + jo.toString());
	response.getWriter().println(jo.toString());
%>