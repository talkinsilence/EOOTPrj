<%@page import="com.eoot.eootprj.model.NeighborJoinMember"%>
<%@page import="com.eoot.eootprj.dao.NeighborDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBNeighborDao"%>
<%@page import="com.eoot.eootprj.model.FamInvitation"%>
<%@page import="com.eoot.eootprj.model.FamInvitationJoinMember"%>
<%@page import="com.eoot.eootprj.dao.FamInvitationDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBFamInvitationDao"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String uid = (String) session.getAttribute("uid");

	MemberDao memberDao = new MyBMemberDao();
	FamInvitationDao famInvDao = new MyBFamInvitationDao();
	NeighborDao neighborDao = new MyBNeighborDao();
	
	Member m = memberDao.getMember(uid);
	String famcode = m.getFamcode();
	
	List<Member> fms = memberDao.getFamMembers(uid, famcode);
	List<FamInvitationJoinMember> famInvsMe = famInvDao.getInvsMe(uid);
	List<FamInvitationJoinMember> finvs = famInvDao.getInvs(uid);
	List<NeighborJoinMember> neis = neighborDao.getNeiInvs(uid);
	List<NeighborJoinMember> neisMe = neighborDao.getNeiInvsMe(uid);
	List<NeighborJoinMember> neighbors = neighborDao.getNeighbors(uid);
	
	pageContext.setAttribute("m", m);
	pageContext.setAttribute("fms", fms);
	pageContext.setAttribute("famInvsMe", famInvsMe);
	pageContext.setAttribute("finvs", finvs);
	pageContext.setAttribute("neis", neis);
	pageContext.setAttribute("neisMe", neisMe);
	pageContext.setAttribute("neighbors", neighbors);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리 함께 | e - oot</title>
