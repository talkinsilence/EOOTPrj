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
    <link href="../resource/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="../resource/css/bind_menu.css" rel="stylesheet" type="text/css" />
    <link href="css/bind_main.css" rel="stylesheet" type="text/css" />
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
	<jsp:include page="../resource/inc/menu.jsp"></jsp:include>

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
                <div class="alarm-wrapper">
                    <div class="alarm what">
                        <p class="hidden">음.. 뭐하지?</p> 
                    </div>
                    <div class="alarm let">
                        <p class="hidden">새로운 편지가 1통 도착했습니다.</p>
                    </div>
                    <div class="alarm cal">
                        <p class="hidden">오늘은 형수입학식입니다.</p>
                        <p class="hidden">장형수 님의 생일이 2주 남았습니다.</p>
                    </div>
                    <div class="alarm news">
                        <p class="hidden">새로운 소식이 99개 있습니다.</p>
                    </div>
                </div>
            </aside>
            <aside class="lower-right"> 809*406
                <div class="hello-wrapper">
                    <div class="hello">
                        <p>안부?</p>
                    </div>
                    <div class="hello">
                        <p>안부?</p>
                    </div>
                    <div class="hello">
                        <p>안부?</p>
                    </div>
                    <div class="hello">
                        <p>안부?</p>
                    </div>
                </div>
            </aside>
        </div>
        
    </div>

<!--===========< 편지쓰기 >===============================================-->
	<jsp:include page="../resource/inc/letter.jsp"></jsp:include>
	
</body>
</html>
