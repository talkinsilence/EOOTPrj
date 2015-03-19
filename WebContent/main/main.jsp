<%@page import="com.eoot.eootprj.model.LetterJoinMember"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBLetterDao"%>
<%@page import="com.eoot.eootprj.dao.LetterDao"%>
<%@page import="com.eoot.eootprj.model.Letter"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
	String uid = (String) session.getAttribute("uid");

	String query = "";
	String _query = request.getParameter("q");
	if(_query != null && !_query.equals(""))
		query = _query;
	
	MemberDao memberDao = new MyBMemberDao();
	LetterDao letterDao = new MyBLetterDao();
	
	Member m = memberDao.getMember(uid);
	String famcode = m.getFamcode();
	List<Member> fms = memberDao.getFamMembers(uid, famcode);
	List<LetterJoinMember> lts = letterDao.getLetters(uid, query);
	int ltSize = lts.size();	
	
	for( Member ms : fms)
		System.out.println(ms.getFamcode());
	//System.out.println("가족 구성원 : " + fms.size());
	
	pageContext.setAttribute("m", m);
	pageContext.setAttribute("fms", fms);
	pageContext.setAttribute("lts", lts);
	pageContext.setAttribute("ltSize", ltSize);
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../resource/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="../resource/css/bind_menu.css" rel="stylesheet" type="text/css" />    
    <link href="css/bind_main.css" rel="stylesheet" type="text/css" />
    <link href="css/bind_letter.css" rel="stylesheet" type="text/css" />
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
                        <img class="thumbnail" src="${m.profilepic}" />
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
                        <c:forEach var="i" items="${fms}" >
	                        <div class="profile-family-members">
	                            <img class="thumbnail" src="${i.profilepic}" />
	                        </div>
                        </c:forEach>
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
                        <p class="hidden"><a href="../newsFeed/newsFeed.jsp">새로운 소식이 99개 있습니다.</a></p>
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

<!--===========< 편지  >===============================================-->
    <div class="letter">

        <div class="letter-transp-bg"></div>
        <div class="btn-close"></div>

        <div class="letter-box-wrapper">
            <div class="letter-box-header">
                <div class="letter-box-header-title">편지함</div>
                <div class="letter-box-header-total">총 ${ltSize}개</div>
                <div class="letter-box-search">
                    <input class="letter-search" type="search" />
                    <div id="letter-search"></div>
                </div>
            </div>
            <c:if test="${empty lts}">
            	<div class="letter-item-box-empty">편지함에 편지가 없습니다</div>
            </c:if>
            <c:if test="${not empty lts}">
	            <div class="letter-item-box">
	                <ul class="letter-items">
	                	<c:forEach var="i" items="${lts}" >
	                	<c:if test="${i.read == 1}">
		                    <li class="letter-item">
		                </c:if>
		                <c:if test="${i.read == 0}">
		                    <li class="letter-item red">
		                </c:if>
		                        <div class="letter-title">${i.title}</div>
		                        <div class="letter-from">from: ${i.name}</div>
		                        <div class="letter-date"><fmt:formatDate value="${i.sendDate}" pattern="yyyy년 MM월 dd일 " /></div>
		                        <div class="letter-mani hidden">
		                            <!-- <img class="letter-like" src="../images/btn-like.png" />
		                            <img class="letter-like" src="../images/btn-scrap.png" /> -->
		                        </div>
		                    </li>
	                    </c:forEach>
	                </ul>
	            </div>
            </c:if>
            <button id="letter-write" type="submit">편지쓰기</button>
        </div>

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
        
        <div class="write-and-add">
        
	        <div class="letter-write-wrapper">
	            <div class="letter-write-header">
	                <div class="letter-to">받는 사람</div>
	                <div class="letter-to-list-wrapper">
	                    <!-- <div class="letter-to-list">
	                        <img class="thumbnail" src="images/suzy2.jpg" />
	                        <div class="delete"></div>
	                    </div>
	                    <div class="letter-to-list">
	                        <img class="thumbnail" src="images/taeyang.jpg" />
	                        <div class="delete"></div>
	                    </div>
	                    <div class="letter-to-list">
	                        <img class="thumbnail" src="images/cat.png" />
	                        <div class="delete"></div>
	                    </div> -->
	                    <div class="letter-to-list-add"></div>
	                </div>
	            </div>
	            <textarea id="title" rows="1" placeholder="제목"></textarea>
	            <div class="letter-write-box">
	                <textarea id="write" placeholder="내용을 입력해주세요"></textarea>
	            </div>
	            <button id="letter-send" type="submit">보내기</button>
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
	                        <img class="thumbnail" src="images/bobby1.jpg" name="밥이"/>
	                    </div>
	                    <div class="letter-add-list">
	                        <img class="thumbnail" src="images/nami3.jpg" name="영남이"/>
	                    </div>
	                    <div class="letter-add-list">
	                        <img class="thumbnail" src="../resource/images/img-profile-default.png" name="뉴렉이"/>
	                    </div>
	                    <div class="letter-add-list">
	                        <img class="thumbnail" src="../resource/images/img-profile-default.png" name="제임스"/>
	                    </div>
	                </div>
	            </div>
	            <button id="letter-add-cancel" type="submit">취소</button>
	        </div>
	        
        </div>
	</div>
	
</body>
</html>
