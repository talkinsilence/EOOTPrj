<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.eoot.eootprj.model.FamPost"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.eoot.eootprj.model.FamPostComment"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostCommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ServletContext ctx = getServletContext();
	String path = ctx.getRealPath("/write/upload");
	out.println(path + "<br />");

	MultipartRequest req = new MultipartRequest(request, path,
			1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());

	String title = req.getParameter("textfield1");
	String content = req.getParameter("textfield2");
	String shareNei = req.getParameter("shareNei");
	String shareVil = req.getParameter("shareVil");
	String uid = (String) session.getAttribute("uid");
	
	out.println(title + "<br />");
	out.println(content + "<br />");
	out.println(shareNei + "<br />");
	out.println(shareVil + "<br />"); 

	out.println(title + "<br />");
	out.println(content + "<br />");
	out.println(shareNei + "<br />");
	out.println(shareVil + "<br />"); 

	
	String fileName = req.getFilesystemName("file1");

	out.println(fileName + "<br />");

	FamPostDao famPostDao = new MyBFamPostDao();
	FamPost fampost = new FamPost();

	fampost.setTitle(title);
	fampost.setContent(content);
	fampost.setClipCnt(1);
	fampost.setCommentCnt(1);
	fampost.setHit(1);
	fampost.setLikeCnt(1);
	fampost.setShareNei(0);
    fampost.setShareVil(0);
	fampost.setWriter(uid);
	fampost.setSrc(fileName);
	famPostDao.insert(fampost);
	/* try {
	  ServletContext ctx = getServletContext();
	  String path = ctx.getRealPath("/write/upload");
	  out.println(path + "<br />");
	  
	  MultipartRequest req = new MultipartRequest(request
	            , path
	            , 1024*1024*10
	            , "UTF-8"
	            , new DefaultFileRenamePolicy());
	  
	  String fileName = req.getFilesystemName("file1");
	  
	  out.println(fileName + "<br />");
	  
	   String code = req.getParameter("code");
	   String title = req.getParameter("title");
	   String content = req.getParameter("content");
	   String shareNei = req.getParameter("shareNei");
	   String shareVil = req.getParameter("shareVil"); 
	   
	  
	   if(req.getFile("file") != null){
	      FamPostDao famPostDao = new MyBFamPostDao();
	      FamPost fampost = new FamPost();
	      
	      fampost.setTitle(title);
	      fampost.setContent(content);
	      fampost.setClipCnt(1);
	      fampost.setCommentCnt(1);
	      fampost.setHit(1);
	      fampost.setLikeCnt(1);
	      fampost.setShareNei(Integer.parseInt(shareNei));
	      fampost.setShareVil(Integer.parseInt(shareVil));
	      fampost.setWriter("ddddd3");
	      fampost.setSrc(fileName);
	      famPostDao.insert(fampost);
	      
	      out.println(code + "<br />");
		   out.println(title + "<br />");
		   out.println(content + "<br />");
		   out.println(shareNei + "<br />");
		   out.println(shareVil + "<br />");
	      
	      System.out.println(shareNei); 
	  }  

	  } catch (Exception e) {
	     e.printStackTrace();
	     response.getWriter().println("{result : FAIL}");
	  }

	  JSONObject jo = new JSONObject();
	  jo.put("result", "SUCC");
	  System.out.println("@@" + jo.toString());
	  response.getWriter().println(jo.toString());   */
	/*  response.sendRedirect("quickWrite.jsp"); */
%>