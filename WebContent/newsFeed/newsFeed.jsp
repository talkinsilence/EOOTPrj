<%@page import="com.eoot.eootprj.model.VilPost"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBVilPostDao"%>
<%@page import="com.eoot.eootprj.dao.VilPostDao"%>
<%@page import="com.eoot.eootprj.model.FamPostJoinMember"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.model.FamPost"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
	String uid = (String) session.getAttribute("uid");
	String code = request.getParameter("code");

	MemberDao memberDao = new MyBMemberDao();
	Member m = memberDao.getMember(uid);
	
	/* FamPostDao famPostDao = new MyBFamPostDao();
	List<FamPostJoinMember> fps = famPostDao.getFamPosts();  */
	
	pageContext.setAttribute("m", m);
	//pageContext.setAttribute("fps", fps);
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../resource/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="../resource/css/bind_menu.css" rel="stylesheet" type="text/css" />    
    <link href="css/bind_newsFeed.css" rel="stylesheet" type="text/css" />
    <script src="../resource/js/modernizr.js" type="text/javascript"></script>
    <script src="../resource/js/jquery-2.1.3.js"></script>
    <script src="../resource/js/menu.js" type="text/javascript"></script>
    <script src="js/newsFeed.js" type="text/javascript"></script>
</head>
<body>

<!--===========< 메뉴영역 >===============================================-->
	<jsp:include page="../resource/inc/menu.jsp"></jsp:include>
<!--===========< 뉴스피드 툴바 >=============================================-->
    <section>
        <h1 class="hidden">뉴스피드 툴바</h1>

        <div id="toolbar">
            <div class="toolbar-bg"></div>
            <div class="toolbar-main">
                <div class="toolbar-logo">
                    e-oot
                </div>
                <div class="toolbar-search">
                    <input type="search" class="news-search" placeholder="." />
                    <div id="news-search"></div>
                </div>
                <div class="toolbar-user">
                    <div class="profile-pic-box">
                        <h1 class="hidden">프로필사진</h1>
                        <a href="../main/main.jsp"><img class="thumbnail" src="${m.profilepic}" /></a>
                    </div>
                    <div class="toolbar-info">
                        <span class="user name">${m.name}</span>
                        <span class="user id">${m.mid}</span>
                        <span class="user log-out-toolbar">로그아웃</span>
                    </div>
                </div>
                <div class="toolbar-opt"></div>
                <div class="opt-wrapper">
	                <div class="opt popular">인기소식</div>
	                <div class="opt recent">최근소식</div>
                </div>
            </div>
        </div>
    </section>
