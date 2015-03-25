<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.eoot.eootprj.model.VilPostComment"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBVilPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.VilPostCommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try {
		String vilPostCode = request.getParameter("vilPostCode");
		String content = request.getParameter("content");
		//String uid = (String) session.getAttribute("uid");
		
		VilPostCommentDao vilPostCommentDao = new MyBVilPostCommentDao();
		VilPostComment vilPostComment = new VilPostComment();
		vilPostComment.setVilPostCode(vilPostCode);
		vilPostComment.setContent(content);
		vilPostComment.setWriter("nami@eoot.com");
		vilPostCommentDao.insert(vilPostComment);////쿼리
		
		System.out.println(vilPostCode);
		System.out.println(content);

	} catch (Exception e) {
		e.printStackTrace();
		response.getWriter().println("{result : FAIL}");
	}

	JSONObject jo = new JSONObject();
	jo.put("result", "SUCC");
	response.getWriter().println(jo.toString());
%>
