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
    	 
          <div class="container">
              <div class="row">
                  <div class="col-lg-12 text-center mb100">

				<c:if test="${selectSection=='0' }">
					<div class="travel-type-wrap" id="wrap_both">
						<div class="item active" onclick="selectSection(0)">
							<div class="group-icon">
								<i class="fa-solid fa-utensils fa-lg"></i> 
								<i class="fa-solid fa-hotel fa-lg"></i>
							</div>
							<span>맛집+숙박</span>
						</div>
						<div class="item" onclick="selectSection(2)">
							<div class="group-icon">
								<i class="fa-solid fa-utensils fa-lg"></i>
							</div>
							<span>맛집</span>
						</div>
						<div class="item" onclick="selectSection(1)">
							<div class="group-icon">
								<i class="fa-solid fa-hotel fa-lg"></i>
							</div>
							<span>숙박</span>
						</div>
					</div>
				</c:if>
				<c:if test="${selectSection=='1' }">
					<div class="travel-type-wrap" id=wrap_stay>
						<div class="item active">
							<div class="group-icon">
								<i class="fa-solid fa-hotel fa-2x"></i>
							</div>
							<span>숙박</span>
						</div>
					</div>
				</c:if>
				<c:if test="${selectSection=='2' }">
					<div class="travel-type-wrap" id="wrap_food">
						<div class="item active">
							<div class="group-icon">
								<i class="fa-solid fa-utensils fa-2x"></i>
							</div>
							<span>맛집</span>
						</div>
					</div>
				</c:if>
					


                      <hr class="thin-hr">
                      <c:if test="${selectSection=='0' }">
                      	<h3 class="section-subheading secondary-font" style="margin-bottom: 30px;" id="section_heading_sub">'${keyword }'에 대한 검색 결과</h3>
                      </c:if>
                      
			      	  <button type="button" class="btn btn-success" onclick="collapse()">상세 검색</button>
			      	  
			      	  
			      	  
						<div class="detail"  style="min-height: 120px;">
						    
						    <div class="col-md-8" id="details"> 
								
								<form action="" id="orderAjax">
								 	<input type="hidden" name="keyword" value="${keyword }" id="callKeyword">
								 	<input type="hidden" name="selection" value="${selection }" id="selectionId">
								
								
								<div class="container" id="detail_order">
								  <div class="row">
							  	   <div class="col-md-3">
							  	   		<span>검색순서</span>
								    </div>
								    <div class="col-md-3">
								    	<input type="radio" id="radioOne" value="0" name="order" onclick="ajaxList()">
					    				<label for="radioOne" class="radiobtn">평점순</label>
								    </div>
								    <div class="col-md-3">
								    	<input type="radio" id="radioTwo" value="1" name="order" onclick="ajaxList()">
					    				<label for="radioTwo" class="radiobtn">찜많은순</label>
								    </div>
								    <div class="col-md-3">
								    	  <input type="radio" id="radioThree" value="2" name="order" onclick="ajaxList()">
					    				  <label for="radioThree" class="radiobtn">가격순</label>
								    </div>
								  </div>

						    </div>
								
								
								<div class="container" id="detail_region">
								  <div class="row">
							  	   <div class="col-md-3">
							  	   		<span>지역별</span>
								    </div>
								    <div class="col-md-3">
								      <input type="checkbox" id="checkboxOne" value="0" name="region" checked="" onclick="ajaxList()">
					    			  <label for="checkboxOne" class="checkboxbtn">대정읍/안덕면</label>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="region" value="1" checked="" onclick="ajaxList()">
									      <span>
									        서귀동
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="region" value="2" checked="" onclick="ajaxList()">
									      <span>
									        성산읍/우도면
									      </span>
								    </div>
								  </div>
								  <div class="row">
								  	<div class="col-md-3 offset-md-3">
								  		<input class="form-check-input flex-shrink-0" type="checkbox" name="region" value="3" checked="" onclick="ajaxList()">
									      <span>
									        제주시/노형동
									      </span>
								  	</div>
								  	<div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="region" value="4" checked="" onclick="ajaxList()">
									      <span>
									        중문동
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="region" value="5" checked="" onclick="ajaxList()">
									      <span>
									        표선면
									      </span>
								    </div>
								  </div>
								  <div class="row">
								  	<div class="col-md-3 offset-md-3">
								  		<input class="form-check-input flex-shrink-0" type="checkbox" name="region" value="6" checked="" onclick="ajaxList()">
									      <span>
									        한림읍/애월읍
									      </span>
								  	</div>
								  	<div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="region" value="7" checked="" onclick="ajaxList()">
									      <span>
									        조천읍/구좌읍
									      </span>
								    </div>
								  </div>
								</div>
						    
						     </form>
						    
						    
						  </div>
					
					
						                      
                  </div>
              </div>
          </div>
		
			          
           <div class="container">

              <div class="row">
                  <div class="col-md-6" id="storeSection">
                      <h2 class="mb50"></h2>
                      <div id="storedetails">
                      <form action="" id="storeTypeAjax">
                      <div class="container" id="detail_storetype">
								  <div class="row">
							  	   <div class="col-md-3">
							  	   		<span>종류별</span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="food_type" value="0" checked="" onclick="ajaxList()">
									      <span>
									        한식
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="food_type" value="1" checked="" onclick="ajaxList()">
									      <span>
									        일식
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="food_type" value="2" checked="" onclick="ajaxList()">
									      <span>
									        중식
									      </span>
								    </div>
								  </div>
								  <div class="row">
								  	<div class="col-md-3 offset-md-3">
								  		<input class="form-check-input flex-shrink-0" type="checkbox" name="food_type" value="3" checked="" onclick="ajaxList()">
									      <span>
									        양식
									      </span>
								  	</div>
								  	<div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="food_type" value="4" checked="" onclick="ajaxList()">
									      <span>
									        카페
									      </span>
								    </div>
								  </div>
								  </div>
							<div class="container" id="detail_storeprice">
								  <div class="row">
							  	   <div class="col-md-3">
							  	   		<span>가격별</span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="storeprice" value="0" checked="checked" onclick="ajaxList()">
									      <span>
									        전체
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="storeprice" value="1" onclick="ajaxList()">
									      <span>
									        만원 미만
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="storeprice" value="2" onclick="ajaxList()">
									      <span>
									       1만 ~ 3만
									      </span>
								    </div>
								    
								  </div>
								  <div class="row">
								    <div class="col-md-3 offset-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="storeprice" value="3" onclick="ajaxList()">
									      <span>
									        3만 ~ 5만
									      </span>
								    </div>
								  	<div class="col-md-3">
								  		<input class="form-check-input flex-shrink-0" type="radio" name="storeprice" value="4" onclick="ajaxList()">
									      <span>
									        5만 이상
									      </span>
								  	</div>
								</div>
						    </div>	  
								  
							</form>
                      </div>
                      
                      <div id="storeEmpty">
                      	<div class="innerEmpty">
	                  	   <img alt="" src="images/jj/물음표1.png" class="emptyImages">
	                      <h2 class="emptyMsg">검색 결과가 없습니다</h2>
	                     </div>
	                  </div>
                      
                      
                     <%--  <c:forEach var="store" items="${storeList }" varStatus="i">
                      	<div class="host-item">
                          <div class="row">
                              <div class="col-xs-3">
                              	<div class="img-wrapper">
                                  <img src="images/jj/${store.host_photo }" class="img-responsive">
                                 </div>
                              </div>
                            <div class="col-xs-9">
                                  <h3>${store.host_name }</h3>
                                   <div class='product__details__rating'>
			                            <i class='fa fa-star'></i>
			                            <i class='fa fa-star'></i>
			                            <i class='fa fa-star'></i>
			                            <i class='fa fa-star'></i>
			                            <i class='fa fa-star-half-o'></i>
			                            <span>${store.host_avg }</span>
			                        </div>
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
                      <h2 class="mb50"></h2>
                      <div id="staydetails">
                      <form action="" id="stayTypeAjax">
                      <div class="container" id="detail_staytype">
								  <div class="row">
							  	   <div class="col-md-3">
							  	   		<span>종류별</span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="stay_type" value="0" checked="" onclick="ajaxList()">
									      <span>
									        모텔
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="stay_type" value="1" checked="" onclick="ajaxList()">
									      <span>
									        호텔
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="checkbox" name="stay_type" value="2" checked="" onclick="ajaxList()">
									      <span>
									        펜션
									      </span>
								    </div>
								  </div>
								  <div class="row">
								  	<div class="col-md-3 offset-md-3">
								  		<input class="form-check-input flex-shrink-0" type="checkbox" name="stay_type" value="3" checked="" onclick="ajaxList()">
									      <span>
									        게스트하우스
									      </span>
								  	</div>
								  </div>
								  </div>
							<div class="container" id="detail_stayprice">	  
								  <div class="row">
							  	   <div class="col-md-3">
							  	   		<span>가격별</span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="stayprice" checked="checked" value="0" onclick="ajaxList()">
									      <span>
									        전체
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="stayprice" value="1" onclick="ajaxList()">
									      <span>
									        만원 미만
									      </span>
								    </div>
								    <div class="col-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="stayprice" value="2" onclick="ajaxList()">
									      <span>
									       1만 ~ 3만
									      </span>
								    </div>
								  </div>
								  <div class="row">
								  	<div class="col-md-3 offset-md-3">
								      <input class="form-check-input flex-shrink-0" type="radio" name="stayprice" value="3" onclick="ajaxList()">
									      <span>
									        3만 ~ 5만
									      </span>
								    </div>
								  	<div class="col-md-3">
								  		<input class="form-check-input flex-shrink-0" type="radio" name="stayprice" value="4" onclick="ajaxList()">
									      <span>
									        5만 이상
									      </span>
								  	</div>
								  </div>
								  
								</div>
								  
							</form>
                      </div>
                      <div id="stayEmpty">
                      	<div class="innerEmpty">
	                  	   <img alt="" src="images/jj/물음표1.png" class="emptyImages">
	                      <h2 class="emptyMsg">검색 결과가 없습니다</h2>
	                     </div>
	                  </div>
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
                  <div class="col-md-12" id="totalEmpty">
                  	<div class="innerEmpty">
                  	   <img alt="" src="images/jj/물음표1.png" class="emptyImages2">
                      <h2 class="emptyMsg">검색 결과가 없습니다</h2>
                     </div>
                  </div>
              </div>
          </div>
          </div>
    
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="js/jj/flatpickr.js"></script>
    <script>
      flatpickr(".datepicker",
      {
        dateFormat: "m/d/y"
      });
      var btnTypes = document.querySelectorAll('.travel-type-wrap .item')
      for (let i = 0; i < btnTypes.length; i++)
      {
        btnTypes[i].addEventListener('click', function()
        {
          for (let i = 0; i < btnTypes.length; i++)
          {
            btnTypes[i].classList.remove('active')
          }
          btnTypes[i].classList.add('active')
        })
      }

    </script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e16bda872939904d33c13e42c58e211b&libraries=services"></script>
	<script type="text/javascript" src="js/jj/mapApi.js"></script>
</body>
</html>