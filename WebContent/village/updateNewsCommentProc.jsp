<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostCommentDao"%>
<%@page import="com.eoot.eootprj.model.FamPostComment"%>
<%@page import="com.eoot.eootprj.dao.FamPostCommentDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.eoot.eootprj.model.VilPostComment"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBVilPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.VilPostCommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try {
		String vilPostCode = request.getParameter("vilPostCode");
		String famPostCode = request.getParameter("famPostCode");
		String content = request.getParameter("content");
		//String uid = (String) session.getAttribute("uid");
		
		VilPostCommentDao vilPostCommentDao = new MyBVilPostCommentDao();
		VilPostComment vilPostComment = new VilPostComment();
		vilPostComment.setVilPostCode(vilPostCode);
		vilPostComment.setContent(content);
		vilPostComment.setWriter("nami@eoot.com");
		vilPostCommentDao.insert(vilPostComment);////쿼리
	
		FamPostCommentDao famPostCommentDao = new MyBFamPostCommentDao();
		FamPostComment famPostComment = new FamPostComment();
		famPostComment.setFamPostCode(famPostCode);
		famPostComment.setContent(content);
		famPostComment.setWriter("viovio@eoot.com");
		famPostCommentDao.insert(famPostComment);
		
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
