<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../resource/css/reset.css" rel="stylesheet" type="text/css" />
    <script src="../resource/js/modernizr.js" type="text/javascript"></script>
    <script src="../resource/js/jquery-2.1.3.js"></script>
    <link href="css/quickWrite_layout.css" type="text/css" rel="stylesheet" />
    <script src="js/quickWrite.js"></script>
    <script src="js/quickWriteSend.js"></script>
</head>
<body onload="iframeOn()"> 
	<div id="qw">
		<div class="qw-transp-bg"></div>
    	<div class="qw-btn-close"></div>
    	
	    <div id="wrap">
	        <article>
	            <section class="write"> 
	                <h1 class="hidden">작성창</h1>
	                <div class="writeHeader">
	                	<!-- <div class="msg-title">제목을 입력하세요</div> -->
	                    <iframe id="textTop" class="writeSearch" name="textfield1">
	                    </iframe>            
	                </div>
	                <div class="writerContents">
	                	<!-- <div class="msg-content">내용을 입력하세요</div> -->
	                    <iframe id="textContent" class="contents" name="textfield2" >
	                    </iframe>
	                    <div class="preView">
	                        미리 보기
	                        <img id="img" />
	                    </div> 
	                </div>
	            </section>
	            <section class="select">
	                <h1 class="hidden">선택창</h1>
	                <div class="top">
	                    <div class="profile">
	                        <h1 class="hidden">프사</h1>
	                        <img src="" class="thumbnail" alt="alt이거지우셈"/>
	                    </div>
	                    <div class="date">
	                        <h1 class="hidden">현재날짜</h1>
	                        <script src="js/outDate.js"></script>
	                    </div>
	                </div>
	                <div class="writeStyle">
	                    <div class="styleSelect">
	                        <div class="selectStyle">
	                            <select id="size" onchange="fontSize()">
	                                <option>크기</option>
	                                <option>1px</option>
	                                <option >2px</option>
	                                <option >3px</option>
	                                <option >4px</option>
	                                <option>5px</option>
	                                <option >6px</option>
	                                <option >7px</option>
	                            </select>
	                        </div>
	                        <div class="bold">
	                            <input type="button" onclick="bold()" class="blodStyle"/>                       
	                        </div>
	                        <div class="italic">
	                            <input type="button" onclick="italic()" class="italicStyle" />
	                        </div>   
	                        <div class="color">
	                            <select id="colors" onchange="fontColors()">
	                                <option>색깔</option>
	                                 <option style="background-color:black;">black</option>
	                                <option style="background-color:red;">red</option>
	                                <option style ="background-color: blue;">blue</option>
	                                <option style="background-color: green;">green</option>
	                                <option style="background-color: pink;">pink</option>
	      
	                            </select>
	                        </div>                  
	                    </div>
	                </div>
	               
		                <div class="uploadSelect">
		                    <h1 class="hidden">파일 업로드및 링크</h1>
		                    <div class="upload">
		                        <h1 class="hidden">업로드및 링크</h1>
		                         <form id="form"  method="post" enctype="multipart/form-data">
			                        <div class="fileUpload">
			                            <input type=file name='file1' style='display: none;' id="imgInp" multiple="multiple">
			                            <img src='image/파일.jpg' border='0' onclick='document.all.file1.click();'> 		                         
			                            <a href="cal.html" style="padding-left:12px;" target="textfield2"><img src="image/칼렌더.png"></a>                      
			                        </div>
		                        </form>
		                    </div>
		                </div>
	                
	                <div class="selectEoot">
	                    <input type="checkbox" checked="checked" name="check"  id="check1" value="0"/>
	                    우리가족만&nbsp;&nbsp;
	                    <input type="checkbox" name="check" id="check2" value="1"/>
	                    이웃과 공유
	                    <div>
	                    <input type="checkbox" name="check" id="check" value="2"/>
	                    마을에 게시&nbsp;
	                    	<select>
	                    		<option>일반</option>
	                    		<option>장터</option>
	                    		<option>모임</option>
	                    		<option>구인구직</option>
	                    	</select>
	                    </div>
	                </div>
	                <input type="button" class="btn" id="btn" value="작성완료"/>
	            </section>
	        </article>
	    </div>
	</div>
</body>
</html>
