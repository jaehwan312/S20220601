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
            <a href="">제주 감수광</a>
        </div>
        <div class="navbar_search">
            <form action="" class="search_form">
                <input type="text" id="s_value" class="search_bar" placeholder="Typing..." onkeyup="filter()">                
                <button class="search_btn">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
                <div class="search_result">
                	<div class="keyword">
                    	<div class="keyword_child" id="keyword_rel" onclick="keyword_rel(0)">연관검색어</div>
                    	<div class="keyword_child" id="keyword_rec" onclick="keyword_rel(1)">추천검색어</div>
                    	<div class="keyword_child" id="keyword_pop" onclick="keyword_rel(2)">인기검색어</div>
                    </div>

			        <div class="item">
			          <i class="fa-solid fa-magnifying-glass fa-sm"></i>
			          <span class="name">제주도</span>
			        </div>
			
			        <div class="item">
			          <i class="fa-solid fa-magnifying-glass fa-sm"></i>
			          <span class="name">제주도맛집</span>
			        </div>
			
			        <div class="item">
			          <i class="fa-solid fa-magnifying-glass fa-sm"></i>
			          <span class="name">돌하르방</span> 
			        </div>
			
			        <div class="item">
			          <i class="fa-solid fa-magnifying-glass fa-sm"></i>
			          <span class="name">가나다라</span>
			        </div>
			
			        <div class="item">
			          <i class="fa-solid fa-magnifying-glass fa-sm"></i>
			          <span class="name">김인헌</span>
			        </div>
			
			        <div class="item">
			          <i class="fa-solid fa-magnifying-glass fa-sm"></i>
			          <span class="name">안녕하세요</span>
			        </div>
			
			        <div class="item">
			          <i class="fa-solid fa-magnifying-glass fa-sm"></i>
			          <span class="name">반갑습니다 여러분</span>
			        </div>
			
			        <div class="item">
			          <i class="fa-solid fa-magnifying-glass fa-sm"></i>
			          <span class="name">Cherry</span>
			        </div>
    		    </div>
            </form>
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
                    <a href="">실시간 채팅 문의</a>
                </div>
            </li>
        </ul>
        <ul class="navbar_user">
            <li class="dropdown">
                <a href="" class="dropdown_button">마이페이지</a>
                <div class="dropdown_content" id="mypage">
                    <a href="">나의 프로필</a>
                    <a href="">예약내역</a>
                    <a href="">나의 픽(찜목록)</a>
                    <a href="">나의 식당정보</a>
                    <a href="">나의 숙소정보</a>
                    <a href="">관리자 페이지</a>
                </div>
            </li>
            <li><a href="">로그아웃</a></li>
        </ul>

        <a href="#" class="hamburger">
            <i class="fa-solid fa-bars"></i>
        </a>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>