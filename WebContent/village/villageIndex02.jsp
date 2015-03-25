﻿<%@page import="com.eoot.eootprj.model.FamPostCommentJoinMember"%>
<%@page import="com.eoot.eootprj.model.FamPostFile"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamPostFileDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostCommentDao"%>
<%@page import="com.eoot.eootprj.dao.FamPostFileDao"%>
<%@page import="com.eoot.eootprj.model.FamPostJoinMember"%>
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
	FamPostDao famPostDao = new MyBFamPostDao();
	FamPostFileDao famPostFileDao = new MyBFamPostFileDao();
	FamPostCommentDao famPostCommentDao = new MyBFamPostCommentDao();
	
	List<VilPostJoinMember> list = vilPostDao.getVilPosts(query, "TITLE");
	List<VilPostFile> fList = vilPostFileDao.getVilPostFiles();
	List<VilPostCommentJoinMember> cList = vilPostCommentDao.getVilPostComments();
	List<FamPostJoinMember> FPJM = famPostDao.getFamPosts(query);
	//List<FamPostFile> FPF = famPostFileDao.getFamPostFiles();
	//List<FamPostCommentJoinMember> FPCJM = famPostCommentDao.getFamPostComments(famPostCode);

	pageContext.setAttribute("list", list);
	pageContext.setAttribute("fList", fList);
	pageContext.setAttribute("cList", cList);
	pageContext.setAttribute("FPJM", FPJM);
	//pageContext.setAttribute("FPF", FPF);
	//pageContext.setAttribute("FPCJM", FPCJM);
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bind02.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="js/menubar.js" type="text/javascript"></script>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script src="js/map.js" type="text/javascript"></script>
    <script src="js/btn.js" type="text/javascript"></script>
    <link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
    <title></title>   
