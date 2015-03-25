<%-- <%@page import="com.eoot.eootprj.model.FamPostJoinMember"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostDao"%>
<%@page import="com.eoot.eootprj.model.VilPostCommentJoinMember"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBVilPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.VilPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.VilPostFileDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBVilPostFileDao"%>
<%@page import="com.eoot.eootprj.model.VilPostComment"%>
<%@page import="com.eoot.eootprj.model.VilPostFile"%>
<%@page import="com.eoot.eootprj.model.VilPostJoinMember"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="com.eoot.eootprj.dao.VilPostDao"%>
<%@ page import="com.eoot.eootprj.model.VilPost"%>
<%@ page import="com.eoot.eootprj.dao.mybatis.MyBVilPostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String query = "";
	String _query = request.getParameter("query");
	
	if(_query != null && !_query.equals(""))
		query = _query;

	VilPostDao vilPostDao = new MyBVilPostDao();
	VilPostFileDao vilPostFileDao = new MyBVilPostFileDao();
	VilPostCommentDao vilPostCommentDao = new MyBVilPostCommentDao();
	
	List<VilPostJoinMember> list = vilPostDao.getVilPosts(query, "TITLE");
	List<VilPostFile> fList = vilPostFileDao.getVilPostFiles();
	List<VilPostCommentJoinMember> cList = vilPostCommentDao.getVilPostComments();

	pageContext.setAttribute("list", list);
	pageContext.setAttribute("fList", fList);
	pageContext.setAttribute("cList", cList);
%>
<script>
	$(function () {
	    $(".accordion").accordion({
	        collapsible: true
	        , active: false
	    });
	});
</script>

<c:forEach var="i" items="${list}">
	<div class="village-board-list">
		<div class="village-board-item1">
			<c:if test="${i.sort.equals('1')}">
				<div class="village-board-label1"></div>
			</c:if>
			<c:if test="${i.sort.equals('2')}">
				<div class="village-board-label2"></div>
			</c:if>
			<c:if test="${i.sort.equals('3')}">
				<div class="village-board-label3"></div>
			</c:if>
			<c:if test="${i.sort.equals('4')}">
				<div class="village-board-label4"></div>
			</c:if>
			<div class="village-board-item-img">
				<img class="thumbnail2" src="${i.profilepic}" />
			</div>
			<div class="village-board-item-text00">
				<p id="village-board-item-title">${i.regdate}</p>
				<p id="village-board-item-user">${i.name}</p>
			</div>
			<div class="post-popularity">
				<div class="post-popularity-item like">
					<h1 class="hidden">좋아요 개수</h1>
					<img class="post-popularity-btn" src="refimg/btn-like.png" />
					<div class="post-popularity-cnt clearfix">${i.likeCnt}</div>
				</div>
				<div class="post-popularity-item scrap">
					<h1 class="hidden">스크랩 횟수</h1>
					<img class="post-popularity-btn" src="refimg/btn-scrap.png" />
					<div class="post-popularity-cnt clearfix">${i.clipCnt}</div>
				</div>
				<div class="post-popularity-item comment">
					<h1 class="hidden">댓글 개수</h1>
					<img class="post-popularity-btn" src="refimg/btn-comment.png" />
					<div class="post-popularity-cnt clearfix">${i.commentCnt}</div>
				</div>
			</div>

			<!-- ---------------------------------------------------------------------------------------------------------------- -->
			<div class="post-header-wrapper">
				<div class="post-user-menu-btn"></div>
				<div class="post-user-menu-area hidden">
					<div class="post-user-menu-wrapper-bg"></div>
					<c:if test="${m.mid == j.writer}">
						<div class="post-user-menu-wrapper me">
							<div class="post-user-menu edit-post">수정하기</div>
							<div class="post-user-menu delete-post">삭제하기</div>
						</div>
					</c:if>
					<c:if test="${m.mid != j.writer}">
						<div class="post-user-menu-wrapper you">
							<div class="post-user-menu report-post">신고하기</div>
						</div>
					</c:if>
				</div>
			</div>

			<!-- ---------------------------------------------------------------------------------------------------------------- -->

		</div>

		<div class="accordion">
			<div>
				<div class="village-board-item2">
					<p>${i.title}</p>
				</div>
				<img class="village-board-item3" src="refimg/etc_image.png" />
			</div>
			<div id="village-board-item2-text">
				<p>${i.title}</p>
				<p>${i.content}</p>
				<c:forEach var="f" items="${fList}">
					<c:if test="${i.getCode() == f.getVilPostCode()}">
						<img class="village-board-item2-img" src="${f.getSrc()}" />
					</c:if>
				</c:forEach>

				<div class="post-comment-wrapper">
					<div class="post-comment">
						<c:forEach var="c" items="${cList}">
							<c:if test="${i.getCode() == c.getVilPostCode()}">

								<div class="post-comment-list">
									<div>
										<div class="profile-pic-box-s">
											<h1 class="hidden">댓글작성자프로필사진</h1>
											<img class="thumbnail" src="${c.profilepic}" />
										</div>
										<div class="comment-info">
											<div class="comment-info-writer">
												<h1 class="hidden">댓글작성자이름</h1>
												<p>${c.name}</p>
											</div>
											<div class="comment-info-date">
												<h1 class="hidden">댓글작성일(또는 작성시간)</h1>
												<p>${c.regdate}</p>
											</div>
											<div class="comment-like">
												<h1 class="hidden">댓글좋아요개수</h1>
												<img class="comment-like-btn" src="refimg/btn-like-s.png" />
												<div class="comment-like-cnt clearfix">1</div>
											</div>
										</div>
										<p class="comment-content">${c.content}</p>
									</div>
								</div>
								<input class="vil-post-code hidden" name="vilPostCode"
									value="${c.vilPostCode}" />
							</c:if>
						</c:forEach>
					</div>

					<form action="updateCommentProc.jsp" method="post"
						enctype="multipart/form-data">
						<fieldset>
							<div class="post-comment-write">
								<div class="profile-pic-box-s">
									<h1 class="hidden">댓글작성자프로필사진</h1>
									<img class="thumbnail" src="refimg/default-profile-pic.png" />
								</div>
								<input class="post-input-text" type="text"
									placeholder="댓글을 남겨주세요." /> <input class="post-input-button"
									type="button" value="등록" />
							</div>

						</fieldset>
					</form>

				</div>
			</div>

		</div>
	</div>
	<div class="vil-post-code hidden">${i.code}</div>
</c:forEach> --%>