<!--===========< 뉴스피드 >===============================================-->
    <div class="main">
        <div class="wrapper">
        
			<c:forEach var="i" items="${fps}" >
            <div class="post">
                <div class="post-header-wrapper">
                    <div class="post-header">
                        <div class="profile-pic-box">
                            <h1 class="hidden">프로필사진</h1>
                            <img class="thumbnail" src="images/suzy1.jpg" />
                        </div>
                        <div class="post-info">
                            <div class="post-info-writer">
                                <h1 class="hidden">작성자이름</h1>
                                <p>${i.name}</p>
                            </div>
                            <div class="post-info-wrapper">
                                <div class="post-info-sharing-details">
                                    <h1 class="hidden">공유범위</h1>
                                    <div>마을에 게시</div>
                                </div>
                                <div class="post-info-date">
                                    <h1 class="hidden">작성일(또는 작성시간)</h1>
                                    <div><fmt:formatDate value="${i.regdate}" pattern="yyyy년 MM월 dd일  HH:mm:ss" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="post-user-menu-btn"></div>
                		<div class="post-user-menu-area hidden">
                 		    <div class="post-user-menu-wrapper-bg"></div>
                 		    <c:if test="${m.mid == i.writer}">
	                 		    <div class="post-user-menu-wrapper me">
			                	    <div class="post-user-menu edit-post">수정하기</div>
			                	    <div class="post-user-menu delete-post">삭제하기</div>
	                		    </div>
                		    </c:if>
                		    <c:if test="${m.mid != i.writer}">
	                 		    <div class="post-user-menu-wrapper you">
			                	    <div class="post-user-menu report-post">신고하기</div>
	                		    </div>
                		    </c:if>
               			</div>
                    </div>
                </div>
                <div class="post-main-wrapper">
                    <div class="post-main">
                        <div class="post-content">
                            <div>
                                ${i.content}
                            </div>
                            <div class="post-content-more">(더 보기)</div>
                        </div>
                    </div>
                </div>
                <img class="post-main-img" src="images/bobby1.jpg" />
                <!--<img class="post-main-img hidden">(동영상대표이미지)</img>-->
                <div class="post-popularity-wrapper">
                    <div class="post-popularity">
                        <div class="post-popularity-item like">
                            <h1 class="hidden">좋아요 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-like.png" />
                            <div class="post-popularity-cnt clearfix">${i.likeCnt}</div>
                        </div>
                        <div class="post-popularity-item scrap">
                            <h1 class="hidden">스크랩 횟수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-scrap.png" />
                            <div class="post-popularity-cnt clearfix">${i.clipCnt}</div>
                        </div>
                        <div class="post-popularity-item comment">
                            <h1 class="hidden">댓글 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-comment.png" />
                            <div class="post-popularity-cnt clearfix">${i.commentCnt}</div>
                        </div>
                    </div>
                </div>
                <div class="post-footer-wrapper">
                    <div class="post-footer">                   
                        <ul class="post-like-list hidden"><li>(좋아요한 사람)</li></ul>
                        <ul class="post-scrap-list hidden"><li>(스크랩한 사람)</li></ul>
                    </div>
                </div>
                <div class="post-comment-wrapper">
                    <div class="post-comment">
                        <ul class="post-comment-list">
                            <li> 
                                <div class="profile-pic-box-s">
                                    <h1 class="hidden">댓글작성자프로필사진</h1>
                                    <img class="thumbnail" src="images/hjw.jpg" />
                                </div>
                                <div class="comment-info">
                                    <div class="comment-info-writer">
                                        <h1 class="hidden">댓글작성자이름</h1>
                                        <p>남명이</p>
                                    </div>
                                    <div class="comment-info-date">
                                        <h1 class="hidden">댓글작성일(또는 작성시간)</h1>
                                        <p>3일 전</p>
                                    </div>
                                    <div class="comment-like">
                                        <h1 class="hidden">댓글좋아요개수</h1>
                                        <img class="comment-like-btn" src="../resource/images/btn-like-s.png" />
                                        <div class="comment-like-cnt clearfix">1</div>
                                    </div>   
                                </div>      
                                <p class="comment-content">
                                    댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
                                </p>
                            </li>
                            <li>
                                <div class="profile-pic-box-s">
                                    <h1 class="hidden">댓글작성자프로필사진</h1>
                                    <img class="thumbnail" src="images/dog.png" />
                                </div>
                                <div class="comment-info">
                                    <div class="comment-info-writer">
                                        <h1 class="hidden">댓글작성자이름</h1>
                                        <p>무니무니</p>
                                    </div>
                                    <div class="comment-info-date">
                                        <h1 class="hidden">댓글작성일(또는 작성시간)</h1>
                                        <p>어제</p>
                                    </div>
                                    <div class="comment-like">
                                        <h1 class="hidden">댓글좋아요개수</h1>
                                        <img class="comment-like-btn" src="../resource/images/btn-like-s.png" />
                                        <div class="comment-like-cnt clearfix">2</div>
                                    </div>
                                </div>
                                <p class="comment-content">
                                    댓글내용
                                </p>
                            </li>
                        </ul>
                        <div class="post-comment-write">
                            <div class="profile-pic-box-s">
                                <h1 class="hidden">댓글작성자프로필사진</h1>
                                <img class="thumbnail" src="../resource/images/img-profile-default.png" />
                            </div>
                            <input type="text" placeholder="댓글을 남겨주세요." />
                            <input type="button" class="comment-submit" value="등록" />
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            
                    
        </div>
    </div>
    
</body>
</html>
