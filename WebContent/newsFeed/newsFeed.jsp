﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../resource/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="../resource/css/bind_menu.css" rel="stylesheet" type="text/css" />
    <link href="css/bind_newsFeed.css" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
    <script src="../resource/js/modernizr.js" type="text/javascript"></script>
    <script src="../resource/js/jquery-2.1.3.js"></script>
    <script src="js/newsFeed.js" type="text/javascript"></script>
</head>
<body>
<!--===========< 메뉴영역 >===============================================-->
	<jsp:include page="../resource/inc/menu.jsp"></jsp:include>
<!--===========< 툴바 >===================================================-->
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
                        <img class="thumbnail" src="images/pcm.jpg" />
                    </div>
                    <div class="toolbar-info">
                        <span class="user name">참무니</span>
                        <span class="user id">chanmooni@eoot.com asdfasdfasdfadsfadsf</span>
                        <span class="user log-out">로그아웃</span>
                    </div>
                </div>
                <div class="toolbar-opt"></div>
                <div class="view-opt popular">인기소식</div>
                <div class="view-opt recent">최근소식</div>
            </div>
        </div>
    </section>
<!--===========< 뉴스피드 >===============================================-->
    <div class="main">
        <div class="wrapper">
        
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
                        <div class="post-content">
                            <div>
                                JSON (JavaScript Object Notation) is a lightweight data-interchange format. It is easy for humans to read and write. It is easy for machines to parse and generate. It is based on a subset of the JavaScript Programming Language, Standard ECMA-262 3rd Edition - December 1999.
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
                            <div class="post-popularity-cnt clearfix">1789</div>
                        </div>
                        <div class="post-popularity-item scrap">
                            <h1 class="hidden">스크랩 횟수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-scrap.png" />
                            <div class="post-popularity-cnt clearfix">1</div>
                        </div>
                        <div class="post-popularity-item comment">
                            <h1 class="hidden">댓글 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-comment.png" />
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
                                설연휴가 훅 가버렸넹.....ㅠㅠ
                            </div>
                            <div class="post-content-more">(더 보기)</div>
                        </div>
                    </div>
                </div>
                <img class="post-main-img" src="images/hjw.jpg" />
                <!--<img class="post-main-img hidden">(동영상대표이미지)</img>-->
                <div class="post-popularity-wrapper">
                    <div class="post-popularity">
                        <div class="post-popularity-item like">
                            <h1 class="hidden">좋아요 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-like.png" />
                            <div class="post-popularity-cnt clearfix">1789</div>
                        </div>
                        <div class="post-popularity-item scrap">
                            <h1 class="hidden">스크랩 횟수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-scrap.png" />
                            <div class="post-popularity-cnt clearfix">1</div>
                        </div>
                        <div class="post-popularity-item comment">
                            <h1 class="hidden">댓글 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-comment.png" />
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
                                    이웃 파이팅..♥
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
                                    승과니과니
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
                <img class="post-main-img" src="images/shakerbrand-thum.jpg" />
                <!--<img class="post-main-img hidden">(동영상대표이미지)</img>-->
                <div class="post-popularity-wrapper">
                    <div class="post-popularity">
                        <div class="post-popularity-item like">
                            <h1 class="hidden">좋아요 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-like.png" />
                            <div class="post-popularity-cnt clearfix">1789</div>
                        </div>
                        <div class="post-popularity-item scrap">
                            <h1 class="hidden">스크랩 횟수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-scrap.png" />
                            <div class="post-popularity-cnt clearfix">1</div>
                        </div>
                        <div class="post-popularity-item comment">
                            <h1 class="hidden">댓글 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-comment.png" />
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
                            <li></li>
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
                <img class="post-main-img" src="images/suzy1.jpg" />
                <!--<img class="post-main-img hidden">(동영상대표이미지)</img>-->
                <div class="post-popularity-wrapper">
                    <div class="post-popularity">
                        <div class="post-popularity-item like">
                            <h1 class="hidden">좋아요 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-like.png" />
                            <div class="post-popularity-cnt clearfix">1789</div>
                        </div>
                        <div class="post-popularity-item scrap">
                            <h1 class="hidden">스크랩 횟수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-scrap.png" />
                            <div class="post-popularity-cnt clearfix">1</div>
                        </div>
                        <div class="post-popularity-item comment">
                            <h1 class="hidden">댓글 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-comment.png" />
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
                            <li></li>
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
                <img class="post-main-img" src="images/shakerbrand-thum.jpg" />
                <!--<img class="post-main-img hidden">(동영상대표이미지)</img>-->
                <div class="post-popularity-wrapper">
                    <div class="post-popularity">
                        <div class="post-popularity-item like">
                            <h1 class="hidden">좋아요 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-like.png" />
                            <div class="post-popularity-cnt clearfix">1789</div>
                        </div>
                        <div class="post-popularity-item scrap">
                            <h1 class="hidden">스크랩 횟수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-scrap.png" />
                            <div class="post-popularity-cnt clearfix">1</div>
                        </div>
                        <div class="post-popularity-item comment">
                            <h1 class="hidden">댓글 개수</h1>
                            <img class="post-popularity-btn" src="../resource/images/btn-comment.png" />
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
                            <li></li>
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
            
        </div>
    </div>
</body>
</html>
