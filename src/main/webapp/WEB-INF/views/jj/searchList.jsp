<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/jj/searchList.css" rel="stylesheet">    

<title>제주 감수광</title>

</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
		 <input type="hidden" name="callKeyword" value="${keyword }" id="callKeyword">
          <div class="container">
              <div class="row">
                  <div class="col-lg-12 text-center mb100">
                      <h2 class="section-heading">숙박<span class="theme-accent-color">&</span>맛집</h2>
                      <hr class="thin-hr">
                      <h3 class="section-subheading secondary-font" style="margin-bottom: 30px;">'${keyword }'에 대한 검색 결과</h3>
			      	  <button type="button" class="btn btn-success" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">상세 검색</button>
						<div style="min-height: 120px;">
						  <div class="collapse collapse-horizontal" id="collapseWidthExample">
						    
						    <div class="col-md-8" id="details"> 
								
								<div class="container" id="details_font">
								  <div class="row">
							  	   <div class="col-md-3">
							  	   		<span>지역별</span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" value="" checked="">
									      <span>
									        모슬포/화순
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" value="" checked="">
									      <span>
									        서귀포시내
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" value="" checked="">
									      <span>
									        성산/우도
									      </span>
								    </div>
								  </div>
								  <div class="row">
								  	<div class="col-md-3 offset-md-3">
								  		<input class="form-check-input flex-shrink-0" type="checkbox" value="" checked="">
									      <span>
									        제주 시내
									      </span>
								  	</div>
								  	<div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" value="" checked="">
									      <span>
									        중문단지
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" value="" checked="">
									      <span>
									        표선/성읍
									      </span>
								    </div>
								  </div>
								  <div class="row">
								  	<div class="col-md-3 offset-md-3">
								  		<input class="form-check-input flex-shrink-0" type="checkbox" value="" checked="">
									      <span>
									        한림/애월
									      </span>
								  	</div>
								  	<div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" value="" checked="">
									      <span>
									        함덕/김녕
									      </span>
								    </div>
								  </div>
								</div>
								
								<div class="container" id="details_font">
								  <div class="row">
							  	   <div class="col-md-3">
							  	   		<span>숙소가격</span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="stayprice" value="">
									      <span>
									        만원 미만
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="stayprice" value="">
									      <span>
									       1만 ~ 3만 미만
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="stayprice" value="">
									      <span>
									        3만 ~ 5만 미만
									      </span>
								    </div>
								  </div>
								  <div class="row">
								  	<div class="col-md-3 offset-md-3">
								  		<input class="form-check-input flex-shrink-0" type="radio" name="stayprice" value="">
									      <span>
									        5만 이상
									      </span>
								  	</div>
								</div>
						    </div>
						    
						    
						    <div class="container" id="details_font">
								  <div class="row">
							  	   <div class="col-md-3">
							  	   		<span>맛집가격</span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="storeprice" value="">
									      <span>
									        만원 미만
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="storeprice" value="">
									      <span>
									       1만 ~ 3만 미만
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="storeprice" value="">
									      <span>
									        3만 ~ 5만 미만
									      </span>
								    </div>
								  </div>
								  <div class="row">
								  	<div class="col-md-3 offset-md-3">
								  		<input class="form-check-input flex-shrink-0" type="radio" name="storeprice" value="">
									      <span>
									        5만 이상
									      </span>
								  	</div>
								</div>
						    </div>
						    
						    
						    
						    
						  </div>
						</div>
					
					
						                      
                  </div>
              </div>
          </div>
		
			          
           <div class="container">

              <div class="row">
                  <div class="col-md-6" id="storeSection">
                      <h2 class="mb50"><span class="heading-font text-uppercase">맛집</span>${storeList.size() }건</h2>
                      
                     <%--  <c:forEach var="store" items="${storeList }" varStatus="i">
                      	<div class="host-item">
                          <div class="row">
                              <div class="col-xs-3">
                              	<div class="img-wrapper">
                                  <img src="images/jj/${store.host_photo }" class="img-responsive">
                                 </div>
                              </div>
                            <div class="col-xs-9">
                                  <h3>${store.host_name } <span class="theme-accent-color"> ${store.host_avg }</span>
                                   </h3>
                                   <div id="storemap${i.index }" style="width:100%;height:350px;"></div>
                                  <p>${store.host_addr }<br>가격대 : ${store.min_price }~${store.max_price }
                                  <br>${store.type_name }&ensp;찜한수 : ${store.like_count }&ensp;리뷰 : ${store.rev_count }
                                   </p>
                              </div>
                          </div>
                          <div class="row">
                          	<div id='storemap"+index+"' style='width:100%;height:350px;'></div>
                          </div>
                       </div>
                      </c:forEach> --%>
                  </div>

                   <div class="col-md-6" id="staySection">
                      <h2 class="mb50"><span class="heading-font text-uppercase">숙박</span>${stayList.size() }건</h2>
						<%-- <c:forEach var="stay" items="${stayList }">
                      	<div class="host-item">
                          <div class="row">
                              <div class="col-5">
                              	<div class="img-wrapper">
                                  <img src="images/jj/${stay.host_photo }" class="img-responsive">
                                 </div>
                              </div>
                              <div class="col-7">
                                  <h3>${stay.host_name } <span class="theme-accent-color"> ${stay.host_avg }</span><button>지도</button> </h3>
                                  <p>${stay.host_addr }<br>평일비용 : ${stay.min_dayfee }~${stay.max_dayfee }
                                  <br>주말비용 : ${stay.min_weekfee }~${stay.max_weekfee }
                                  <br>${stay.type_name }&ensp;찜한수 : ${stay.like_count }&ensp;리뷰 : ${stay.rev_count }
                                   </p>
                              </div>
                            </div>
                          <div class='row'>
                          	<div class='col-12'>
                          		<div id='staymap"+index+"' style='width:100%;height:350px;'></div>
			               </div>
			             </div>
			            </div>
                      </c:forEach> --%>
                  </div>
              </div>
          </div>
    
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e16bda872939904d33c13e42c58e211b&libraries=services"></script>
	<script type="text/javascript" src="js/jj/mapApi.js"></script>
</body>
</html>