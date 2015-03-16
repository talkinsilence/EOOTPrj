﻿<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="com.eoot.eootprj.dao.VilPostDao"%>
<%@ page import="com.eoot.eootprj.model.VilPost"%>
<%@ page import="com.eoot.eootprj.dao.mybatis.MyBVilPostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String sort = request.getParameter("Sort");
	
	VilPostDao vilPostDao = new MyBVilPostDao();
	List<VilPost> n = vilPostDao.getVilPosts();
	List<VilPost> list = vilPostDao.getVilPosts();
	
	pageContext.setAttribute("n", n);
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("sort", sort);
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bind03.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="modernizr.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="js/menubar.js" type="text/javascript"></script>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script src="js/map.js" type="text/javascript"></script>
    <script src="js/btn.js" type="text/javascript"></script>
    <script src="js/jquery-1.11.2.js" type="text/javascript"></script>
    <link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
    <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">-->
    <!--<script src="//code.jquery.com/jquery-1.10.2.js"></script>-->
    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
    <!--<link rel="stylesheet" href="/resources/demos/style.css">-->
    <script>
        $(function () {
            $(".accordion").accordion({
                collapsible: true
                , active: false
            });
        });
        
        /* $(function () {
            $("#accordion").toggle(function(){
            	$("#accordion").accordion({
                    collapsible: true
                    , active: false
                });
            });
        }); */
         
        /*$(document).ready(function(){
        	$("#accordion").accordion({
        		collasible: true
        		, active: false
        	});
        }); */
    </script>
    <title></title>
</head>
<body onload="initialize()">
    <div>
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

        <div>
            <main id="main">
                <div>
                    <h1 class="hidden">마을영역</h1>
                    <div class="village-main-area">
                        <div class="search-wrapper">
                            <form class="search">
                                <fieldset>
                                    <legend class="hidden">검색필드</legend>
                                    <input id="search-input" type="text" placeholder="Search e-oot" />
                                    <input id="search-button" type="button" value="검색" />
                                </fieldset>
                            </form>
                            <input id="write-button" type="button" value="글 쓰기" />
                        </div>
                        
                        <div class="village-board-list-wrapper">
						<c:forEach var="i" items="${list}" >
							<div class="village-board-list">
								<div class="village-board-item1">
									<c:if test="${param.sort == 1}">
										<div class="village-board-label1"></div>
									</c:if>
									<c:if test="${param.sort == 2}">
										<div class="village-board-label2"></div>
									</c:if>
									<c:if test="${param.sort == 3}">
										<div class="village-board-label3"></div>
									</c:if>
									<c:if test="${param.sort == 4}">
										<div class="village-board-label4"></div>
									</c:if>
									<div class="village-board-item-img">
										<img class="thumbnail2" src="refimg/suzy1.jpg" />
									</div>
									<div class="village-board-item-text00">
										<p id="village-board-item-title">${i.regdate}</p>
										<p id="village-board-item-user">${i.writer}</p>
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
								</div>

								<div class="accordion">
									<div>
										<div class="village-board-item2">
											<p>${i.title}</p>
										</div>
										<img class="village-board-item3" src="refimg/etc_img.png" />
									</div>
									<div id="village-board-item2-text">
										<p>${i.title}</p>
										<p>${i.content}</p>
										<img id="village-board-item2-img" src="refimg/bobby1.jpg" />
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					
                        <!--==============================================================================================-->

                    </div>
                </div>
            
        </div>

        <!------------------------------------------------------------- 메인 영역 ------------------------------------------------------------------->




        <aside>

            <div>
                <h1 class="hidden">뉴스피드</h1>
                <div class="village-sub-area">
                    <div class="e-oot-newsfeed">
                    <img class="e-oot-newsfeed-background" src="refimg/b00.png" />
                        <div class="e-oot-newsfeed">
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
                        <div id="map_canvas"></div>
                        <p class="empty-space">마을 뉴스피드</p>
                        <div class="village-newsfeed hidden">
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
                </div>
            </div>

            <!------------------------------------------------------------- 서브 영역2 ------------------------------------------------------------------->
        </aside>
    </div>

</body>
</html>