<%@page import="com.eoot.eootprj.dao.FamPostDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostDao"%>
<%@page import="com.eoot.eootprj.model.FamPost"%>
<%@page import="com.eoot.eootprj.dao.FamPostFileDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostFileDao"%>
<%@page import="com.eoot.eootprj.model.FamPostFile"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 ServletContext ctx = request.getServletContext();
 String path = ctx.getRealPath("/write/upload");
 out.println(path + "<br />");
 
 MultipartRequest req = new MultipartRequest(request
			, path
			, 1024*1024*10
			, "UTF-8"
			, new DefaultFileRenamePolicy());

 String file = req.getFilesystemName("file1");
 
out.println(file);

/* if(req.getFile("file1") !=null){
	FamPost fampost = new FamPost();
	   FamPostDao famPostDao = new MyBFamPostDao();
	  
	   fampost.setSrc(file);
	   out.println(fampost.getSrc());
} */
/*  if(req.getFile("file1") != null){
	 
	   FamPost fampost = new FamPost();
	   FamPostDao famPostDao = new MyBFamPostDao();
	  
	   fampost.setSrc(file);
	   
	   famPostDao.insert(fampost);
 } */
 
	 	/* FamPostFile famPostFile = new FamPostFile();
	 	FamPostDao famPostDao = new MyBFamPostDao();
	 	
	 	FamPost famPost = new FamPost();
	 	String famPostCode = famPost.getCode();
	 	System.out.println(famPost.getCode());
	 	
	 	famPostFile.setSrc(file);
	 	famPostFile.setType("jpg");
	 	famPostFile.setFamPostCode(famPostCode);
	 	
	 	FamPostFileDao famPostFileDao = new MyBFamPostFileDao();
	 	famPostFileDao.insert(famPostFile); */
	
/*  response.sendRedirect("../quickWrite.jsp"); */
 %>