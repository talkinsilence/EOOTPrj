<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.eoot.eootprj.model.FamPostCommentJoinMember"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostCommentDao"%>
<%@page import="com.eoot.eootprj.model.FamPostJoinMember"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
/* .dv-content {
    height: 20px;
    max-height: 474px;
    width: 338px;
    overflow: hidden;
    text-overflow:ellipsis;
    word-break:inherit; /*컨텐츠 클릭시 속성을 break-all;으로 변경*/
} */
</style>

<script>
	 $(document).ready(function() {
		$('.dv-content').click(function() {
			if ($(this).css("word-break") == "normal") {
				alert($(this).css("word-break"));
				$(this).stop().animate({
					height : "474px"
				}, 600,function(){
					$(this).css("word-break", "break-all");
					alert($(this).css("word-break"));	
				});
			} else {
				$(this).stop().animate({
					height : "20px"
				}, 300, function() {
					$(this).css("word-break", "inherit");
					alert($(this).css("word-break"));
				});
			}
		});
	});
</script>

<%	
	String famPostCode = "";
	String _famPostCode = request.getParameter("famPostCode");

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
	<div class="dv-profile-pic"></div>
	<div class="dv-profile-name">${fp.getName()}</div>
	<div class="dv-profile-title">${fp.getTitle()}</div>
	<div class="dv-profile-regdae">${fp.getRegdate()}</div>
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
	<c:forEach var="c" items="${cList}">
		<div class="dv-comment-box">
			<div class="dv-comment-writer-pic">${c.profilepic}</div>
			<div class="dv-comment-writer-name">${c.name}</div>
			<div class="dv-comment-regdate">${c.regdate}</div>
			<div class="dv-comment">${c.content}</div>
		</div>
	</c:forEach>
</div>
