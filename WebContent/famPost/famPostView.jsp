<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.model.FamPostCommentJoinMember"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostCommentDao"%>
<%@page import="com.eoot.eootprj.model.FamPostJoinMember"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostDao"%>

<script>
   	$(document).ready(function() {
   		var cnt = 0;
   		
		$('.dv-content').click(function() {
			if ($(this).css("word-break") == "normal") {
				$(this).css("word-break", "break-all")
						.css("white-space","inherit");
				$(this).stop().animate({
					height : "474px"
				}, 400);
			} else {
				$(this).stop().animate({
					height : "28px"
				}, 200, function() {
					$(this).css("word-break", "inherit")
							.css("white-space","nowrap");	
				});
			}
		});
   		
		$(".dv-like-cnt").click(function(){
			cnt++;
			$(this).html(cnt);
		});
   	});
   	
</script>

<%	
	String famPostCode = "";
	String _famPostCode = request.getParameter("famPostCode");
	
	String uid = (String) session.getAttribute("uid");
	
	MemberDao memberDao = new MyBMemberDao();
	Member m = memberDao.getMember(uid);
	
	String famcode = m.getFamcode();
	

	if (_famPostCode != null && !_famPostCode.equals("")) {
		famPostCode = _famPostCode;
	}

	FamPostDao famPostDao = new MyBFamPostDao();
	FamPostJoinMember fp = famPostDao.getFamPost(famPostCode);

	FamPostCommentDao famPostCommentDao = new MyBFamPostCommentDao();
	List<FamPostCommentJoinMember> cList = famPostCommentDao.getFamPostComments(famPostCode);
	
	pageContext.setAttribute("fp", fp);
	pageContext.setAttribute("cList", cList);

%>


<div class="dv-profile-box">
	<div class="dv-profile-pic"><img src="${pageContext.request.servletContext.contextPath}/upload/profilepic/${fp.getProfilepic()}"/></div>
	<div class="dv-profile-name">${fp.getName()}</div>
	<div class="dv-profile-regdate">${fp.getRegdate()}</div>
	<div class="dv-profile-title">${fp.getTitle()}</div>
</div>

<div class="dv-content-popularity-wrapper">
	<div class="dv-content-box">
		<div class="dv-content">${fp.getContent()}</div>
	</div>
	<div class="dv-popularity-box">
		<button class="dv-like-cnt-btn">
			<div class="dv-like-img">
				<img src="images/btn-like.png" />
			</div>
			<div class="dv-like-cnt">0</div> 
			<%-- <div class="dv-like-cnt">${fp.getLikeCnt()}</div> --%>
		</button>
		<button class="dv-scrap-cnt-btn">
			<div class="dv-scrap-img">
				<img src="images/btn-scrap.png" />
			</div>
			<div class="dv-scrap-cnt">${fp.getClipCnt()}</div>
		</button>
		<button class="dv-comment-cnt-btn">
			<div class="dv-comment-img">
				<img src="images/btn-comment.png" />
			</div>
			<div class="dv-comment-cnt">0</div>
		</button>
	</div>
</div>

<div class="dv-comment-box-list">
	<c:forEach var="cList" items="${cList}">
		<div class="dv-comment-box">
			<div class="dv-comment-writer-pic"><img src="${pageContext.request.servletContext.contextPath}/upload/profilepic/${cList.profilepic}"/></div>
			<div class="dv-comment-writer-name">${cList.name}</div>
			<div class="dv-comment-regdate">${cList.regdate}</div>
			<div class="dv-comment">${cList.content}</div>
		</div>
	</c:forEach>
		
</div>