<link href="../resource/css/reset.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
<script src="../resource/js/jquery-2.1.3.js"></script>
<script src="../resource/js/modernizr.js" type="text/javascript"></script>
<link href="../resource/css/bind_menu.css" rel="stylesheet" type="text/css">
<script src="../resource/js/menu.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/settings.js" type="text/javascript"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>
<link href="css/jquery-ui.css" rel="stylesheet">
<link href="css/bind_settings.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../resource/inc/menu.jsp"></jsp:include>

    <main id="main">
        <div id="content-wrapper">
            <div id="profile-edit">
                <div id="profile-edit-body">
                    <div id="profile-edit-viewer-wrapper">
                        <div id="profile-edit-viewer">
                            <img id="profile-edit-thumbnail" src="" />
                        </div>
                    </div>

                    <div id="profile-upload-form">
                        <form name="formProfile" id="formProfile" method="post" enctype="multipart/form-data" action="updateProfilePic.jsp">
                            <input type="file" name="file" id="profile-edit-file" onchange="profileReadURL(this);"/>
                            <div id="profile-upload-select-wrapper">
                                <input type="button" id="btn-upload-select" value="사진 선택" /><br />
                            </div>
                            <input type="button" id="btn-upload-set" value="사진 등록" />
                            <input type="button" id="btn-upload-cancel" class="btn-cancel" value="취소" />
                        </form>
                    </div>
                </div>
            </div>           
			
			<div id="myhome-edit">
				<div id="myhome-edit-body">
					<div id="myhome-edit-viewer-wrapper">
						<div id="myhome-edit-viewer">
							<img id="myhome-edit-thumbnail" src="" />
						</div>
					</div>
					
					<div id="myhome-upload-form">
						<form name="formMyHome" id="formMyhome" method="post" enctype="multipart/form-data" action="updateProfileBg.jsp">
							<input type="file" name="file-bg" id="myhome-edit-file" onchange="myHomeReadURL(this);" />
							<input type="button" id="btn-myhome-upload-select" value="사진 선택" />
							<input type="button" id="btn-myhome-upload-set" value="사진 등록" />
							<input type="button" id="btn-myhome-upload-cancel" value="취소">
						</form>				
					</div>
				</div>
			</div>
			
            <div id="settings-body">   

                <div id="title">
                    <h1>설 정</h1>
                </div>
                
                <div id="profile">             
                    <div id="profile-pic-box-main">
                        <img id="profile-thumbnail" src="${pageContext.request.servletContext.contextPath}/upload/profilepic/${m.profilepic}" />
                    </div>

                    <div id="profile-wrapper">
                        <div id="profile-wrapper2">
                            <div>
								이메일 : ${m.mid}
                            </div>
                            <div>
								이름 : <label id="profile-name-val">${m.name}</label>
                                <label id="profile-name-wrapper">
                                    &nbsp;&nbsp;
                                    <input type="text" id="profile-name-txt" name="txt" maxlength="20"/>
                                    <input type="button" id="btn-profile-name" value="확인" />
                                    <input type="button" id="btn-name-cancel" class="btn-cancel" value="취소" />
                                </label>

                                <label id="profile-name-edit" class="edit">수정</label>
                            </div>
                            <div>
								우리집 이름 : <label id="profile-famname-val">${m.famname}</label>
                            </div>
                            <div>
								우리집 주소 : <label id="profile-address-val">${m.address}</label>
                            </div>
                        </div>
                    </div>
                </div>                

                <div id="accordion">
                    <h3>우 리 집</h3>
                    <div>
						<c:if test="${not empty famInvsMe}">
							<c:forEach var="fInvsMe" items="${famInvsMe}">
		                        <div id="invited">
		                            <ul>
		                                <li class="link">
		                                    <a target="_blank" href="../main/main_e.jsp?fc=${fInvsMe.famcode}">${fInvsMe.name}</a>&nbsp;님이 나를 가족으로 초대하고 싶어합니다. 수락하시겠습니까?
		                                    <p>수락하시면 현재 가족페이지의 모든 자료는 삭제되고,<br />${fInvsMe.name}님의 가족페이지에 있는 자료를 공유하게 됩니다.</p>
		                                    <input type="button" class="btn-invited-accept" value="수락" onclick="famInvMeAccept('${fInvsMe.askmid}')" />
		                                    <input type="button" class="btn-invited-reject btn-cancel" value="거절" onclick="famInvMeReject('${fInvsMe.askmid}')"/>
		                                </li>
		                            </ul>
		                        </div>
	                        </c:forEach>
                        </c:if>

                        <div id="myhome-name">
                           	 우리집 이름 : 
                           	<label id="profile-myhome-name-val">
								<c:if test="${empty m.famname}">
									우리집 이름을 설정해주세요.
								</c:if>
								<c:if test="${not empty m.famname}">
									${m.famname}
								</c:if>                         		
                           	</label>
                           	
                            <label id="myhome-name-wrapper">
                                &nbsp;&nbsp;
                                <input type="text" id="myhome-name-txt" maxlength="20" />
                                <input type="button" id="btn-myhome-name" value="확인" />
                                <input type="button" id="btn-homename-cancel" class="btn-cancel" value="취소" />
                            </label>

                            <label id="myhome-name-edit" class="edit">수정</label>

                            <p>이름을 설정하시면 이웃이 우리집을 가족명으로 검색할 수 있습니다.</p>
                        </div>

                        <div id="myhome-address">
                         	우리집 주소 :
                         	<label id="profile-myhome-address-val">
                         		<c:if test="${empty m.address}">
                         			우리집 주소를 설정해주세요.
                         		</c:if>
                         		<c:if test="${not empty m.address}">
                         			${m.address}
                         		</c:if>
                         	</label>

                            <label id="myhome-address-edit" class="edit">수정</label>
                            
                            <p>주소를 설정하시면 '마을' 서비스를 이용하실 수 있습니다.</p>

                            <div id="myhome-address-wrapper">
                            	주소 검색 : <input type="text" id="myhome-address-txt" readonly="readonly"/>
                                <input type="button" id="btn-myhome-address" value="확인" />
                                <input type="button" value="취소" id="btn-address-cancel" class="btn-cancel" />
                                
                                <div id="myhome-address-search-wrapper">
                                </div>
                            </div>
                        </div>

                        <div id="myhome-member">
							우리집 구성원
                            <label id="myhome-member-view" class="view">자세히 보기</label>

                            <div id="myhome-member-view-wrapper">
                            	
                            	<c:if test="${empty fms}">
                            		<div id="myhome-member-view-msg">구성원이 없습니다.</div>
                            	</c:if>
                            	
                            	<c:if test="${not empty fms}">
                            		<c:forEach var="i" items="${fms}">
		                                <ul class="myhome-member-view-body">
		                                    <li class="myhome-member-pic">
		                                        <img class="myhome-member-pic-thumbnail" src="${pageContext.request.servletContext.contextPath}/upload/profilepic/${i.profilepic}"/>
		                                    </li>
		
		                                    <li class="myhome-member-uid">${i.mid}</li>
		                                    <li class="myhome-member-name">${i.name}</li>
		                                    <li class="myhome-member-birthday">${i.birthday}</li>
		                                </ul>
	                                </c:forEach>
                                </c:if>
                            </div>
                        </div>

                        <div id="myhome-member-mng">
							우리집 구성원 관리
                            <label id="myhome-member-mng-view" class="view">자세히 보기</label>

                            <div id="myhome-member-mng-wrapper">

                                <span>가족 초대하기</span>
                                <input type="text" id="myhome-member-mng-txt"/>
                                <input type="button" id="btn-member-inv" value="초대"/>
                                
                                <fieldset id="myhome-member-mng-inv-view">
                                    <legend>가족 초대 현황</legend>
									
									<c:if test="${empty finvs}">
										<div>가족 초대 기록이 없습니다.</div>
									</c:if>
									
									<c:if test="${not empty finvs}">
										<c:forEach var="finvs" items="${finvs}">
		                                    <ul>
		                                        <li class="myhome-member-mng-uid">${finvs.acceptmid}</li>
		                                        <li class="myhome-member-mng-name">${finvs.name}</li>
		                                        <li class="myhome-member-mng-state">대기중</li>
		                                        <li class="myhome-member-mng-date">
													<fmt:formatDate value="${finvs.askregdate}" pattern="yyyy-MM-dd"/>
												</li>
		                                    </ul>
	                                    </c:forEach>
                                    </c:if>
                                </fieldset>               
                            </div>
                        </div>
                        
                        <div id="myhome-background">
                        	우리집 배경화면 설정
                        	
                        	<label id="myhome-background-edit" class="edit">설정</label>
                        	
                        	<div id="myhome-background-wrapper">
                        		<div id="myhome-profilebgc-box-main">
                        			<img id="myhome-background-thumbnail" src="${pageContext.request.servletContext.contextPath}/upload/profilebg/${m.profilebg}" />
                   				</div>
                        	</div>
                        </div>
                    </div>

                    <h3>이 웃</h3>
                    <div>
                        <div id="eoot-member">
                           	이웃 목록
                            <label id="eoot-member-view" class="view">자세히 보기</label>

                            <div id="eoot-member-view-wrapper">                            
                                <div id="eoot-member-search">
                                    <select>
                                        <option>가족명</option>
                                        <option>주소</option>
                                    </select>
                                    <input type="text" />
                                    <input type="button" id="btn-eoot-member-search" value="검색" />
                                </div>

                                <div id="eoot-member-view-wrapper2">
                                	<c:if test="${empty neighbors}">
                                   		<div>맺은 이웃이 없습니다.</div>
                                   	</c:if>                                  
                                    	
                                   	<c:if test="${not empty neighbors}">
                                   		<c:forEach var="neighbors" items="${neighbors}">
                                   		<ul class="eoot-member-view-body">
	                                        <li class="eoot-member-famname">
	                                        	<c:if test="${empty neighbors.address}">
	                                        		(가족명 없음)
		                                        </c:if>
		                                        
		                                        <c:if test="${not empty neighbors.address}">
		                                        	${neighbors.name}
	                                        	</c:if>
	                                        </li>
	                                        <li class="eoot-member-name link">
	                                        	<a target="_blank" href="../main/main_e.jsp?fc=${neighbors.famcode}">${neighbors.name}</a>
	                                        </li>
	                                        <li class="eoot-member-address">
		                                        <c:if test="${empty neighbors.address}">
		                                        	(주소 설정 안함)
		                                        </c:if>
		                                        
		                                        <c:if test="${not empty neighbors.address}">
		                                        	${neighbors.address}
	                                        	</c:if>
	                                        </li>
	                                        </ul>
                                        </c:forEach>
                                       </c:if>
                                </div>
                            </div>
                        </div>

                        <div id="eoot-with">
                           	 이웃 관리
                            <label id="eoot-with-view" class="view">자세히 보기</label>
                           
                            <div id="eoot-with-view-wrapper">
                            	<div id="eoot-member-mng-wrapper">
	                                <span>이웃 초대하기</span>
	                                <input type="text" id="eoot-member-mng-txt"/>
	                                <input type="button" id="btn-eoot-member-inv" value="초대"/>
                           		</div>
                            
                                <div id="eoot-with-request-wrapper">
                                    <input type="radio" name="eoot-with-request" value="get" checked />내가 받은 이웃신청&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="eoot-with-request" value="add" />내가 보낸 이웃신청
                                </div>

                                <div id="eoot-with-view-wrapper2">
                                    <div id="eoot-with-get-view">
	                                    <c:if test="${empty neisMe}">
	                                		<div>이웃신청 기록이 없습니다.</div>
	                                	</c:if>
	                                	
	                                	<c:if test="${not empty neisMe}">
	                                		<c:forEach var="neisMe" items="${neisMe}">
		                                        <ul>
		                                            <li class="eoot-with-get-famname">
		                                            	<c:if test="${empty neisMe.famname}">
		                                            		(가족명 없음)
		                                            	</c:if>
		                                            	
		                                            	<c:if test="${not empty neisMe.famname}">
		                                            		${neisMe.famname}
		                                            	</c:if>
		                                            </li>
		                                            <li class="eoot-with-get-name link">
		                                            	<a target="_blank" href="../main/main_e.jsp?fc=${neisMe.famcode}">${neisMe.name}</a>
		                                            </li>
		                                            <li class="eoot-with-get-msg">
		                                            	<c:if test="${empty neisMe.askmsg}">
		                                            		우리 이웃 해요 ~^^
		                                            	</c:if>
		                                            	
		                                            	<c:if test="${not empty neisMe.askmsg}">
		                                            		${neisMe.askmsg}
		                                            	</c:if>
		                                            </li>
		                                            <li class="accept"><a href="updateNeiAcceptProc.jsp?askmid=${neisMe.askmid}">수락</a></li>
		                                            <li class="reject"><a href="deleteNeiInvProc.jsp?askmid=${neisMe.askmid}">거절</a></li>
		                                        </ul>
	                                        </c:forEach>
	                                    </c:if>
                                    </div>
                                    
                                    <div id="eoot-with-add-view">
                                    	<c:if test="${empty neis}">
                                    		<div>이웃신청 기록이 없습니다.</div>
                                    	</c:if>
                                    	
                                    	<c:if test="${not empty neis}">
                                    		<c:forEach var="neis" items="${neis}">
	                                    		<ul>
		                                            <li class="eoot-with-get-famname">
														<c:if test="${empty neis.famname}">
		                                            		(가족명 없음)
		                                            	</c:if>
		                                            	
		                                            	<c:if test="${not empty neis.famname}">
		                                            		${neis.famname}
		                                            	</c:if>
													</li>
		                                            <li class="eoot-with-get-name link">
		                                            	<a target="_blank" href="../main/main_e.jsp?fc=${neis.famcode}">${neis.name}</a>
		                                            </li>
		                                            <li class="eoot-with-get-msg">
		                                            	<c:if test="${empty neis.askmsg}">
		                                            		우리 이웃 해요 ~^^
		                                            	</c:if>
		                                            	
		                                            	<c:if test="${not empty neis.askmsg}">
		                                            		${neis.askmsg}
		                                            	</c:if>
		                                            </li>
		                                            <li class="waiting">대기중</li>
	                                        	</ul>
                                        	</c:forEach>
                                    	</c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h3>마 을</h3>
                    <div id="vil-scope-wrapper">
						마을소식 검색 범위 기본 설정 : &nbsp;
                        <input type="radio" name="vil-scope" value="dong" checked />동 단위&nbsp;&nbsp;
                        <input type="radio" name="vil-scope" value="meter" />거리 단위&nbsp;
                        <div id="meter-opt">
                            <select name="meter-opt">
                                <option value="">거리선택</option>
                                <option value="100m">500m</option>
                                <option value="500m">750m</option>
                                <option value="800m">1000m</option>
                            </select>
                        </div>
                    </div>

                    <h3>게 시 글</h3>
                    <div id="share-scope-wrapper">
						게시글 공개 범위 기본 설정 : <br /><br />
                        &nbsp;&nbsp;<input type="radio" name="share-scope" value="family" checked />가족과 공유<p class="share-scope-msg">가족 구성원인 회원에게만 공개됩니다.</p>
                        &nbsp;&nbsp;<input type="radio" name="share-scope" value="eoot" />이웃에게 공개<p class="share-scope-msg">나와 이웃인 회원에게 공개됩니다.</p>
                        &nbsp;&nbsp;<input type="radio" name="share-scope" value="village" />마을에 게시<p class="share-scope-msg">나와 이웃이 아니더라도, '마을'서비스를 이용하는 회원에게 공개됩니다.</p>
                        
                    </div>
                </div>

            </div>                 
        </div>
</main>
</body>
</html>