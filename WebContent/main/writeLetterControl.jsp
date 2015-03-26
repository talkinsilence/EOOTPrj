<%@page import="com.eoot.eootprj.model.Letter"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  	try {
		String writer = (String) session.getAttribute("uid");
		String reader = request.getParameter("reader");
		int type = 0;
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Letter letter = new Letter();
		letter.setWriter(writer);
		letter.setReader(reader);
		letter.setType(type);
		letter.setTitle(title);
		letter.setContent(content);
		
		LetterDao letterDao = new MyBLetterDao();
		letterDao.insert(letter);

	} catch (Exception e) {
		e.printStackTrace();
		response.getWriter().println("{result : FAIL}");
	}

	JSONObject jo = new JSONObject();
	jo.put("result", "SUCC");
	System.out.println("@@" + jo.toString());
	response.getWriter().println(jo.toString());  
%>


  
      