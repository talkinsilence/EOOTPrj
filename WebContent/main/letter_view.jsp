<%@page import="com.eoot.eootprj.model.Letter"%>
<%@page import="com.eoot.eootprj.model.LetterJoinMember"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String uid = (String) session.getAttribute("uid"); //para delete
String code = (String) request.getAttribute("code");

LetterDao letterDao = new MyBLetterDao();
Letter l = letterDao.getLetter(code);
pageContext.setAttribute("l", l);
%>

<script>
function loadXMLDoc(){
	var xmlhttp;
	xmlhttp=new XMLHttpRequest();
	  
	xmlhttp.onreadystatechange=function(){
	  if (xmlhttp.readyState==4 && xmlhttp.status==200){
		document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
	    }
	}
	xmlhttp.open("GET","demo_get.asp",true);
	xmlhttp.send();
}


<!--
	xmlhttp.open("GET","demo_get2.asp?fname=Henry&lname=Ford",true);
	xmlhttp.send();
	</script> -->
</script>
<!-- <script>

var page = 1;

	window.onload = function(){
		var btnReq = document.querySelector("#btn-req");
		btnReq.onclick = function(){
			
			var oReq = new XMLHttpRequest();
			if (oReq) {

				oReq.onreadystatechange = function(){
					if(oReq.readyState == 4){
						
						var data = eval(oReq.responseText);
						alert("title : " + data[1].title + "\n" 
								+ "code : " + data[1].code);
					}	
				}
				oReq.open("GET", "data.jsp?p="+page, true);
				oReq.send();
			}
			page++;
		}
	}
</script> -->

<div class="letter-view">
	<div>편지 : </div>
</div>
