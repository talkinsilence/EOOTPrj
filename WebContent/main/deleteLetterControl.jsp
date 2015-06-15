<%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	try {
		String code = request.getParameter("code"); //편지 코드 넘겨 받기
		
		LetterDao letterDao = new MyBLetterDao(); //LetterDao 객체 생성
		letterDao.delete(code); //해당 코드 편지 삭제

	} catch (Exception e) {
		e.printStackTrace();
		response.getWriter().println("{result : FAIL}");
	} //예외처리

	JSONObject jo = new JSONObject();
	jo.put("result", "SUCC");
	System.out.println("@@" + jo.toString());
	response.getWriter().println(jo.toString());
%>