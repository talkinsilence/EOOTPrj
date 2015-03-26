<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.eoot.eootprj.model.FamPostComment"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostCommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try {
		String famPostCode = request.getParameter("famPostCode");
		String content = request.getParameter("content");
		
		FamPostCommentDao famPostCommentDao = new MyBFamPostCommentDao();
		FamPostComment famPostComment = new FamPostComment();
		famPostComment.setFamPostCode(famPostCode);
		famPostComment.setContent(content);
		famPostComment.setWriter("ddddd3");

		famPostCommentDao.insert(famPostComment);

	} catch (Exception e) {
		e.printStackTrace();
		response.getWriter().println("{result : FAIL}");
	}

	JSONObject jo = new JSONObject();
	jo.put("result", "SUCC");
	System.out.println("@@" + jo.toString());
	response.getWriter().println(jo.toString());
%>