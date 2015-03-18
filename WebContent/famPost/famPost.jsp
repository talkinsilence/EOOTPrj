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
	
	FamPostDao famPostDao = new MyBFamPostDao();
	FamPost fp = famPostDao.getFamPost(code);
	//List<FamPost> fps = famPostDao.getFamPosts(); 
	
	pageContext.setAttribute("m", m);
	pageContext.setAttribute("fp", fp);
	//pageContext.setAttribute("fps", fps);
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/detail-view.css" rel="stylesheet" />
    <link href="../css/media-add.css" rel="stylesheet" />
    <link href="../css/media.css" rel="stylesheet" />
    <link href="../css/menubar.css" rel="stylesheet" />
    <link href="../css/reset.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="../js/jquery-2.1.3.js"></script>
    <script src="../js/menubar.js"></script>
    <script src="../js/media.js"></script>
    <script src="../js/modernizr.js"></script>
</head>

<body>
    <div class="media">
        <div class="main-media">
            <div class="main-media-box">
                <div class="main-media-box-L">
                    <img src="../images/김연아4.jpeg" />
                    <div class="mask"></div>
                    <div class="title">title title title title title title title title title</div>
                    <div class="date">2015.2.28</div>
                    <div class="content">contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent</div>
                    <div class="view">CLICK</div>
                </div>

                <div class="main-media-box-R">
                    <div class="main-media-box-R-top">
                        <img src="../images/김연아3.jpg" />
                    </div>

                    <div class="main-media-box-R-bottom">
                        <img src="../images/웃는놈1.jpg" />
                    </div>
                </div>
            </div>
        </div>

        <div class="my-menu">
            <button class="upload">
                upload
                <!--<select name="folder">
                    <option value="my-pic">내가 올린 사진</option>
                    <option value="scrap">스크랩</option>
                </select>-->
            </button>

            <input type="button" class="folder" value="folder" />

            <div class="folder-list-wrapper">
                <div class="folder-list">
                    <button class="folder-list-item">my gallery</button>
                    <button class="folder-list-item">fam gallery</button>
                </div>
            </div>

            <div class="search">
                <form>
                    <fieldset>
                        <input id="search-input" type="text" name="subject" placeholder="placeholder" />
                        <input id="search-button" type="submit" value="search" />
                    </fieldset>
                </form>
            </div>
        </div>

        <div class="media-lists">
            <div class="media-list-box">
                <div class="media-list-item-box">
                    <div class="media-list-item">
                        <img src="../images/김연아2.jpg" />
                        <div class="media-list-item-mask"></div>
                        <div class="media-list-item-like">0</div>
                        <div class="media-list-item-scrap">0</div>
                        <div class="media-list-item-comment"></div>
                    </div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item">
                        <img src="../images/김연아2.jpg" />
                        <div class="media-list-item-mask"></div>
                        <div class="media-list-item-like">0</div>
                        <div class="media-list-item-scrap">0</div>
                        <div class="media-list-item-comment"></div>
                    </div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
            </div>

            <div class="media-list-box">
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
            </div>

            <div class="media-list-box">
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
            </div>

            <div class="media-list-box">
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
            </div>

            <div class="media-list-box">
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
                <div class="media-list-item-box">
                    <div class="media-list-item"><img src="../images/김연아2.jpg" /></div>
                </div>
            </div>
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
                        <img class="dv-media-box-img" src="images/김연아4.jpeg" />
                        <div class="dv-edit">
                            <button class="dv-edit-btn">수정</button>
                            <button class="dv-edit-btn">삭제</button>
                        </div>
                    </div>

                    <div class="dv-comment-container">
                        <div class="dv-profile-box">
                            <div class="dv-profile-pic"></div>
                            <div class="dv-profile-name">박용우</div>
                            <div class="dv-profile-title">연아JAVA</div>
                            <div class="dv-profile-regdae">2015.3.14</div>
                        </div>

                        <div class="dv-content-popularity-wrapper">
                            <div class="dv-content-box">
                                <div class="dv-content">
                                    contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent
                                </div>
                            </div>

                            <div class="dv-popularity-box">
                                <button class="dv-like-cnt-btn">
                                    <div class="dv-like-img"><img src="../images/btn-like.png" /></div>
                                    <div class="dv-like-cnt">1111</div>
                                </button>
                                <button class="dv-scrap-cnt-btn">
                                    <div class="dv-scrap-img"><img src="../images/btn-scrap.png" /></div>
                                    <div class="dv-scrap-cnt">0</div>
                                </button>
                                <button class="dv-comment-cnt-btn">
                                    <div class="dv-comment-img"><img src="../images/btn-comment.png" /></div>
                                    <div class="dv-comment-cnt">777777777</div>
                                </button>
                            </div>
                        </div>

                        <div class="dv-comment-box-list">
                            <div class="dv-comment-box">
                                <div class="dv-comment-writer-pic"></div>
                                <div class="dv-comment-writer-name"></div>
                                <div class="dv-comment-regdate"></div>
                                <div class="dv-comment">akdfja;lfjal;kfjakfjal;kflkdfjalkjfal;ksjfalkfja;lskdjfal;kfjalkdjfalkjsfalkdjfalkjflaksfjlaksfjalsdk</div>
                            </div>

                            <div class="dv-comment-box">
                                <div class="dv-comment-writer-pic"></div>
                                <div class="dv-comment-writer-name"></div>
                                <div class="dv-comment-regdate"></div>
                                <div class="dv-comment">akdfja;lfjal;kfjakfjal;kflkdfjalkjfal;ksjfalkfja;lskdjfal;kfjalkdjfalkjsfalkdjfalkjflaksfjlaksfjalsdk</div>
                            </div>
                            <div class="dv-comment-box">
                                <div class="dv-comment-writer-pic"></div>
                                <div class="dv-comment-writer-name"></div>
                                <div class="dv-comment-regdate"></div>
                                <div class="dv-comment">akdfja;lfjal;kfjakfjal;kflkdfjalkjfal;ksjfalkfja;lskdjfal;kfjalkdjfalkjsfalkdjfalkjflaksfjlaksfjalsdk</div>
                            </div>
                            <div class="dv-comment-box">
                                <div class="dv-comment-writer-pic"></div>
                                <div class="dv-comment-writer-name"></div>
                                <div class="dv-comment-regdate"></div>
                                <div class="dv-comment">akdfja;lfjal;kfjakfjal;kflkdfjalkjfal;ksjfalkfja;lskdjfal;kfjalkdjfalkjsfalkdjfalkjflaksfjlaksfjalsdk</div>
                            </div>
                            <div class="dv-comment-box">
                                <div class="dv-comment-writer-pic"></div>
                                <div class="dv-comment-writer-name"></div>
                                <div class="dv-comment-regdate"></div>
                                <div class="dv-comment">akdfja;lfjal;kfjakfjal;kflkdfjalkjfal;ksjfalkfja;lskdjfal;kfjalkdjfalkjsfalkdjfalkjflaksfjlaksfjalsdk</div>
                            </div>

                        </div>


                    </div>
                    <div class="dv-reg-box">
                        <div class="dv-reg-pic"></div>
                        <input class="dv-reg-input" type="text" placeholder="댓글을 남기세요." />
                        <input class="dv-reg-btn" type="button" value="등록" />
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
                                <input class="neighbor-share-check" type="checkbox" name="neighbor-share-check" value=" neighbor-share-check">
                                <div class="neighbor-share">이웃과 공유</div>
                            </div>

                            <div class="vil-share-check-box">
                                <input class="vil-share-check" type="checkbox" name="vil-share-check" value="vil-share-check">
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
    <section>
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
                            <a href=""><img src="images/btn-scrapped.png" /></a>
                        </div>
                    </div>
                </div>

                <div class="img-button">
                    <div class="vertical-field1">
                        <div class="img-vertical-field2">
                            <a href=""><img src="images/btn_write.png" /></a>
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

</body>
</html>
