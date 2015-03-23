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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/detail-view.css" rel="stylesheet" />
<link href="css/media-add.css" rel="stylesheet" />
<link href="css/media.css" rel="stylesheet" />
<link href="../resource/css/bind_menu.css" rel="stylesheet" />
<link href="../resource/css/reset.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
<script src="../resource/js/menu.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="../resource/js/jquery-2.1.3.js"></script>
<script src="../resource/js/modernizr.js"></script>
<script src="js/media.js"></script>

<%    
	String famPostCode ="";
	String query = "";
	String field = "Title";
	
	String _famPostCode = request.getParameter("famPostCode");
	String _query = request.getParameter("query");
	String _field = request.getParameter("filed");

	if (_query != null && !_query.equals(""))
		query = _query;

	if (_field != null && !_field.equals(""))
		field = _field;

	FamPostDao famPostDao = new MyBFamPostDao();
	List<FamPostJoinMember> list = famPostDao.getFamPosts(query, field);

	FamPostFileDao famPostFileDao = new MyBFamPostFileDao();
	List<FamPostFileJoinFamPost> fList = famPostFileDao.getFamPostFiles();
	
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("fList", fList);
	pageContext.setAttribute("size", famPostFileDao.getSize());
%>

</head>

<body>
	<div class="media">
		<div class="main-media">
			<div class="main-media-box">
				<div class="main-media-box-L">

					<img src="${fList.get(0).getSrc()}" />
					<!-- <div class="mask"></div>
                    <div class="title"></div>
                    <div class="date">2015.2.28</div>
                    <div class="content"></div>
                    <div class="view"></div> -->
				</div>

				<div class="main-media-box-R">
					<div class="main-media-box-R-top">
						<img src="${fList.get(1).getSrc()}" />
					</div>

					<div class="main-media-box-R-bottom">
						<img src="${fList.get(2).getSrc()}" />
					</div>
				</div>
			</div>
		</div>

		<div class="my-menu">
			<button class="upload">
				upload
			</button>

			<input type="button" class="filed" value="filed" />
			<div class="filed-list-wrapper">
				<div class="filed-list">
					<button class="filed-list-item1">my gallery</button>
					<button class="filed-list-item2">fam gallery</button>
				</div>
			</div>

			<div class="search">
				<form>
					<fieldset>
						<input id="search-input" type="text" name="query" value="${param.query}" placeholder="e-oot" /> 
						<input id="search-button" type="submit" value="search" />
					</fieldset>
				</form>
			</div>
		</div>

		<div class="media-lists">
			<c:forEach var="j" begin="0" end="${(size-1)/5}" step="1">
				<div class="media-list-box">
					<c:forEach var="i" begin="0" end="4" step="1">
						<c:set var="s" value="${size}" />
						<c:if test="${j*5+i < s}">
							<div class="media-list-item-box">
								<div class="media-list-item">
									<form>
										<input class="media-list-item-code" type="hidden" name="famPostCode" value="${fList.get(j*5+i).getFamPostCode()}" />
									</form>
									<img class="media-list-item-img" src="${fList.get(j*5+i).getSrc()}">
									<div class="media-list-item-mask"></div>
									<div class="media-list-item-like">${fList.get(j*5+i).getLikeCnt()}</div>
									<div class="media-list-item-scrap">${fList.get(j*5+i).getClipCnt()}</div>
									<div class="media-list-item-comment">${fList.get(j*5+i).getCommentCnt()}</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>

	</div>

	<!--------------상세보기----------------------------------->
	<div class="dv-mask">
		<div class="dv-bg"></div>
		<div class="dv-btn-close"></div>
		<div class="detail-view-container">
			<div class="dv-btn-wrapper">
				<div class="dv-btn-pre"></div>
				<div class="detail-view">
					<div class="dv-media-box">
						<img class="dv-media-box-img" src="" />
						<div class="dv-edit">
							<button class="dv-edit-btn">수정</button>
							<button class="dv-edit-btn">삭제</button>
						</div>
					</div>

					<div class="dv-comment-container">
						<!-- famPostView.jsp -->
					</div>
					
					<div class="dv-reg-box">
						<div class="dv-reg-pic"></div>
						<form>
							<fieldset>
								<input class="dv-reg-input" type="text" placeholder="댓글을 남기세요." />
								<input class="dv-reg-btn" type="button" value="등록" />
							</fieldset>
						</form>
					</div>
				</div>
				<div class="dv-btn-next"></div>
			</div>
		</div>
	</div>
	<!--------------등록--------------------------------------->
	<div class="ma-mask">
		<div class="ma-bg"></div>
		<div class="ma-btn-close"></div>
		<div class="media-add-container">
			<div class="media-add">
				<div class="media-add-box">
					<div class="media-add-box-bg"></div>
					<button class="media-add-btn">사진추가</button>
					<!--<img src=""/>-->
				</div>

				<div class="media-add-writer-container">
					<div class="media-writer-box">
						<div class="media-writer-pic"></div>
						<div class="media-writer-name">name</div>
						<div class="media-regdate">regdate</div>
					</div>

					<div class="text-add-box">
						<div class="font-box">
							폰트선택버튼
							<div class="font-style-select"></div>
							<div class="font-size-select"></div>
							<div class="font-color-select"></div>
							<div class="font-bold-select"></div>
							<div class="font-italic-select"></div>
							<div class="font-underline-select"></div>
						</div>

						<select class="folder-select">
							<option value="my gallery">my gallery</option>
							<option value="my gallery">fam gallery</option>
						</select>

						<div class="content-box">
							<input type="text" class="text-title" placeholder="title" />
							<textarea class="text-content" placeholder="content"></textarea>
						</div>

						<div class="check-box">
							<div class="neighbor-share-check-box">
								<input class="neighbor-share-check" type="checkbox"
									name="neighbor-share-check" value=" neighbor-share-check">
								<div class="neighbor-share">이웃과 공유</div>
							</div>

							<div class="vil-share-check-box">
								<input class="vil-share-check" type="checkbox"
									name="vil-share-check" value="vil-share-check">
								<div class="vil-share">마을에 공유</div>
							</div>
						</div>
					</div>

					<div class="media-add-reg-btn-box">
						<button class="media-add-reg-btn">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--------------메뉴바------------------------------------->
	<jsp:include page="../resource/inc/menu.jsp"></jsp:include>

</body>
</html>