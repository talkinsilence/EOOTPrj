<%@page import="com.eoot.eootprj.dao.mybatis.MyBVilPostDao"%>
<%@page import="com.eoot.eootprj.model.VilPost"%>
<%@page import="com.eoot.eootprj.dao.VilPostDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBNeighborDao"%>
<%@page import="com.eoot.eootprj.dao.NeighborDao"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String uid = (String) session.getAttribute("uid");
	String eid = request.getParameter("eid");	

	String query = "";
	String _query = request.getParameter("query");
	if(_query != null && !_query.equals(""))
	   query = _query;
	
	MemberDao memberDao = new MyBMemberDao();
	//VilPostDao vilPostDao = new MyBVilPostDao();
	
	Member m = memberDao.getMember(uid);
	String famcode = m.getFamcode();
	List<Member> fms = memberDao.getFamMembers(uid, famcode);
	
	NeighborDao neighborDao = new MyBNeighborDao();
	
	Member em = memberDao.getMember(eid);
	
	VilPostDao vilDao = new MyBVilPostDao();
	   
   	List<VilPost> v = vilDao.getTop2VilPosts();
	   //List<VilPost> tvps = vilPostDao.getTopVilPosts(vcode);
	   
	   /* for( Member ms : fms)
	      System.out.println(ms.getFamcode()); */
	   //System.out.println("가족 구성원 : " + fms.size());
   	pageContext.setAttribute("v", v);
	
	//List<VilPost> tvps = vilPostDao.getTopVilPosts(vcode);
	
	/* for( Member ms : fms)
	   System.out.println(ms.getFamcode()); */
	//System.out.println("가족 구성원 : " + fms.size());
	
	pageContext.setAttribute("m", m);
	pageContext.setAttribute("em", em);
	pageContext.setAttribute("fms", fms);
	//pageContext.setAttribute("nfms", nfms);
	//pageContext.setAttribute("tvps", tvps);
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../resource/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="../resource/css/bind_menu.css" rel="stylesheet" type="text/css" />
    <link href="css/bind_main_e.css" rel="stylesheet" type="text/css" />
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
                    </div>
                    <div id="map-canvas">
                        <!--집 위치 맵-->
                    </div>
                    <div class="eoot-menu">
                        <span class="eoot-menu-letter">편지쓰기</span>　│　
                        <!-- <span class="eoot-menu-info">정보</span>　│　 -->
                        <span class="eoot-menu-add">가까운 이웃 추가</span>  
                    </div>
                    <div class="family-name">
                    	<c:if test="${empty em.famname}">
                    		${em.name}님의 집
                    	</c:if>
                    
                    	<c:if test="${not empty em.famname}">
                    		${em.famname}
                    	</c:if>
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
				<div class="alarm-wrapper">
				준비중입니다 :D
                    <!-- <div class="alarm news">
                        <div class="alarm-icon"></div>
                    </div>
                    <div class="alarm let">
                        <div class="alarm-icon"></div>
                    </div>
                    <div class="alarm cal">
                        <div class="alarm-icon"></div>
                    </div>
                    <div class="alarm bday">
                        <div class="alarm-icon"></div>
                    </div> -->
                </div>
            </aside>
            <aside class="lower-right">
               <div class="preview-wrapper">
                  <div class="preview-fampost-wrapper">
                  	<ul id="slider">
                  		<%-- <c:forEach var="i" items="${prvfps}" > --%>
	                  		<li class="firstanimation">
		                  		<div class="preview-fampost pic-box">
	                            	<img class="preview-pic" src="images/byul2.jpg"/>
	                            	<div class="preview-pic-dscrp hidden"></div>
		                        </div>
	                  		</li>
							<li class="secondanimation">
		                  		<div class="preview-fampost pic-box">
	                            	<img class="preview-pic" src="images/byul22.jpg"/>
	                            	<div class="preview-pic-dscrp hidden"></div>
		                        </div>
	                  		</li>
	                  		<li class="thirdanimation">
		                  		<div class="preview-fampost pic-box">
	                            	<img class="preview-pic" src="images/byul3.jpg"/>
	                            	<div class="preview-pic-dscrp hidden"></div>
		                        </div>
	                  		</li>
	                  		<li class="fourthanimation">
		                  		<div class="preview-fampost pic-box">
	                            	<img class="preview-pic" src="images/byul2222.jpg"/>
	                            	<div class="preview-pic-dscrp hidden"></div>
		                        </div>
	                  		</li>
	                  		<li class="fifthanimation">
		                  		<div class="preview-fampost pic-box">
	                            	<img class="preview-pic" src="images/byul22222.jpg"/>
	                            	<div class="preview-pic-dscrp hidden"></div>
		                        </div>
	                  		</li>
                  		<%-- </c:forEach> --%>
                  	</ul>
                  </div>
                  <div class="preview-vilpost-wrapper">
                     <span>주변 인기게시물</span>
                     <ul>
                     	<c:forEach var="v" items="${v}" >
	                     	<li class="preview-vp-item">
	                     		<div class="preview-vilpost pic-box">
	                             <img class="preview-pic" src="${pageContext.request.servletContext.contextPath}/upload/profilepic/${j.profilepic}${v.src}" />
	                             <div class="preview-pic-dscrp hidden"></div>
		                         </div>
		                         <div class="preview-vilpost text-box">
		                        <div class="village-board-label"></div>
		                             <p class="text-box-title">${v.title}</p>
		                             <p class="text-box-content">${v.content }</p>
		                         </div>
	                     	</li>
	                     </c:forEach>
                     </ul>
                  </div>
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
                <div class="letter-to-box">
                   <div class="letter-to-list-wrapper">
                      <ul class="added">
                         <li class="letter-reply-to">
                              <img class="thumbnail" src="" />
                              <div class="reply-to-name"></div>
                          </li>
                      </ul>
                       <div class="letter-to-list-add"></div>
                   </div>
                </div>
            </div>
            <textarea id="title" rows="1" placeholder="제목"></textarea>
            <div class="letter-write-box">
                <textarea id="content" placeholder="내용을 입력해주세요"></textarea>
            </div>
            <button id="letter-send" type="submit">보내기</button>
            <button id="letter-send-reply" type="submit">보내기</button>
        </div>
   
        <div class="letter-add-wrapper">
            <div>
                <span>수신인을 추가하세요</span>
            </div>
            <div class="letter-add-list-box eoot">
                <div class="letter-add-list-wrapper">
                <ul class="adding">
                   <%-- <c:forEach var="i" items="${nfms}" >
                      <li class="letter-add-list">
                          <div class="reader-mid hidden">${i.mid}</div>
                           <img class="thumbnail" src="${pageContext.request.servletContext.contextPath}/upload/profilepic/${i.profilepic}"/>
                           <div class="reader-name">${i.name}</div>
                       </li>
                   </c:forEach> --%>    
                </ul>  
                </div>
            </div>
            <!-- <button id="letter-add-cancel" type="submit">취소</button> -->
        </div>

   </div>
</body>
</html>
