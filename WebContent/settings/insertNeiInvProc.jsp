<%@page import="com.eoot.eootprj.model.NeighborJoinMember"%>
<%@page import="com.eoot.eootprj.model.Neighbor"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBNeighborDao"%>
<%@page import="com.eoot.eootprj.dao.NeighborDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String uid = (String) session.getAttribute("uid");
	String acceptmid = request.getParameter("acceptmid");
	
	MemberDao memberDao = new MyBMemberDao();
	Member m = memberDao.getMember(uid);
	Member macpt = memberDao.getMember(acceptmid);
	
	NeighborDao nei = new MyBNeighborDao();
	
	if(macpt != null){
		if(!m.getFamcode().equals(macpt.getFamcode())){
			if(nei.getInv(uid, acceptmid) == null){
				
				Neighbor neighbor = new Neighbor();
				neighbor.setAskmid(uid);
				neighbor.setAcceptmid(acceptmid);
				
				nei.insertNei(neighbor);
			}
		}
	}
	
	List<NeighborJoinMember> neis = nei.getNeiInvs(uid);
	
	pageContext.setAttribute("neis", neis);
%>

<c:if test="${empty neis}">
	<div>이웃신청 기록이 없습니다.</div>
</c:if>

<c:if test="${not empty neis}">
	<c:forEach var="neis" items="${neis}">
		<ul>
			<li class="eoot-with-get-famname">
				<c:if test="${empty neis.famname}">
					(가족명 없음)
				</c:if>

				<c:if test="${not empty neis.famname}">
					${neis.famname}
               	</c:if>
			</li>
			
            <li class="eoot-with-get-name link">
            	<a target="_blank" href="../main/main_e.jsp?fc=${neis.famcode}">${neis.name}</a>
			</li>
			
			<li class="eoot-with-get-msg">
				<c:if test="${empty neis.askmsg}">
				우리 이웃 해요 ~^^
				</c:if>
	
				<c:if test="${not empty neis.askmsg}">
					${neis.askmsg}
	         	</c:if>
         	</li>
         	
         	<li class="waiting">대기중</li>
    	</ul>
   	</c:forEach>
</c:if>