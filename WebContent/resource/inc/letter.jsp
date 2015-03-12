<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="letter">

        <div class="letter-transp-bg"></div>
        <div class="btn-close"></div>

        <div class="letter-box-wrapper">
            <div class="letter-box-header">
                <div class="letter-box-header-title">편지함</div>
                <div class="letter-box-header-total">총 20개</div>
                <div class="letter-box-search">
                    <input class="letter-search" type="search" />
                    <div id="letter-search"></div>
                </div>
            </div>
            <div class="letter-item-box">
                <ul class="letter-items">
                    <li class="letter-item">
                        <div class="letter-title">남영이에게</div>
                        <div class="letter-from">from: 뵤뵤</div>
                        <div class="letter-date">20150311</div>
                        <div class="letter-mani hidden">
                            <!-- <img class="letter-like" src="../images/btn-like.png" />
                            <img class="letter-like" src="../images/btn-scrap.png" /> -->
                        </div>
                    </li>
                    <li class="letter-item">
                        <div class="letter-title">이웃파이팅파이팅파이팅파이팅파이팅파이팅파이팅파이팅</div>
                        <div class="letter-from">from: newlec</div>
                        <div class="letter-date">20150311</div>
                        <div class="letter-mani hidden">
                            <!-- <img class="letter-like" src="../images/btn-like.png" />
                            <img class="letter-like" src="../images/btn-scrap.png" /> -->
                        </div>
                    </li>
                    <li class="letter-item">
                        <div class="letter-title"></div>      
                        <div class="letter-from">from: 할무니</div>
                        <div class="letter-date">20150311</div>
                        <div class="letter-mani hidden">
                            <!-- <img class="letter-like" src="../images/btn-like.png" />
                            <img class="letter-like" src="../images/btn-scrap.png" /> -->
                        </div>
                    </li>
                    <li class="letter-item">
                        <div class="letter-title"></div>      
                        <div class="letter-from">from: 할무니</div>
                        <div class="letter-date">20150311</div>
                        <div class="letter-mani hidden">
                            <!-- <img class="letter-like" src="../images/btn-like.png" />
                            <img class="letter-like" src="../images/btn-scrap.png" /> -->
                        </div>
                    </li>
                    <li class="letter-item">
                        <div class="letter-title"></div>      
                        <div class="letter-from">from: 할무니</div>
                        <div class="letter-date">20150311</div>
                        <div class="letter-mani hidden">
                            <!-- <img class="letter-like" src="../images/btn-like.png" />
                            <img class="letter-like" src="../images/btn-scrap.png" /> -->
                        </div>
                    </li>
                </ul>
            </div>
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

        <div class="letter-write-wrapper">
            <div class="letter-write-header">
                <div class="letter-to">받는 사람</div>
                <div class="letter-to-list-wrapper">
                    <div class="letter-to-list">
                        <img class="thumbnail" src="" />
                        <div class="delete"></div>
                    </div>
                    <div class="letter-to-list">
                        <img class="thumbnail" src="" />
                        <div class="delete"></div>
                    </div>
                    <div class="letter-to-list">
                        <img class="thumbnail" src="" />
                        <div class="delete"></div>
                    </div>
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
                        <img class="thumbnail" src="../main/images/bobby1.jpg" alt="bobby@eoot.com" />
                        <div class="add"></div>
                    </div>
                    <div class="letter-add-list">
                        <img class="thumbnail" src="../main/images/nami3.jpg" />
                        <div class="add"></div>
                    </div>
                    <div class="letter-add-list">
                        <img class="thumbnail" src="../resource/images/img-profile-default.png" />
                        <div class="add"></div>
                    </div>
                    <div class="letter-add-list">
                        <img class="thumbnail" src="../resource/images/img-profile-default.png" />
                        <div class="add"></div>
                    </div>
                </div>
            </div>
            <button id="letter-add" type="submit">추가</button>
            <button id="letter-add-cancel" type="submit">취소</button>
        </div>
	</div>
	