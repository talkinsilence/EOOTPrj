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
    <link href="css/bind_main_e.css" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
    <script src="http://maps.google.com/maps/api/js?sensor=false"></script>   
    <script src="../resource/js/modernizr.js" type="text/javascript"></script>
    <script src="../resource/js/jquery-2.1.3.js"></script>
    <script src="../resource/js/menu.js" type="text/javascript"></script>
    <script src="js/main_e.js" type="text/javascript"></script> 
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
                        <!--<div class="logo1">e</div>
                        <div class="logo2">-</div>
                        <div class="logo3">o</div>
                        <div class="logo4">o</div>
                        <div class="logo5">t</div>-->
                    </div>
                    <div id="map-canvas">
                        <!--집 위치 맵-->
                    </div>
                    <div class="eoot-menu">
                        <span class="eoot-menu-letter">편지쓰기</span>　│　
                        <span class="eoot-menu-info">정보</span>　│　
                        <span class="eoot-menu-add">가까운 이웃 추가</span>  
                    </div>
                    <div class="family-name">
                        상도동 과일가게
                    </div>
                    <div class="profile-family-members-wrapper">
                        <!--가족구성원-->
                        <!--<div class="profile-family-members">
                            <img class="thumbnail" src="images/dog.png" />
                        </div>
                        <div class="profile-family-members">
                            <img class="thumbnail" src="images/suzy2.jpg" />
                        </div>-->
                        <div class="profile-family-members">
                            <img class="thumbnail" src="images/nami3.jpg" />
                        </div>
                        <!--<div class="profile-family-members">
                            <img class="thumbnail" src="images/bobby1.jpg" />
                        </div>-->
                    </div>
                </div>
            </aside>
        </div>

        <div class="lower">
            <aside class="lower-left">
                <!--왼쪽 아래) 알림창-->
                <div class="alarm-wrapper">
                    <!--<div class="flakes"></div>-->
                    <!--<div class="alarms">
                        <p><a href="">새로운 소식 99개</a></p>
                    </div>-->
                    <!--<div class="pop-up">
                        <p>새로운 소식 10개</p>
                    </div>-->
                    <!--<div class="line"></div>-->
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
            </aside>
            <aside class="lower-right">
                <!--오른쪽 아래) 최근/인기소식-->
                <div class="post-wrapper">

                </div>
            </aside>
        </div>
        
    </div>

    <!--===========< 편지쓰기 >===============================================-->
    <div class="letter">

        <div class="letter-transp-bg"></div>
        <div class="btn-close"></div>

        <div class="letter-type-wrapper">
            <div class="letter-type text">
                <input class="letter-type-btn hidden" type="button" value="글" />
            </div>
            <div class="letter-type voice">
                <input class="letter-type-btn hidden" type="button" value="음성" />
            </div>
            <div class="letter-type video">
                <input class="letter-type-btn hidden" type="button" value="영상" />
            </div>
        </div>

        <div class="letter-write-wrapper">
            <div class="letter-write-header">
                <div class="letter-to">받는 사람</div>
                <div class="letter-to-list-wrapper">
                    <div class="letter-to-list">
                        <img class="thumbnail" src="images/nami3.jpg" />
                        <div class="delete"></div>
                    </div>
                    <div class="letter-to-list">
                        <img class="thumbnail" src="images/bobby1.jpg" />
                        <div class="delete"></div>
                    </div>
                    <div class="letter-to-list-add"></div>
                </div>
            </div>
            <textarea class="letter-title" rows="1" placeholder="제목"></textarea>
            <div class="letter-write-box">
                <textarea class="letter-write" placeholder="내용을 입력해주세요"></textarea>
            </div>
            <button class="letter-send" type="submit">보내기</button>
        </div>

        <div class="letter-add-wrapper">
            <div>
                <span>수신인을 추가하세요</span>
            </div>
            <div class="check-box">
                <input id="check-box" type="checkbox" />가족 모두에게
            </div>
            <div class="letter-add-list-box">
                <div class="letter-add-list-wrapper">
                    <div class="letter-add-list">
                        <img class="thumbnail" src="images/ljh.jpg" />
                        <div class="add"></div>
                    </div>
                    <div class="letter-add-list">
                        <img class="thumbnail" src="images/taeyang.jpg" />
                        <div class="add"></div>
                    </div>
                    <div class="letter-add-list">
                        <img class="thumbnail" src="images/cat.png" />
                        <div class="add"></div>
                    </div>
                    <div class="letter-add-list">
                        <img class="thumbnail" src="images/dog.png" />
                        <div class="add"></div>
                    </div>
                </div>
            </div>
            <button class="letter-add" type="submit">추가</button>
        </div>

    </div>
</body>
</html>