</head>
<body onload="initialize()">
    <div class="body">
        <header id="header">
            <section>
                <h1 class="hidden">회원 메뉴</h1>

                <!-- Menu 1 -->
                <nav id="menu1">
                    <h1 class="hidden">메뉴 1</h1>

                    <div id="menu_button"></div>

                    <div id="buttons">
                        <div class="button">
                            <div class="vertical-field1">
                                <div class="vertical-field2">
                                    <span class="vertical_text">우리집</span>
                                </div>
                            </div>
                        </div>

                        <div class="visual"></div>

                        <div class="button">
                            <div class="vertical-field1">
                                <div class="vertical-field2">
                                    <span class="vertical_text">이 웃</span>
                                </div>
                            </div>
                        </div>

                        <div class="visual"></div>

                        <div class="button">
                            <div class="vertical-field1">
                                <div class="vertical-field2">
                                    <span class="vertical_text">마 을</span>
                                </div>
                            </div>
                        </div>

                        <div class="visual"></div>

                        <div id="separator"></div>

                        <div class="img-button">
                            <div class="vertical-field1">
                                <div class="img-vertical-field2">
                                    <a href=""><img src="refimg/btn-scrapped.png" /></a>
                                </div>
                            </div>
                        </div>

                        <div class="img-button">
                            <div class="vertical-field1">
                                <div class="img-vertical-field2">
                                    <a href=""><img src="refimg/btn_write.png" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>

                <!--Menu 2-->
                <nav id="menu2">
                    <h1 class="hidden">메뉴 2</h1>

                    <div id="menu_button"><input type="button" value="닫기" id="menu2_hide" /></div>

                    <div id="buttons">
                        <div class="button">
                            <div class="vertical-field1">
                                <div class="vertical-field2">
                                    <span class="vertical_text">달 력</span>
                                </div>
                            </div>
                        </div>

                        <div class="visual"></div>

                        <div class="button">
                            <div class="vertical-field1">
                                <div class="vertical-field2">
                                    <span class="vertical_text">앨 범</span>
                                </div>
                            </div>
                        </div>

                        <div class="visual"></div>

                        <div class="button">
                            <div class="vertical-field1">
                                <div class="vertical-field2">
                                    <span class="vertical_text">편 지 함</span>
                                </div>
                            </div>
                        </div>

                        <div class="visual"></div>

                        <div class="button">
                            <div class="vertical-field1">
                                <div class="vertical-field2">
                                    <span class="vertical_text">택 배</span>
                                </div>
                            </div>
                        </div>

                        <div class="visual"></div>

                        <div class="button">
                            <div class="vertical-field1">
                                <div class="vertical-field2">
                                    <span class="vertical_text">설 정</span>
                                </div>
                            </div>
                        </div>

                        <div class="visual"></div>

                    </div>
                </nav>
            </section>
        </header>

        <!------------------------------------------------------------- 메뉴(헤더) 영역 ------------------------------------------------------------------->

        <main id="main">
            <div id="village-main-area">
                <div class="search-wrapper">
                    <form class="search">
                        <fieldset>
                            <legend class="hidden">검색필드</legend>
                            <input id="search-input" type="text" name="query" value="${param.query}" placeholder="Search e-oot" />
                            <input id="search-button" type="submit" value="검색" />
                        </fieldset>
                    </form>
                    <input id="write-button" type="button" value="글 쓰기" />
                </div>

                <div class="wrapper">
                <%-- <c:forEach var="i" items=""> --%>
                    <div class="post">

                        <div class="post-header-wrapper">
                            <div class="post-header">
                                <div class="profile-pic-box">
                                    <h1 class="hidden">프로필사진</h1>
                                    <img class="thumbnail" src="refimg/suzy1.jpg" />
                                </div>
                                <div class="post-info">
                                    <div class="post-info-writer">
                                        <h1 class="hidden">작성자이름</h1>
                                        <div>수지</div>
                                    </div>
                                    <div class="post-info-wrapper">
                                        <div class="post-info-sharing-details">
                                            <h1 class="hidden">공유범위</h1>
                                            <div>마을에 게시</div>
                                        </div>
                                        <div class="post-info-date">
                                            <h1 class="hidden">작성일(또는 작성시간)</h1>
                                            <div>2015년 2월 15일</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="post-main-wrapper">
                            <div class="post-main">
                                <div class="post-content-wrapper">
                                    <div class="post-content">
                                        동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세
                                    </div>
                                    <div class="post-content-more">(더 보기)</div>
                                </div>
                            </div>
                        </div>

                        <img class="post-main-img" src="refimg/img00.jpg" />
                        <!--<img class="post-main-img hidden">(동영상대표이미지)</img>-->
                        <div class="post-popularity-wrapper">
                            <div class="post-popularity">
                                <div class="post-popularity-item like">
                                    <h1 class="hidden">좋아요 개수</h1>
                                    <img class="post-popularity-btn" src="refimg/btn-like.png" />
                                    <div class="post-popularity-cnt clearfix">1789</div>
                                </div>
                                <div class="post-popularity-item scrap">
                                    <h1 class="hidden">스크랩 횟수</h1>
                                    <img class="post-popularity-btn" src="refimg/btn-scrap.png" />
                                    <div class="post-popularity-cnt clearfix">1</div>
                                </div>
                                <div class="post-popularity-item comment">
                                    <h1 class="hidden">댓글 개수</h1>
                                    <img class="post-popularity-btn" src="refimg/btn-comment.png" />
                                    <div class="post-popularity-cnt clearfix">2</div>
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
                                            <img class="thumbnail" src="refimg/hjw.jpg" />
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
                                                <img class="comment-like-btn" src="refimg/btn-like-s.png" />
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
                                            <img class="thumbnail" src="refimg/dog.png" />
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
                                                <img class="comment-like-btn" src="refimg/btn-like-s.png" />
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
                                        <img class="thumbnail" src="refimg/default-profile-pic.png" />
                                    </div>
                                    <input class="post-input-text" type="text" placeholder="댓글을 남겨주세요." />
                                    <input class="post-input-button" type="button" value="등록" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- </c:forEach> --%>
                </div>
            </div>
            </main>
        <!------------------------------------------------------------- 메인 영역 ------------------------------------------------------------------->
            <aside>
                <!--<div>
                    <h1 class="hidden">뉴스피드</h1>
                    <div class="village-sub-area">
                        <div class="e-oot-newsfeed">
                            <div id="map_canvas"></div>
                            <div class="e-oot-newsfeed hidden">
                                <p class="empty-space">이웃 뉴스피드</p>
                                <span><a href=""><img id="e-oot-newsfeed-board" src="refimg/e-oot-board.png" /></a></span>
                                <div class="e-oot-newsfeed-prev-btn"><img id="e-oot-newsfeed-item-btn" src="refimg/btn-up.png" /></div>
                                <div class="e-oot-newsfeed-clipper">
                                    <ul class="e-oot-newsfeed-list">
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/suzy1.jpg" /></div><p id="e-oot-newsfeed-item-content1">배수지</p><p id="e-oot-newsfeed-item-content2">이웃을 응원합니다.</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/img00.jpg" /></div><p id="e-oot-newsfeed-item-content1">하연수</p><p id="e-oot-newsfeed-item-content2">이웃 뉴스피드 화면입니다.</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/img01.jpg" /></div><p id="e-oot-newsfeed-item-content1">하연수</p><p id="e-oot-newsfeed-item-content2">서브 레이아웃의 이웃 뉴스피드 화면입니다.</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/hjw.jpg" /></div><p id="e-oot-newsfeed-item-content1">하정우</p><p id="e-oot-newsfeed-item-content2">안녕하세요. 하정우입니다. 반갑습니다.</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/dog.png" /></div><p id="e-oot-newsfeed-item-content1">Kakao Talk Dog</p><p id="e-oot-newsfeed-item-content2">카카오톡개. 옐로우카드</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/ljh.jpg" /></div><p id="e-oot-newsfeed-item-content1">넌 이름이 뭐냐</p><p id="e-oot-newsfeed-item-content2">종진이 수수께끼 고맙습니다.</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/bobby1.jpg" /></div><p id="e-oot-newsfeed-item-content1">바비</p><p id="e-oot-newsfeed-item-content2">쇼미더머니, 언프리티 랩스타 종샴</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/suzy1.jpg" /></div><p id="e-oot-newsfeed-item-content1">배수지</p><p id="e-oot-newsfeed-item-content2">이웃을 응원합니다.</p></a></li>
                                    </ul>
                                </div>
                                <div class="e-oot-newsfeed-next-btn"><img id="e-oot-newsfeed-item-btn" src="refimg/btn-down.png" /></div>
                            </div>
                        </div>                        

                        <div class="village-newsfeed">
                            <p class="empty-space">마을 뉴스피드</p>
                            <span><a href=""><img id="e-oot-newsfeed-board" src="refimg/village-board.png" /></a></span>
                            <div class="village-newsfeed-prev-btn"><img id="village-newsfeed-item-btn" src="refimg/btn-up.png" /></div>
                            <div class="village-newsfeed-clipper">
                                <ul class="village-newsfeed-list">
                                    <li class="village-newsfeed-item"><a href=""><img id="village-newsfeed-item-img" src="refimg/village-board-group.png" /><p id="village-newsfeed-item-content1">장영남</p><p id="village-newsfeed-item-content2">이번주 북한산 등산하실 분 모집합니다. 같이 갑시다</p></a></li>
                                    <li class="village-newsfeed-item"><a href=""><img id="village-newsfeed-item-img" src="refimg/village-board-normal.png" /><p id="village-newsfeed-item-content1">찬문찬문</p><p id="village-newsfeed-item-content2">이번주 내내 날씨가 추우니 따듯하게 입으세요.</p></a></li>
                                    <li class="village-newsfeed-item"><a href=""><img id="village-newsfeed-item-img" src="refimg/village-board-normal.png" /><p id="village-newsfeed-item-content1">현정행님</p><p id="village-newsfeed-item-content2">황사가 너무 심합니다. 마스크 쓰고 댕기세요. 감기걸립니다.</p></a></li>
                                    <li class="village-newsfeed-item"><a href=""><img id="village-newsfeed-item-img" src="refimg/village-board-shopping.png" /><p id="village-newsfeed-item-content1">니승</p><p id="village-newsfeed-item-content2">니승니승니승니승니승과니과니과니과니과니과니과니과니과니과니과니과니과니과니</p></a></li>
                                    <li class="village-newsfeed-item"><a href=""><img id="village-newsfeed-item-img" src="refimg/village-board-group.png" /><p id="village-newsfeed-item-content1">종표행님</p><p id="village-newsfeed-item-content2">남양주 출퇴근 같이 하실분 구해요. 카풀해요~ 신촌은 너무 멀다멀다멀다멀다멀다</p></a></li>
                                    <li class="village-newsfeed-item"><a href=""><img id="village-newsfeed-item-img" src="refimg/village-board-shopping.png" /><p id="village-newsfeed-item-content1">임종진뚱보</p><p id="village-newsfeed-item-content2">세븐나이츠 아이디 팔아요 ~ 제곧내</p></a></li>
                                </ul>
                            </div>
                            <div class="village-newsfeed-next-btn"><img id="village-newsfeed-item-btn" src="refimg/btn-down.png" /></div>
                        </div> 
                        
                    </div>
                </div>-->
                <div>
                    <h1 class="hidden">뉴스피드</h1>
                    <div class="village-sub-area">
                        <div class="e-oot-newsfeed">
                            <div id="map_canvas"></div>
                            <div class="e-oot-newsfeed hidden">
                                <img class="e-oot-newsfeed-background" src="refimg/b00.png" />
                                <p class="empty-space">이웃 뉴스피드</p>
                                <img id="e-oot-newsfeed-board" src="refimg/e-oot-board.png" />
                                <div class="e-oot-newsfeed-prev-btn"><img id="e-oot-newsfeed-item-btn" src="refimg/btn-up.png" /></div>
                                <div class="e-oot-newsfeed-clipper">
                                    <ul class="e-oot-newsfeed-list">
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/suzy1.jpg" /></div><p id="e-oot-newsfeed-item-content1">배수지</p><p id="e-oot-newsfeed-item-content2">이웃을 응원합니다.</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/img00.jpg" /></div><p id="e-oot-newsfeed-item-content1">하연수</p><p id="e-oot-newsfeed-item-content2">이웃 뉴스피드 화면입니다.</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/img01.jpg" /></div><p id="e-oot-newsfeed-item-content1">하연수</p><p id="e-oot-newsfeed-item-content2">서브 레이아웃의 이웃 뉴스피드 화면입니다.</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/hjw.jpg" /></div><p id="e-oot-newsfeed-item-content1">하정우</p><p id="e-oot-newsfeed-item-content2">안녕하세요. 하정우입니다. 반갑습니다.</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/dog.png" /></div><p id="e-oot-newsfeed-item-content1">Kakao Talk Dog</p><p id="e-oot-newsfeed-item-content2">카카오톡개. 옐로우카드</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/ljh.jpg" /></div><p id="e-oot-newsfeed-item-content1">넌 이름이 뭐냐</p><p id="e-oot-newsfeed-item-content2">종진이 수수께끼 고맙습니다.</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/bobby1.jpg" /></div><p id="e-oot-newsfeed-item-content1">바비</p><p id="e-oot-newsfeed-item-content2">쇼미더머니, 언프리티 랩스타 종샴</p></a></li>
                                        <li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img"><img class="thumbnail" src="refimg/suzy1.jpg" /></div><p id="e-oot-newsfeed-item-content1">배수지</p><p id="e-oot-newsfeed-item-content2">이웃을 응원합니다.</p></a></li>
                                    </ul>
                                </div>
                                <div class="e-oot-newsfeed-next-btn"><img id="e-oot-newsfeed-item-btn" src="refimg/btn-down.png" /></div>
                            </div>
                        </div>

                        <!------------------------------------------------------------- 서브 영역1 ------------------------------------------------------------------->

                        <div class="village-newsfeed">
                            <img class="e-oot-newsfeed-background" src="refimg/b01.png" />
                            <p class="empty-space">마을 뉴스피드</p>
                            <span><a href=""><img id="village-newsfeed-board" src="refimg/village-board.png" /></a></span>
                            <div class="village-newsfeed-prev-btn"><img id="village-newsfeed-item-btn" src="refimg/btn-up.png" /></div>
                            <div class="village-newsfeed-clipper">
                                <ul class="village-newsfeed-list">
		                            <c:forEach var="i" items="${list}">
									<li class="village-newsfeed-item">
										<a href="">
										<c:if test="${i.sort.equals('1')}">
											<img id="village-newsfeed-item-img" src="refimg/village-board-normal.png" />
										</c:if>
										<c:if test="${i.sort.equals('2')}">
											<img id="village-newsfeed-item-img" src="refimg/village-board-group.png" />
										</c:if>
										<c:if test="${i.sort.equals('3')}">
											<img id="village-newsfeed-item-img" src="refimg/village-board-shopping.png" />
										</c:if>
										<c:if test="${i.sort.equals('4')}">
											<img id="village-newsfeed-item-img" src="refimg/village-board-normal.png" />
										</c:if>
											<p id="village-newsfeed-item-content1">${i.name}</p>
											<p id="village-newsfeed-item-content2">${i.title}</p>
									</a></li>
	                                </c:forEach>
								</ul>
                            </div>
                            <div class="village-newsfeed-next-btn"><img id="village-newsfeed-item-btn" src="refimg/btn-down.png" /></div>
                        </div>

                    </div>
                </div>
            </aside>
        </main>
    </div>
</body>
</html>