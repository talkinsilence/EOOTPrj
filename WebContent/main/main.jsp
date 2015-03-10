<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String uid = (String) session.getAttribute("uid");

	MemberDao memberDao = new MyBMemberDao();
	Member m = memberDao.getMember(uid);
	//Member m = memberDao.getMember(_mid);
	
	pageContext.setAttribute("m", m);
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../resource/css/bind_menu.css" rel="stylesheet" type="text/css" />
    <link href="css/main_layout.css" rel="stylesheet" type="text/css" />
    <link href="css/main_style.css" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
    <script src="../resource/js/modernizr.js" type="text/javascript"></script>
    <script src="../resource/js/jquery-2.1.3.js"></script>
    <script src="../resource/js/menu.js" type="text/javascript"></script>
    <script src="js/main.js" type="text/javascript"></script>
</head>
<body>

<!--===========< 메뉴영역 >===============================================-->
    <section>
        <h1 class="hidden">회원 메뉴</h1>

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
                            <a href=""><img src="../resource/images/btn-scrapped.png" /></a>
                        </div>
                    </div>
                </div>

                <div class="img-button">
                    <div class="vertical-field1">
                        <div class="img-vertical-field2">
                            <a href=""><img src="../resource/images/btn_write.png" /></a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>


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

<!--===========< 메인영역 >===============================================-->

    <div class="main">

        <div class="upper">
            <div class="profile-pic-box-bg">
                <!--배경이미지-->
                <img class="thumbnail" src="images/white.jpg">
            </div>
            <aside class="upper-left">
                <div class="transp-bg">
                    <!--음영-->
                </div>
                <div class="profile">
                    <div class="logo">
                        e-oot
                    </div>
                    <div class="profile-pic-box-main">
                        <!--프로필사진-->
                        <img class="thumbnail" src="images/pcm.jpg" />
                    </div>
                    <div class="profile-id">
                        <!--이메일-->
                        ${m.mid}
                    </div>
                    <div class="profile-name">
                        <!--이름-->
                        ${m.name}
                    </div>
                    <div class="profile-family-members-wrapper">
                        <!--가족구성원-->
                        <div class="profile-family-members">
                            <img class="thumbnail" src="images/dog.png" />
                        </div>
                        <div class="profile-family-members">
                            <img class="thumbnail" src="images/suzy2.jpg" />
                        </div>
                        <div class="profile-family-members">
                            <img class="thumbnail" src="images/nami3.jpg" />
                        </div>
                    </div>
                </div>
            </aside>
        </div>

        <div class="lower">
            <aside class="lower-left">
                <!--왼쪽 아래) 알림창-->
                <div class="btn-up"></div>
                <div class="alarms-box">
                    <div class="alarms-wrapper">
                        <div class="alarm-letter">
                            <a href="">별이 님으로부터 편지가 1통 도착했습니다.</a>
                        </div>
                        <div class="alarm-cal">
                            <a href="">장형수 님의 생일이 2주 남았습니다.</a>
                        </div>
                        <div class="alarm-cal">
                            <a href="">오늘은 형수입학식입니다.</a>
                        </div>
                        <div class="alarm-news">
                            <a href="">새로운 소식이 99개 있습니다.</a>
                        </div>
                        <div class="alarm-cal">
                            <a href="">오늘은 형수입학식입니다.</a>
                        </div>
                    </div>
                </div>
                <div class="btn-down"></div>
                <!-- <div class="btn-menu-wrapper">
                    <div class="btn-menu cal">일정</div>
                    <div class="btn-menu med">사진첩</div>
                    <div class="btn-menu let">우체통</div>
                    <div class="btn-menu scr">스크랩</div>
                    <div class="btn-menu set">설정</div>
                </div> -->
            </aside>
            <aside class="lower-right">
                <!--오른쪽 아래) 최근/인기소식-->
                <div class="post-wrapper">
                    <div class="post"></div>
                    <div class="post"></div>
                    <div class="post"></div>
                    <div class="post"></div>
                </div>
                <!--<div class="hello-wrapper">
                    <div class="transp-bg"></div>
                    <div class="hello">
                        <p>이모 : 남봉아 별이는 잘 크고 있냐</p>
                        <p>이웃집1 : 안녕하세요 옆집입니다. 저번에 보니까 집안에 개를 키우시던데, 그렇게 큰 개를 아파트에서 키워도 되나요?</p>
                        <p>홍길동 : 이 집 김치찌개 맛있음 ㅇㅇ</p>
                        <p>jQuery UI is built for designers and developers alike. We've designed all of our plugins to get you up and running quickly while being flexible enough to evolve with your needs and solve a plethora of use cases.</p>
                    </div>
                </div>-->
                <!--<div class="btn-menu-wrapper">
                    <div class="btn-menu cal">일정</div>
                    <div class="btn-menu med">사진첩</div>
                    <div class="btn-menu let">우체통</div>
                    <div class="btn-menu scr">스크랩</div>
                    <div class="btn-menu set">설정</div>
                </div>-->
            </aside>
        </div>
        
    </div>
    <div class="info-wrapper">
        <div>
            data
        </div>
    </div>
</body>
</html>
