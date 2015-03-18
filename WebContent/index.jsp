<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리 함께 | e - oot</title>
<link href="resource/css/bind_index.css" type="text/css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
<script src="resource/js/jquery-2.1.3.js"></script>
<script src="resource/js/modernizr.js" type="text/javascript"></script>
<script src="resource/js/index.js" type="text/javascript"></script>
</head>
<body>
    <main>
        <h1 class="hidden">e-oot</h1>

        <nav id="primary">
            <ul>
                <li><a class="login" href="#area1"></a></li>
                <li><a class="intro1" href="#area2"></a></li>
                <li><a class="intro2" href="#area3"></a></li>
                <li><a class="intro3" href="#area4"></a></li>
            </ul>
        </nav>

        <section id="area1">
            <h1 class="hidden">메인</h1>

            <div class="separator"></div>
                
                
                <div id="visual-cloud"></div>

                <article>
                    <h1 class="hidden">타이틀</h1>
                    <span>WELCOME HOME</span>
                    <p>e - oot</p>
                </article>

                <div id="visual-cloud2"></div>

                <div id="login-form">
                    <h2 class="hidden">회원로그인 폼</h2>

                    <form name="loginform" id="loginform">
                        <div id="login-email-wrapper">
                            <input type="text" name="uid" id="uid" placeholder="사용자 이메일"><br />
                            <p></p><br />
                        </div>
                        <div id="login-pwd-wrapper">
                            <input type="password" name="pwd" id="pwd" placeholder="비밀번호"><br />
                            <p></p><br />
                        </div>
                            <input type="button" id="btn-login" value="로그인" />
                            <input type="button" id="btn-reg-field" value="회원가입" />
                    </form>
                </div>

                <div id="reg-box">                         
                    <div id="reg-close-box">
                        <a></a>
                    </div>
                                               
                    <div id="reg-form">
                        <h2 class="hidden">회원가입 폼</h2>

                        <div id="reg-title">
                            <span>지금 이웃으로 오세요.</span>
                        </div>

                        <div id="reg-subtitle">
                            <span>주변 사람들과 더욱 더 가까워 질 수 있습니다.</span>
                        </div>
                        <div id="reg-form-box">
                            <form name="regform" id="regform">
                                <div id="reg-name-wrapper">
                                    <input type="text" name="reg-name" id="reg-name" placeholder="이름" />
                                    <p></p><br />
                                </div>
                                <div id="reg-email-wrapper">
                                    <input type="text" name="reg-uid" id="reg-uid" placeholder="이메일 주소(ID)" />
                                    <p></p><br />
                                </div>
                                <div id="reg-pwd-wrapper">
                                    <input type="password" name="reg-pwd" id="reg-pwd" placeholder="비밀번호" />
                                    <p></p><br />
                                </div>
                                <div id="reg-pwdcon-wrapper">
                                    <input type="password" name="reg-pwd-con" id="reg-pwd-con" placeholder="비밀번호 확인" />
                                    <p></p><br />
                                </div>
                                <div id="reg-birthday-wrapper">
                                    <select name="user-birthday-month" id="user-birthday-month">
                                        <option>월</option>
                                        <c:forEach var="i" begin="1" end="12">
                                        	<option value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>
                                    <select name="user-birthday-day" id="user-birthday-day">
                                        <option>일</option>
                                        <c:forEach var="i" begin="1" end="31">
                                        	<option value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>
                                    <select name="user-birthday-year" id="user-birthday-year">
                                        <option>년</option>
                                        <c:forEach var="i" begin="1905" end="2015" step="1" varStatus="loop">
                                        	<option value="${loop.end - i + loop.begin}">${loop.end - i + loop.begin}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div id="reg-txt">
                                    <span>
                                        회원가입을 함으로써 <a href="">이용약관</a>과 <a href="">개인정보 취급방침</a>에 동의하는 것입니다.<br />
                                        다른 사람들이 내가 입력한 이메일로 나를 찾을 수 있습니다.
                                    </span>
                                </div>
                                <input type="button" id="btn-reg" value="등록하기" />
                            </form>
                        </div>                          
                    </div>
                </div>

                <div id="visual-vill"></div>

                <div id="visual-bar">
                    <div id="visual-bar-vertical">
                        <a>e-oot?</a>
                    </div>
                </div>                           
        </section>

        <section id="area2">
            <div id="area2-title">
                <h1>추억을 기록하세요</h1>
            </div>

            <div class="visual-box">
                <div id="pic-ratio-box1">
                    <img src="resource/images/area2-pic1.jpg" />
                </div>
                <div id="pic-ratio-box2">
                    <img src="resource/images/area2-pic2.jpg" />
                </div>
            </div>

            <div class="visual-box">
                <div id="pic-ratio-box3">
                    <img src="resource/images/area2-pic3.jpg" />
                </div>
                    
                <div id="pic-ratio-box4">
                    <img src="resource/images/area2-pic4.jpg" />
                </div>

                <div id="pic-ratio-box5">
                    <img src="resource/images/area2-pic5.jpg" />
                </div>
            </div>

            <div class="visual-box">
                <div id="pic-ratio-box6">
                    <img src="resource/images/area2-pic6.jpg" />
                </div>

                <div id="pic-ratio-box7">
                    <img src="resource/images/area2-pic7.jpg" />
                </div>
            </div>
        </section>

        <section id="area3">                       
            <div id="pic-ratio-box8">
                <div id="area3-title">
                    <h1>이웃과 가까이 지내세요</h1>
                </div>
                <img src="resource/images/area3-pic.jpg" />                                       
            </div>
        </section>

        <section id="area4">
            <div id="area4-title">
                <h1>마음을 전하세요</h1>
            </div>

            <div class="visual-box">
                <div class="pic-ratio-box9">
                	<img id="pic1" src="resource/images/area4-pic1.jpg" />  
                </div>

                <div class="pic-ratio-box9">
					<img id="pic2" src="resource/images/area4-pic2.jpg" />
                </div>
					
                <div class="pic-ratio-box9">
					<img id="pic3" src="resource/images/area4-pic3.jpg" />
                </div>
            </div>
        </section>
    </main>
<!--회사소개 고객지원 시스템 현황 인재채용 이용약관 개인 정보 쿠키 광고 정보 브랜드 광고 비즈니스 미디어 개발자 -->
    <footer id="footer">
        <div id="footer-wrapper">
            <ul>
                <li>
                    <a href="">회사소개</a>
                    &nbsp;
                </li>
                <li>
                    <a href="">고객지원</a>
                    &nbsp;
                </li>
                <li>
                    <a href="">시스템</a>
                    &nbsp;
                </li>
                <li>
                    <a href="">현황</a>
                    &nbsp;
                </li>
                <li>
                    <a href="">인재채용</a>
                    &nbsp;
                </li>
                <li>
                    <a href="">이용약관</a>
                    &nbsp;
                </li>
                <li>
                    <a href="">개인 정보</a>
                    &nbsp;
                </li>
                <li>
                    <a href="">쿠키</a>
                    &nbsp;
                </li>
                <li>
                    <a href="">개발자</a>
                    &nbsp;
                </li>
            </ul>

            <span>© 2015 e-oot</span>
        </div>      
    </footer>
</body>
</html>