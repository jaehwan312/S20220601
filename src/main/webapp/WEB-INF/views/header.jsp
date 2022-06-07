<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<title>제주 감수광</title>
	<script src="https://kit.fontawesome.com/a42e829aa0.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/main.js" defer></script>
</head>
<body class="main_container">
    <nav class="navbar">
        <div class="navbar_logo">
            <a href="main">제주 감수광</a>
        </div>
        <div class="header_background"></div>
        <div class="navbar_search_alter"></div>
        <div class="navbar_search">
            <form action="" class="search_form">
                <input type="text" id="search_area" class="search_bar" placeholder="Typing..." autocomplete="off">                
                <button class="search_btn" type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </form>
                <div class="search_result">
                	<div class="keyword">
                    	<div class="keyword_child" id="keyword_rec" onclick="keyword_rel(0)">추천검색어</div>
                    	<div class="keyword_child" id="keyword_pop" onclick="keyword_rel(1)">인기검색어</div>
                    </div>
                    	<div id='autoMaker'></div>

    		    </div>
        </div>
        <ul class="navbar_menu">
            <li><a href="">숙박</a></li>
            <li><a href="">맛집</a></li>
            <li class="dropdown">
                <a href="" class="dropdown_button">고객센터</a>
                <div class="dropdown_content" id="csc">
                    <a href="">공지사항</a>
                    <a href="">이용약관</a>
                    <a href="">FAQ</a>
                </div>
            </li>
        </ul>
        <ul class="navbar_user">
        	<c:choose>
        		<c:when test="${grade==2 }">
        			<li class="dropdown">
		                <a href="" class="dropdown_button">마이페이지</a>
		                <div class="dropdown_content" id="mypage">
		                    <a href="">나의 프로필</a>
		                    <a href="">예약내역</a>
		                    <a href="">나의 픽(찜목록)</a>
		                    <a href="">나의 식당정보</a>
		                    <a href="">나의 숙소정보</a>
		                </div>
		            </li>
		            <li><a href="logout">로그아웃</a></li>
        		</c:when>
        		<c:when test="${grade==1 }">
        			<li class="dropdown">
		                <a href="" class="dropdown_button">마이페이지</a>
		                <div class="dropdown_content" id="mypage">
		                    <a href="">나의 프로필</a>
		                    <a href="">예약내역</a>
		                    <a href="">나의 픽(찜목록)</a>
		                    <a href="">나의 식당정보</a>
		                    <a href="">나의 숙소정보</a>
		                    <a href="admMain">관리자 페이지</a>
		                </div>
		            </li>
		            <li><a href="logout">로그아웃</a></li>
        		</c:when>
        		<c:otherwise>
					<li><a href="loginPage">로그인</a></li>
					<li><a href="signUpPage">회원가입</a></li>
				</c:otherwise>
        	</c:choose>
        </ul>

        <a href="#" class="hamburger">
            <i class="fa-solid fa-bars"></i>
        </a>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>