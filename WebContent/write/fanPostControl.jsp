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
   try {
      String code = request.getParameter("code");
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String shareNei = request.getParameter("shareNei");
      String shareVil = request.getParameter("shareVil");
     /*  Date date = request.getParameter(regDate); */
      
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
      fampost.setSrc("sdf");
      famPostDao.insert(fampost);
      
      System.out.println(shareNei);

   } catch (Exception e) {
      e.printStackTrace();
      response.getWriter().println("{result : FAIL}");
   }

   JSONObject jo = new JSONObject();
   jo.put("result", "SUCC");
   System.out.println("@@" + jo.toString());
   response.getWriter().println(jo.toString());
%>