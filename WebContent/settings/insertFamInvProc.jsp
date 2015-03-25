<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.model.FamInvitation"%>
<%@page import="com.eoot.eootprj.model.FamInvitationJoinMember"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamInvitationDao"%>
<%@page import="com.eoot.eootprj.dao.FamInvitationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String uid = (String) session.getAttribute("uid");
	String acceptmid = request.getParameter("accpetmid");
	
	MemberDao memberDao = new MyBMemberDao();
	FamInvitationDao famInvDao = new MyBFamInvitationDao();
	
	if(memberDao.getMember(acceptmid) != null){
		
		if(famInvDao.getInv(uid, acceptmid) == null){
			FamInvitation famInvitation = new FamInvitation();
			famInvitation.setAskmid(uid);
			famInvitation.setAcceptmid(acceptmid);
			
			famInvDao.insertInv(famInvitation);
		}
	}
	List<FamInvitationJoinMember> finv = famInvDao.getInvs(uid);
	
	pageContext.setAttribute("finv", finv);
%>

<legend>가족 초대 현황</legend>
									
<c:if test="${empty finv}">
	<div>가족 초대 기록이 없습니다.</div>
</c:if>

<c:if test="${not empty finv}">
	<c:forEach var="i" items="${finv}">
		<ul>
			<li class="myhome-member-mng-uid">${i.acceptmid}</li>
			<li class="myhome-member-mng-name">${i.name}</li>
			<li class="myhome-member-mng-state">대기중</li>
			<li class="myhome-member-mng-date">
			<fmt:formatDate value="${i.askregdate}" pattern="yyyy-MM-dd"/>
			</li>
		</ul>
	</c:forEach>
</c:if>