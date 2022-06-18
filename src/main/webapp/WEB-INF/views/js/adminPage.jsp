<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/template.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/js/adminPage.css">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
	<div class="adminTitle">
            <h1>관리자 페이지</h1>
    </div>
 	<div class="container-xxl py-5" id="countIcons">
        <div class="container">
            <div class="row g-3" style="justify-content: space-evenly">
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeIn;">
	            	<a href="">       
	                    <div class="fact-item bg-light rounded text-center h-100 p-5">
	                        <i class="fa fa-user-large fa-4x text-primary mb-4" aria-hidden="true"></i>
	                        <p class="mb-2">회원관리</p>
	                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">20</span></h1>
	                    </div>
	                </a>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeIn;">
               		<a href="">     	
	                    <div class="fact-item bg-light rounded text-center h-100 p-5">
	                        <i class="fa fa-user-xmark fa-4x text-primary mb-4" aria-hidden="true"></i>
	                        <p class="mb-2">휴면회원 관리</p>
	                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">5</span></h1>
	                    </div>
	                </a>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeIn;">
	            	<a href="">        
	                    <div class="fact-item bg-light rounded text-center h-100 p-5">
	                        <i class="fa fa-clock fa-4x text-primary mb-4" aria-hidden="true"></i>
	                        <p class="mb-2">추천검색어 관리</p>
	                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">10</span></h1>
	                    </div>
	                </a>
                </div>
            </div>
        </div>
    </div>
    <div class="container-xxl py-5" id="countIcons">
        <div class="container">
            <div class="row g-3" style="justify-content: space-evenly">
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeIn;">
	            	<a href="">
	                    <div class="fact-item bg-light rounded text-center h-100 p-5">
	                        <i class="fa fa-hotel fa-4x text-primary mb-4" aria-hidden="true"></i>
	                        <p class="mb-2">숙소등록 관리</p>
	                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">20</span></h1>
	                    </div>
	                </a>
                </div>
                
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeIn;">
                    <a href="">
	                    <div class="fact-item bg-light rounded text-center h-100 p-5">
	                        <i class="fa fa-store fa-4x text-primary mb-4" aria-hidden="true"></i>
	                        <p class="mb-2">식당등록 관리</p>
	                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">17</span></h1>
	                    </div>
                    </a>>
                </div>
                
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeIn;">
                    <a href="chatList">
	                    <div class="fact-item bg-light rounded text-center h-100 p-5">
	                        <i class="fa fa-comments fa-4x text-primary mb-4" aria-hidden="true"></i>
	                        <p class="mb-2">실시간채팅 관리</p>
	                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">8</span></h1>
	                    </div>
                    </a>
                </div>
                
            </div>
        </div>
    </div>

	<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>