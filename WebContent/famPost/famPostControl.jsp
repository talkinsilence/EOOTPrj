<%@page import="com.eoot.eootprj.model.FamPostCommentJoinMember"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostCommentDao"%>
<%@page import="com.eoot.eootprj.model.FamPostComment"%>
<%@page import="com.eoot.eootprj.model.FamPostFileJoinFamPost"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostFileDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostFileDao"%>
<%@page import="com.eoot.eootprj.model.FamPostFile"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.model.FamPost"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.model.FamPostJoinMember"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	//System.out.println(request.get);
	String famPostCode = "";
	String _famPostCode = request.getParameter("famPostCode");
	
	if (_famPostCode != null && !_famPostCode.equals(""))
		famPostCode = _famPostCode;

	FamPostDao famPostDao = new MyBFamPostDao();
	FamPostJoinMember fp = famPostDao.getFamPost(famPostCode);
	
	FamPostCommentDao famPostCommentDao = new MyBFamPostCommentDao();
	List<FamPostCommentJoinMember> cList = famPostCommentDao.getFamPostComments(famPostCode);
	
 	System.out.println(cList.get(0).getCode());
	pageContext.setAttribute("fp", fp);
	pageContext.setAttribute("cList", cList); 
	
	
%>


