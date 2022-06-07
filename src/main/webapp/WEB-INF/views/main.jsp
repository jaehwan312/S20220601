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
<link rel="stylesheet" href="css/jj/mainIcon.css">


<title>제주 감수광</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div id="fullpage">
	<div class="section">
	<div class="main_background"></div>
    <div class="bg_img">
    	<div class="col-lg-4">
    		<div class="title_text">
				<p class="title">맛집? 숙소?</p>
				<h1 class="title">검색하러 감수광!</h1>
			</div>
        	<div class="input-group input-group-lg" id="main_search">
        			<div class="input-group input-group-lg">
					  <input id="searchBar" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
					  <div class="typing-txt"> 
						 <ul>
						  	<c:forEach var="list" items="${search }">
						    	<li>${list.keyword }</li>	
						  	</c:forEach>
						</ul>
					  </div> 
					  <span class="input-group-text" id="inputGroup-sizing-lg"><img alt="" src="images/jj/search.png" style="height: 30px"></span>
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
         </div>
    </div>
    </div>
    <div class="section">
    
    	<div class="container-xxl py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeIn;">
                    <div class="fact-item bg-light rounded text-center h-100 p-5">
                        <i class="fa fa-utensils fa-4x text-primary mb-4"></i>
                        <p class="mb-2">등록된 맛집</p>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">50</span></h1>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeIn;">
                    <div class="fact-item bg-light rounded text-center h-100 p-5">
                        <i class="fa fa-hotel fa-4x text-primary mb-4"></i>
                        <p class="mb-2">등록된 숙소</p>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">175</span></h1>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeIn;">
                    <div class="fact-item bg-light rounded text-center h-100 p-5">
                        <i class="fa fa-clock fa-4x text-primary mb-4"></i>
                        <p class="mb-2">진행된 예약</p>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">135</span></h1>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeIn;">
                    <div class="fact-item bg-light rounded text-center h-100 p-5">
                    	<i class="fa fa-file-pen fa-4x text-primary mb-4"></i>
                        <p class="mb-2">작성된 리뷰 수</p>
                        <h1 class="display-5 mb-0" data-toggle="counter-up"><span class="counter">9375</span></h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

		<div class="container-xxl py-5">
	            <div class="row justify-content-center g-4">
	                <div class="col-lg-4 col-sm-6" style="cursor: pointer;"
	                onclick="location.href='main'">
	                    <div class="service-item text-center pt-3">
	                        <div class="p-4">
	                            <i class="fa fa-3x fa-utensils text-primary mb-4"></i>
	                            <h5 class="mb-3">맛집 등록하기</h5>
	                            <p>맛집으로 등록하고 가게 정보를<br>공유해서 매출을 올려보세요</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-sm-6" style="cursor: pointer;"
	                onclick="location.href='main'">
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
    	<%@ include file="footer.jsp" %>
     </div>
     </div>
     <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<script src="js/jj/jquery.counterup.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>