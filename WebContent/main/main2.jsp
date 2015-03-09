﻿<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBatisMain"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String mid = "chanmoon@naver.com";
	MemberDao dao = new MyBMemberDao();

	Member m = dao.getMember(mid);

	//Member m = memberDao.getMember(_mid);
	
	pageContext.setAttribute("m", m);
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>우리 함께 | e - oot</title>
    <link href="css/bind_main2.css" type="text/css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
    <script src="../resources/js/modernizr.js" type="text/javascript"></script>
    <script src="../resources/js/jquery-2.1.3.js"></script>
    <script src="js/main2.js" type="text/javascript"></script>
</head>
<body>
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
                    </div>
                </div>
                <div class="btn-down"></div>
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
</body>
</html>
