<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.dao.MemberDao"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBMemberDao"%>
<%@page import="com.eoot.eootprj.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String uid = "viovio@eoot.com";

	MemberDao memberDao = new MyBMemberDao();
	
	Member m = memberDao.getMember(uid);
	String famcode = m.getFamcode();
	
	List<Member> fms = memberDao.getFamMembers(uid, famcode);
	
	pageContext.setAttribute("m", m);
	pageContext.setAttribute("fms", fms);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리 함께 | e - oot</title>
<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css'>
<link href="../resource/css/reset.css" rel="stylesheet">
<script src="../resource/js/jquery-2.1.3.js"></script>
<script src="../resource/js/modernizr.js" type="text/javascript"></script>
<link href="../resource/css/bind_menu.css" rel="stylesheet" type="text/css">
<script src="../resource/js/menu.js"></script>
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
                            <img id="profile-edit-thumbnail" src="images/default.jpg" />
                        </div>
                    </div>

                    <div id="profile-upload-form">
                        <form>
                            <input type="file" id="profile-edit-file"/>
                            <div id="profile-upload-select-wrapper">
                                <input type="button" id="btn-upload-select" value="사진 선택" /><br />
                            </div>
                            <input type="button" id="btn-upload-set"value="사진 등록" />
                            <input type="button" class="btn-cancel" value="취소" />
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
                        <img id="profile-thumbnail" src="images/default.jpg" />
                        <div>사진 변경</div>
                    </div>

                    <div id="profile-wrapper">
                        <div id="profile-wrapper2">
                            <div>
								이메일 : ${m.mid}
                            </div>
                            <div>
								이름 : ${m.name}
                                <label id="profile-name-wrapper">
                                    &nbsp;&nbsp;
                                    <input type="text" id="profile-name-txt" maxlength="20"/>
                                    <input type="button" id="btn-profile-name" value="확인" />
                                </label>

                                <label id="profile-name-edit" class="edit">수정</label>
                            </div>
                            <div>
								우리집 이름 :
                            </div>
                            <div>
								우리집 주소 : 
                            </div>
                        </div>
                    </div>
                </div>                

                <div id="accordion">
                    <h3>우 리 집</h3>
                    <div>

                        <!-- <div id="invited">
                            <ul>
                                <li>
                                    <a href="">뵤뵤뵤뵤</a>&nbsp;님이 나를 가족으로 초대하고 싶어합니다. 수락하시겠습니까?
                                    <p>수락하시면 현재 가족페이지의 모든 자료는 삭제되고,<br />뵤뵤뵤뵤님의 가족페이지에 있는 자료를 공유하게 됩니다.</p>
                                    <input type="button" name="accept-fam" value="수락" />
                                    <input type="button" name="reject-fam" value="거절" class="btn-cancel" />
                                </li>
                            </ul>
                        </div> -->
                        
                        <div id="myhome-name">
                           	 우리집 이름 : <label id="profile-myhome-name-val">우리집 이름을 정해주세요.</label>
                            <label id="myhome-name-wrapper">
                                &nbsp;&nbsp;
                                <input type="text" id="myhome-name-txt" maxlength="20" />
                                <input type="button" id="btn-myhome-name" value="확인" />
                            </label>

                            <label id="myhome-name-edit" class="edit">수정</label>

                            <p>이름을 설정하시면 이웃이 우리집을 가족명으로 검색할 수 있습니다.</p>
                        </div>

                        <div id="myhome-address">
                         	우리집 주소 : <label id="profile-myhome-address-val">우리집 주소를 입력해주세요.</label>

                            <label id="myhome-address-edit" class="edit">수정</label>
                            
                            <p>주소를 설정하시면 '마을' 서비스를 이용하실 수 있습니다.</p>

                            <div id="myhome-address-wrapper">
                            	주소 검색 : <input type="text" />
                                <input type="button" value="검색"/>
                                <input type="button" value="취소" class="btn-cancel" />
                                
                                <table id="myhome-address-table">
                                    <thead>
                                        <tr>
                                            <th class="board-cell-zipcode">우편번호</th>
                                            <th id="board-cell-address">주소</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="board-row">
                                            <td class="board-cell-zipcode">441-340</td>
                                            <td>경기도 수원시 권선구</td>
                                        </tr>
                                        <tr class="board-row">
                                            <td class="board-cell-zipcode">441-340</td>
                                            <td>경기도 수원시 권선구</td>
                                        </tr>
                                    </tbody>
                                </table>
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
		                                        <img class="myhome-member-pic-thumbnail" src="${i.profilepic}"/>
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
                                <input type="text" />
                                <input type="button" value="초대"/>
                                
                                <fieldset>
                                    <legend>가족 초대 현황</legend>

                                    <ul>
                                        <li class="myhome-member-mng-uid">namita@gmail.com</li>
                                        <li class="myhome-member-mng-name">나미짱</li>
                                        <li class="myhome-member-mng-state">대기중</li>
                                        <li class="myhome-member-mng-date">2012-12-30</li>
                                    </ul>
                                </fieldset>               
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
                                    <ul class="eoot-member-view-body">
                                        <li class="eoot-member-famname"><a href="">나미네집!!</a></li>
                                        <li class="eoot-member-name">꼬리999개 여우 | 쭈구리비버 | 갓쇼 | 나미타</li>
                                        <li class="eoot-member-address">경기도 수원시 권선구 dfsdf</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div id="eoot-with">
                           	 이웃맺기 현황
                            <label id="eoot-with-view" class="view">자세히 보기</label>

                            <div id="eoot-with-view-wrapper">
                                <div id="eoot-with-request-wrapper">
                                    <input type="radio" name="eoot-with-request" value="get" checked />내가 받은 이웃신청&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="eoot-with-request" value="add" />내가 보낸 이웃신청
                                </div>

                                <div id="eoot-with-view-wrapper2">
                                    <div id="eoot-with-get-view">
                                        <ul>
                                            <li class="eoot-with-get-famname">서대문구 창천동 과일가게</li>
                                            <li class="eoot-with-get-name">나미 타 커쇼 쭈구리비버</li>
                                            <li class="eoot-with-get-msg">우리 이웃 맺어요!!~~!!</li>
                                            <li class="accept">수락</li>
                                            <li class="reject">거절</li>
                                        </ul>
                                    </div>
                                    
                                    <div id="eoot-with-add-view">
                                        <ul>
                                            <li class="eoot-with-get-famname">나미네집!!!</li>
                                            <li class="eoot-with-get-name">나미 타 커쇼 쭈구리비버</li>
                                            <li class="eoot-with-get-msg">우리 이웃 맺어요!!~~!!</li>
                                            <li class="waiting">대기중</li>
                                        </ul>
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