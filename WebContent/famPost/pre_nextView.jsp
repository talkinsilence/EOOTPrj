<%@page import="com.eoot.eootprj.model.FMJoinFamPostFile"%>
<%@page import="com.eoot.eootprj.model.FamPostCommentJoinMember"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostCommentDao"%>
<%@page import="com.eoot.eootprj.model.FamPostComment"%>
<%@page import="com.eoot.eootprj.model.FamPostFileJoinFamPost"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostFileDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostFileDao"%>
<%@page import="com.eoot.eootprj.model.FamPostFile"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.model.FamPost"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.model.FamPostJoinMember"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
   	$(document).ready(function() {
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
   	});
</script>

<%	
String curCode = "";
String _curCode = request.getParameter("curCode");

if (_curCode != null && !_curCode.equals("")) {
	curCode = _curCode;
}

	FamPostDao famPostDao = new MyBFamPostDao();
	FMJoinFamPostFile fmf = famPostDao.nextFamPost(curCode);

	FamPostCommentDao famPostCommentDao = new MyBFamPostCommentDao();
	List<FamPostCommentJoinMember> cList = famPostCommentDao.getFamPostComments(curCode);
	
	pageContext.setAttribute("fmf", fmf);
	pageContext.setAttribute("cList", cList);
	
	fmf.getSrc();
%>

<div class="dv-media-box">
	<img class="dv-media-box-img" src="${fmf.src}" />
	<div class="dv-edit">
		<button class="dv-edit-btn">수정</button>
		<button class="dv-edit-btn">삭제</button>
	</div>
</div>

<div class="dv-comment-container">
	<div class="dv-profile-box">
		<div class="dv-profile-pic"></div>
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
				<div class="dv-like-cnt">${fp.getLikeCnt()}</div>
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
				<div class="dv-comment-cnt">${fp.getCommentCnt()}</div>
			</button>
		</div>
	</div>

	<div class="dv-comment-box-list">
		<c:forEach var="cList" items="${cList}">
			<div class="dv-comment-box">
				<div class="dv-comment-writer-pic">${cList.profilepic}</div>
				<div class="dv-comment-writer-name">${cList.name}</div>
				<div class="dv-comment-regdate">${cList.regdate}</div>
				<div class="dv-comment">${cList.content}</div>
			</div>
		</c:forEach>

	</div>
</div>

<div class="dv-reg-box">
	<div class="dv-reg-pic"></div>
	<input class="dv-reg-input" type="text" placeholder="댓글을 남기세요." />
	<div class="dv-reg-btn">등록</div>
</div>
