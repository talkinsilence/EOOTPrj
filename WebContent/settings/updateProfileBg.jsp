<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ServletContext ctx = getServletContext();
	String path = ctx.getRealPath("/upload/profilebg");
	String uid = (String) session.getAttribute("uid");
	String famcode = "";
	
	System.out.print(path);
	
	MultipartRequest req = new MultipartRequest(request
            , path
            , 1024*1024*10
            , "UTF-8"
            , new DefaultFileRenamePolicy());
	
	String fileName = req.getFilesystemName("file-bg");
	
	if(req.getFile("file-bg") != null){
		MemberDao memberDao = new MyBMemberDao();
		
		Member m = memberDao.getMember(uid);
		
		famcode = m.getFamcode();
		
		memberDao.updateProfileBg(fileName, famcode);
	}

	response.sendRedirect("settings.jsp");
%>