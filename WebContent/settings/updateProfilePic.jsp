<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ServletContext ctx = getServletContext();
	String path = ctx.getRealPath("/upload/profilepic");
	String uid = (String) session.getAttribute("uid");
	
	System.out.print(path);
	
	MultipartRequest req = new MultipartRequest(request
            , path
            , 1024*1024*10
            , "UTF-8"
            , new DefaultFileRenamePolicy());
	
	String fileName = req.getFilesystemName("file");
	
	if(req.getFile("file") != null){
		MemberDao memberDao = new MyBMemberDao();
		
		memberDao.updateProfilePic(fileName, uid);
	}

	response.sendRedirect("settings.jsp");
%>