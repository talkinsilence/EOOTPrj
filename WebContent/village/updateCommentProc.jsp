<%@page import="com.eoot.eootprj.model.VilPostCommentJoinMember"%>
<%@page import="com.eoot.eootprj.model.VilPostComment"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBVilPostDao"%>
<%@page import="com.eoot.eootprj.dao.VilPostDao"%>
<%@page import="com.eoot.eootprj.model.VilPost"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBVilPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.VilPostCommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String content = "";
	String _content = request.getParameter("content");
	System.out.println(_content);
	String vilPostCode = "";
	String _vilPostCode = request.getParameter("vilPostCode");
	VilPostCommentJoinMember vcj = new VilPostCommentJoinMember();
	
	if(_content != null && !_content.equals("")){
		content = _content;
	}
	
	System.out.println(content);
	
	if(_vilPostCode != null && !_vilPostCode.equals("")){
		vilPostCode = _vilPostCode;
	}
	
	System.out.println(vilPostCode);
	
	vcj.setWriter("pcm");
	vcj.setContent(content);
	vcj.setVilPostCode(vilPostCode);
	/* VilPostComment vilPostComment = new VilPostComment(); */
	/* vilPostComment.setContent(content); */
	
	VilPostCommentDao vilPostCommentDao = new MyBVilPostCommentDao();
	vilPostCommentDao.insert(vcj);
	
/* 	response.sendRedirect("villageIndex03.jsp"); */
%>