<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<link rel="stylesheet" href="css/main.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/jj/mainIcon.css">
<link rel="stylesheet" type="text/css" href="css/jj/jquery.fullPage.css" />
<title>제주 감수광</title>
<script src="https://kit.fontawesome.com/a42e829aa0.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	function message() {
		var value2 = "${msg}";
		if(value2 != ""){
			alert(value2);
		}
	}
</script>
</head>
<body onload="message()">
	<nav class="navbar">
        <div class="navbar_logo">
            <a href="main">제주 감수광</a>
        </div>
        <div class="header_background"></div>
        <div class="navbar_search_alter"></div>
        <ul class="navbar_menu">
            <li><a href="stayList">숙박</a></li>
            <li><a href="storeList">맛집</a></li>
            <li class="dropdown">
                <a href="" class="dropdown_button">고객센터</a>
                <div class="dropdown_content" id="csc">
                    <a href="ntcList">공지사항</a>
                    <a href="tosContent">이용약관</a>
                    <a href="faqContent">FAQ</a>
                </div>
            </li>
        </ul>
        <ul class="navbar_user">
        	<c:choose>
        		<c:when test="${grade=='2' }">
        			<li class="dropdown">
		                <a href="myPage" class="dropdown_button">마이페이지</a>
		                <div class="dropdown_content" id="mypage">
		                    <a href="myPage">나의 프로필</a>
		                    <a href="resList">예약내역</a>
		                    <a href="myPickList">나의 픽(찜목록)</a>
		                    <a href="myStoreList">나의 식당정보</a>
		                    <a href="">나의 숙소정보</a>
		                </div>
		            </li>
		            <li><a href="logout">로그아웃</a></li>
        		</c:when>
        		<c:when test="${grade=='1' }">
        			<li class="dropdown">
		                <a href="myPage" class="dropdown_button">마이페이지</a>
		                <div class="dropdown_content" id="mypage">
		                    <a href="myPage">나의 프로필</a>
		                    <a href="resList">예약내역</a>
		                    <a href="myPickList">나의 픽(찜목록)</a>
		                    <a href="myStoreList">나의 식당정보</a>
		                    <a href="">나의 숙소정보</a>
		                    <a href="adminPage">관리자 페이지</a>
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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <c:choose>
    	<c:when test="${grade=='2' }">
    		<%@ include file="jh/newRoom.jsp" %>
    	</c:when>
    </c:choose>
	<div id="fullpage">
	<div class="section">
	<div class="main_background"></div>
    <div class="bg_img">
    	<div class="col-lg-4">
    		<div class="title_text">
				<p class="title">맛집? 숙소?</p>
				<h1 class="title">검색하러 감수광!</h1>
			</div>
			<form id="main_search_area"  action="getSearchResult" autocomplete="off"  onsubmit="return checkIt()">
        	<div class="input-group input-group-lg" id="main_search">
        			<div class="input-group input-group-lg">
				  		<input id="searchBar" name="keyword" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" onkeyup="mainEnter()">
					  <div class="typing-txt"> 
						 <ul>
						  	<c:forEach var="list" items="${search }">
						    	<li>${list.keyword }</li>	
						  	</c:forEach>
						</ul>
					  </div> 
					  <span class="input-group-text" id="inputGroup-sizing-lg" onclick="inputSearch()"><img alt="" src="images/jj/search.png" style="height: 30px"></span>
				  </div>
				  <div class="col-lg-4" style="position: fixed; margin-top: 50px; min-width: 416.66px;">
					  <div class="input-group flex-nowrap" id="search_result_main">
	                	<div class="keyword_main">
	                    	<div class="keyword_child_main" id="keyword_rec_main" onclick="keyword_rel_main(0)">추천검색어</div>
	                    	<div class="keyword_child_main" id="keyword_pop_main" onclick="keyword_rel_main(1)">인기검색어</div>
	                    </div>
	                    	<div id='autoMaker_main'></div>
	    		      </div>
	    		     </div>
			</div>
			</form>
         </div>
    </div>
    </div>
    <div class="section">
    
    	<div class="container-xxl py-5" id="countIcons">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeIn;">
                    <div class="fact-item bg-light rounded text-center h-100 p-5">
                        <i class="fa fa-utensils fa-4x text-primary mb-4"></i>
                        <p class="mb-2">등록된 맛집</p>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="substitute">0</span></h1>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">50</span></h1>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeIn;">
                    <div class="fact-item bg-light rounded text-center h-100 p-5">
                        <i class="fa fa-hotel fa-4x text-primary mb-4"></i>
                        <p class="mb-2">등록된 숙소</p>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="substitute">0</span></h1>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">175</span></h1>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeIn;">
                    <div class="fact-item bg-light rounded text-center h-100 p-5">
                        <i class="fa fa-clock fa-4x text-primary mb-4"></i>
                        <p class="mb-2">진행된 예약</p>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="substitute">0</span></h1>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">135</span></h1>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeIn;">
                    <div class="fact-item bg-light rounded text-center h-100 p-5">
                    	<i class="fa fa-file-pen fa-4x text-primary mb-4"></i>
                        <p class="mb-2">작성된 리뷰 수</p>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="substitute">0</span></h1>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">9375</span></h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

		<div class="container-xxl py-5" id="registry">
	            <div class="row justify-content-center g-4">
	                <div class="col-lg-4 col-sm-6" style="cursor: pointer;"
	                onclick="location.href='storeInsertForm'">
	                    <div class="service-item text-center pt-3">
	                        <div class="p-4">
	                            <i class="fa fa-3x fa-utensils text-primary mb-4"></i>
	                            <h5 class="mb-3">맛집 등록하기</h5>
	                            <p>맛집으로 등록하고 가게 정보를<br>공유해서 매출을 올려보세요</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-sm-6" style="cursor: pointer;"
	                onclick="location.href='stayInsertForm'">
	                    <div class="service-item text-center pt-3">
	                        <div class="p-4">
	                            <i class="fa fa-3x fa-hotel text-primary mb-4"></i>
	                            <h5 class="mb-3">숙소 등록하기</h5>
	                            <p>숙소 등록하고 예약시스템을 통해<br>간편하게 고객을 확보하세요</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	    </div>

	    <%-- <div class="container">
	    	<div>
	    		<p>등록된 맛집 : ${storeCount }</p>
	    		<p>등록된 숙소 : ${stayCount }</p>
	    		<p>진행된 예약 : ${resCount }</p>
	    		<p>작성된 리뷰 수 : ${reviewCount }</p>
	    	</div>
	    	<button>맛집 등록</button>
	    	<button>숙소 등록</button>
	    </div> --%>
    </div>
	<div class="section fp-auto-height">
		<footer>
		    <div>
			    <h1>(주)제주감수광</h1>
			    <h2>대표 : 황재환 이재준 하병헌 김정수 권재인 김인헌</h2>
			    <h2>주소 : 서울 마포구 신촌로 176 중앙빌딩 5층 (우)04104</h2>
			</div>
		    <div>
		    	<h2>고객센터</h2> 
			    <ul>
			        <li>공지사항</li>
			        <li>이용약관</li>
			        <li>자주 묻는 질문(FAQ)</li>
			    </ul>
			</div>
		</footer>
	</div>
	</div>
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<script src="js/jj/jquery.counterup.min.js"></script>
	<script src="js/main.js" defer></script>
    <script type="text/javascript" src="js/jj/mainPage.js" defer></script>
    <script type="text/javascript" src="js/jj/jquery.fullPage.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>