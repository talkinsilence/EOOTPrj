<%@page import="com.eoot.eootprj.model.VilPost"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBVilPostDao"%>
<%@page import="com.eoot.eootprj.dao.VilPostDao"%>
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
     /*  Date date = request.getParameter(regDate); */
      
      VilPostDao vilPostDao = new MyBVilPostDao();
      VilPost vilpost = new VilPost();
      
      vilpost.setTitle(title);
      vilpost.setContent(content);
      vilpost.setClipCnt(1);
      vilpost.setCommentCnt(1);
      vilpost.setHit(1);
      vilpost.setLikeCnt(1);
      vilpost.setWriter("ddddd3");
      /* vilPostDao.insert(vilpost); */

   } catch (Exception e) {
      e.printStackTrace();
      response.getWriter().println("{result : FAIL}");
   }

   JSONObject jo = new JSONObject();
   jo.put("result", "SUCC");
   System.out.println("@@" + jo.toString());
   response.getWriter().println(jo.toString());
%>