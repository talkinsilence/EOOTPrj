<%@page import="com.eoot.eootprj.model.FamPostCommentJoinMember"%>
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
    <link href="css/bind.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="modernizr.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="js/menubar.js" type="text/javascript"></script>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script src="js/map.js" type="text/javascript"></script>
    <script src="js/btn.js" type="text/javascript"></script>
    <link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
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
                        <div id="map_canvas"></div>
                    </div>
                </div>

        <!------------------------------------------------------------- 메인 영역 ------------------------------------------------------------------->

                <div>
                    <h1 class="hidden">뉴스피드</h1>
                    <div class="village-sub-area">

					<div class="e-oot-newsfeed">
						<img class="e-oot-newsfeed-background" src="refimg/b00.png" />
						<div class="e-oot-newsfeed">
							<p class="empty-space">이웃 뉴스피드</p>
							<span><a href=""><img id="e-oot-newsfeed-board"
									src="refimg/e-oot-board.png" /></a></span>
							<div class="e-oot-newsfeed-prev-btn">
								<img id="e-oot-newsfeed-item-btn" src="refimg/btn-up.png" />
							</div>
							<div class="e-oot-newsfeed-clipper">
								<ul class="e-oot-newsfeed-list">
									<c:forEach var="fpjm" items="${FPJM}">
										<li class="e-oot-newsfeed-item"><a href=""><div id="e-oot-newsfeed-item-img">
											<img class="thumbnail" src="${fpjm.profilepic}" />												</div>
											<p id="e-oot-newsfeed-item-content1">${fpjm.name}</p>
											<p id="e-oot-newsfeed-item-content2">${fpjm.title}</p></a>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div class="e-oot-newsfeed-next-btn">
								<img id="e-oot-newsfeed-item-btn" src="refimg/btn-down.png" />
							</div>
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
											<img id="village-newsfeed-item-img" src="refimg/village-board-post.png" />
										</c:if>
											<p id="village-newsfeed-item-content1">${i.name}</p>
											<p id="village-newsfeed-item-content2">${i.title}</p>
									</a></li>
	                                </c:forEach>
								</ul>
                            </div>
                            <div class="village-newsfeed-next-btn"><img id="village-newsfeed-item-btn" src="refimg/btn-down.png" /></div>
                        </div>                      

        <!------------------------------------------------------------- 서브 영역2 ------------------------------------------------------------------->

                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>