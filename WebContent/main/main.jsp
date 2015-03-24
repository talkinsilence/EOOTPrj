<%@page import="com.eoot.eootprj.dao.mybatis.MyBVilPostDao"%>
<%@page import="com.eoot.eootprj.dao.VilPostDao"%>
<%@page import="com.eoot.eootprj.model.VilPost"%>
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
	String _query = request.getParameter("query");
	if(_query != null && !_query.equals(""))
		query = _query;
	
	MemberDao memberDao = new MyBMemberDao();
	LetterDao letterDao = new MyBLetterDao();
	//VilPostDao vilPostDao = new MyBVilPostDao();
	
	Member m = memberDao.getMember(uid);
	String famcode = m.getFamcode();
	List<Member> fms = memberDao.getFamMembers(uid, famcode);
	
	List<LetterJoinMember> ls = letterDao.getLetters(uid, query);
	int lsSize = ls.size();
	
	List<LetterJoinMember> nls = letterDao.getNewLetters(uid);
	int nlsSize = nls.size();

	//List<VilPost> tvps = vilPostDao.getTopVilPosts(vcode);
	
	/* for( Member ms : fms)
		System.out.println(ms.getFamcode()); */
	//System.out.println("가족 구성원 : " + fms.size());
	
	pageContext.setAttribute("m", m);
	pageContext.setAttribute("fms", fms);
	pageContext.setAttribute("ls", ls);
	pageContext.setAttribute("lsSize", lsSize);
	pageContext.setAttribute("nlsSize", nlsSize);
	//pageContext.setAttribute("tvps", tvps);
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
                    <div class="user-menu"></div>
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
                    <div class="alarm news">
                        <div class="alarm-icon"></div>
                        <p>새로운 소식<br/>99개</p>
                    </div>
                    <div class="alarm let">
                        <div class="alarm-icon"></div>
                        <p >새로운 편지<br/>${nlsSize}통</p>
                    </div>
                    <div class="alarm cal">
                        <div class="alarm-icon"></div>
                        <p>다가오는<br />일정 99개</p>
                    </div>
                    <div class="alarm bday">
                        <div class="alarm-icon"></div>
                        <p>장형수 님의<br /> 생일</p>
                    </div>
                </div>
            </aside>
            <aside class="lower-right">
            	<div class="preview-wrapper">
	            	<div class="preview-fampost-wrapper">
	            		<div class="preview-fampost pic-box">
		                    <img class="preview-pic" src="images/byul2.jpg"/>
		                    <div class="preview-pic-dscrp hidden"></div>
		                </div>
		                <div class="preview-fampost pic-box">
		                    <img class="preview-pic" src="images/byul22.jpg"/>
		                    <div class="preview-pic-dscrp hidden"></div>
		                </div>
		                <div class="preview-fampost text-box">
		                    <p class="fampost-text-box">봄 봄 봄 봄이 왔어요 프로젝트 반드시 완성시킨다!!!!!!!!!!으랏챠챠챠챠챠챠챠챠챠 파이팅파이팅파이팅!!!!!★</p>
		                </div>
		                <div class="preview-fampost pic-box">
		                    <img class="preview-pic" src="images/byul222.png"/>
		                    <div class="preview-pic-dscrp hidden"></div>
		                </div>
		                <div class="preview-fampost text-box">
		                    <p class="fampost-text-box">봄 봄 봄 봄이 왔어요 프로젝트 반드시 완성시킨다!!!!!!!!!!으랏챠챠챠챠챠챠챠챠챠 파이팅파이팅파이팅!!!!!★</p>
		                </div>
		                <div class="preview-fampost pic-box">
		                    <img class="preview-pic" src="images/byul2222.jpg"/>
		                    <div class="preview-pic-dscrp hidden"></div>
		                </div>
	            	</div>
	            	<div class="preview-vilpost-wrapper">
	            		<span>주변 인기게시물</span>
	            		<%-- <c:forEach var="i" items="${tvps}" > --%>
		            		<div class="preview-vilpost pic-box">
			                    <img class="preview-pic" src="images/shakerbrand-thum.jpg" />
			                    <div class="preview-pic-dscrp hidden"></div>
			                </div>
			                <div class="preview-vilpost text-box">
			                	<%-- <c:if test="${i.sort.equals('1')}">
									<div class="village-board-label 1"></div>
								</c:if>
								<c:if test="${i.sort.equals('2')}">
									<div class="village-board-label 2"></div>
								</c:if>
								<c:if test="${i.sort.equals('3')}">
									<div class="village-board-label 3"></div>
								</c:if>
								<c:if test="${i.sort.equals('4')}">
									<div class="village-board-label 4"></div>
								</c:if> --%>
								<div class="village-board-label"></div>
			                    <p class="text-box-title">${i.title}</p>
			                    <p class="text-box-content">${i.content}</p>
			                </div>
		                <%-- </c:forEach> --%>
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
                <div class="letter-box-header-total">총 ${lsSize}개</div>
                <div class="letter-box-search">
                    <input class="letter-search" type="text" name="query" value="${param.query}"/>
                    <div id="letter-search"></div>
                </div>
            </div>
            <c:if test="${empty ls}">
            	<div class="letter-item-box-empty">편지함에 편지가 없습니다</div>
            </c:if>
            <c:if test="${not empty ls}">
	            <div class="letter-item-box">
	                <ul class="letter-items">
	                	<c:forEach var="i" items="${ls}" >
	                	<c:if test="${i.read == 1}">
		                    <li class="letter-item">
		                </c:if>
		                <c:if test="${i.read == 0}">
		                    <li class="letter-item red">
		                </c:if>
		                        <div class="letter-code hidden">${i.code}</div>
		                        <div class="letter-read hidden">${i.read}</div>
		                        <div class="letter-title">${i.title}</div>
		                        <div class="letter-from">from: ${i.name}</div>
		                        <div class="letter-date"><fmt:formatDate value="${i.sendDate}" pattern="yyyy년 MM월 dd일 " /></div>
		                    </li>
	                    </c:forEach>
	                </ul>
	            </div>
            </c:if>
            <button id="letter-write" type="submit">편지쓰기</button>
        </div>
		
		<div class="letter-view-wrapper">
			<div class="letter-view-transp-bg"></div>
			<div class="btn-close-letter-view"></div>
			<div class="letter-view-box">
				<div class="letter-view"></div>
			</div>
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
