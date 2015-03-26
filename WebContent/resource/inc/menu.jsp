<%@page import="com.eoot.eootprj.model.NeighborJoinMember"%>
<%@page import="java.util.List"%>
<%@page import="com.eoot.eootprj.dao.mybatis.MyBNeighborDao"%>
<%@page import="com.eoot.eootprj.dao.NeighborDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String menuUid = (String) session.getAttribute("uid");
	NeighborDao menuNei = new MyBNeighborDao();	

	List<NeighborJoinMember> menuList = menuNei.getNeighbors(menuUid);
	
	pageContext.setAttribute("menuList", menuList);
%>
	<section>
        <h1 class="hidden">회원 메뉴</h1>

        <!-- Menu 1 -->
        <nav id="menu1">
            <h1 class="hidden">메뉴 1</h1>   
             
            <div id="menu_button"></div>
            
            <div id="buttons">
                <div class="button" id="menu1-myhome">
                    <div class="vertical-field1">
                        <div class="vertical-field2">
                            <span class="vertical_text">우리집</span>
                        </div>
                    </div>
                </div>

                <div class="visual"></div>

                <div class="button" id="menu1-eoot">
                    <div class="vertical-field1">
                        <div class="vertical-field2">
                            <span class="vertical_text">이 웃</span>
                        </div>
                    </div>
                </div>

                <div class="visual"></div>

                <div class="button" id="menu1-village">
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
                            <a href=""><img id="img-scrapped" src="../resource/images/btn-scrapped.png" /></a>
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

        <!--Menu 2--> 
        <nav id="menu2">
            <h1 class="hidden">메뉴 2</h1>
			
			<div class="menu-bg">
            	<div id="menu_button"></div>
            </div>

            <div id="buttons">
                <div class="button" id="menu2-calendar">
                    <div class="vertical-field1">
                        <div class="vertical-field2">
                            <span class="vertical_text">달 력</span>
                        </div>
                    </div> 
                </div>

                <div class="visual"></div>

                <div class="button" id="menu2-album">
                    <div class="vertical-field1">
                        <div class="vertical-field2">
                            <span class="vertical_text">앨 범</span>
                        </div>
                    </div>
                </div>

                <div class="visual"></div>

                <div class="button" id="menu2-setting">
                    <div class="vertical-field1">
                        <div class="vertical-field2">
                            <span class="vertical_text">설 정</span>
                        </div>
                    </div>
                </div>

                <div class="visual"></div>
                
            </div>
        </nav>

        <!--Menu 3-->
        <nav id="menu3">
            <h1 class="hidden">메뉴 2</h1>

            <div class="menu-bg">
            	<div id="menu_button"></div>
            </div>
            
            <div id="buttons">
            	<c:if test="${empty menuList}">
					<div id="eoot-none">맺은 이웃이 없습니다.</div>
				</c:if>
				
				<c:if test="${not empty menuList}">
					<c:forEach var="menuList" items="${menuList}">
						<div class="button" onclick="eootLink('${menuList.famcode}')">
		                    <div class="vertical-field1">
		                        <div class="vertical-field2">
		                            <span class="vertical_text">
										<c:if test="${empty menuList.famname}">
											(가족명 없음)
										</c:if>
										
										<c:if test="${not empty menuList.famname}">
											${menuList.famname}
										</c:if>
									</span>
		                            <div id="family">${menuList.name}</div>
		                        </div>
		                    </div>
	                	</div>
	
	                	<div class="visual"></div>
	                </c:forEach>
				</c:if>
            </div>
        </nav>
    </section>