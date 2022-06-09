<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/template.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<link href="css/jj/searchList.css" rel="stylesheet">    

<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->

          <div class="container">
              <div class="row">
                  <div class="col-lg-12 text-center mb100">
                      <h2 class="section-heading">숙박<span class="theme-accent-color">&</span>맛집</h2>
                      <hr class="thin-hr">
                      <h3 class="section-subheading secondary-font">'${keyword }'에 대한 검색 결과</h3>
                  </div>
              </div>
          </div>
          
           <div class="container">

              <div class="row">
                  <div class="col-md-6">
                      <h2 class="mb50"><span class="heading-font text-uppercase">맛집</span></h2>
                      
                       <c:forEach var="store" items="${storeList }">
                      	<div class="host-item">
                          <div class="row">
                              <div class="col-xs-3">
                                  <img src="images/jj/${store.host_photo }" class="img-responsive">
                              </div>
                            <div class="col-xs-9">
                                  <h3>${store.host_name } <span class="theme-accent-color">평점 ${store.host_avg }</span><button>지도</button> </h3>
                                  <p>${store.host_addr }<br>가격대 : ${store.min_price }~${store.max_price }
                                  <br>${store.type_name }&ensp;찜한수 : ${store.like_count }&ensp;리뷰 : ${store.rev_count }
                                   </p>
                              </div>
                          </div>
                       </div>
                      </c:forEach> 
                  </div>

                   <div class="col-md-6">
                      <h2 class="mb50"><span class="heading-font text-uppercase">숙박</span></h2>
						<c:forEach var="stay" items="${stayList }">
                      	<div class="host-item">
                          <div class="row">
                              <div class="col-xs-3">
                                  <img src="images/jj/${stay.host_photo }" class="img-responsive">
                              </div>
                              <div class="col-xs-9">
                                  <h3>${stay.host_name } <span class="theme-accent-color">평점 ${stay.host_avg }</span><button>지도</button> </h3>
                                  <p>${stay.host_addr }<br>평일비용 : ${stay.min_dayfee }~${stay.max_dayfee }
                                  <br>주말비용 : ${stay.min_weekfee }~${stay.max_weekfee }
                                  <br>${stay.type_name }&ensp;찜한수 : ${stay.like_count }&ensp;리뷰 : ${stay.rev_count }
                                   </p>
                              </div>
                          </div>
                       </div>
                      </c:forEach>
                  </div>
              </div>
          </div>
    
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>