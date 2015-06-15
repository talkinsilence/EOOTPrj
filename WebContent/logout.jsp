<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	session.removeAttribute("uid"); //세션에서 uid제거
	response.sendRedirect("index.jsp"); //index로 이동
%>