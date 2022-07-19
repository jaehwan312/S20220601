<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
  <!-- Css Styles -->
 <!-- Icons font CSS-->
    <link href="css/bh/daterangepicker.css" rel="stylesheet" media="all">
    <link href="css/bh/datepicks.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="css/bh/style.css" type="text/css">
    <link rel="stylesheet" href="css/bh/mapapi.css" type="text/css">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
<input type="hidden" name="host_num" value="${host_num }" id="hostNumId">
<input type="hidden" name="mem_num" value="${mem_num }" id="memNumId">
<input type="hidden" name="room_num" value="${room_num }" id="roomNumId">
<!-- test st -->
<div class="row mb-4 mt-5">
    <div class="col-8">
    <!-- 사진 -->
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        	<div id="carousel_inner" class="carousel-inner centers">
          		<c:forEach items="${stayPhoto }" var="getPhoto" varStatus="i">
		            <c:if test="${i.index==0 }">
		               <div id="host_img_box" class="carousel-item active">
		                <img src="images/bh/${getPhoto.host_photo}" class="d-block w-100" alt="숙소사진">
		              </div>
		            </c:if>
		            <c:if test="${i.index!=0 }">
		               <div id="host_img_box" class="carousel-item">
		                <img src="images/bh/${getPhoto.host_photo}" class="d-block w-100" alt="숙소사진">
		              </div>
		            </c:if>
        		</c:forEach>
        	</div>
          <button class="carousel-control-prev" id="slide_btn" type="button" data-bs-target="#carouselExampleControls${i.index }" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" id="slide_btn" type="button" data-bs-target="#carouselExampleControls${i.index }" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
    <!-- 사진 -->
    </div>
    
    <div class="col-4 host_data">
        <div class="product__details__text">
        	<div class="stay_name">
        		<h3 id="stayname">${stay.host_name}</h3>
        		<b class="product__details__rating">${stay.host_avg}</b>
        	</div>
            <div id="stayaddr">${stay.host_addr}</div>
			<hr>
            <div class="product__details__price">${stay.host_info}</div>
           
        </div>
		<div class="host_btn">
            <form style="display:inline-block;" action="stayUpdateForm">
            	<input type="hidden" name="host_num" value="${host_num }">
            	<c:if test="${host_mem_num==mem_num}">
            		<button class="btn btn-outline-danger" type="submit" >숙소 수정</button>
            	</c:if>
        	</form>
			<form style="display:inline-block;" action="stayDelete" id="stayDeleteForm">
				<input type="hidden" name="host_num" value="${host_num }">
				<c:if test="${host_mem_num==mem_num}">
					<button class="btn btn-outline-danger" type="button" onclick="stayremoveCheck()">삭제요청</button>
				</c:if>
			</form>
    		<form style="display:inline-block;" action="roomInsertForm" id="roomInsertForm" method="post">
				<input type="hidden" name="host_num" value="${host_num }">
				<c:if test="${host_mem_num==mem_num }">
					<button class="btn btn-outline-danger" type="submit" onclick="roomInsertCheck()">객실추가</button>
				</c:if>
			</form>
		</div>
    </div>
	<div class="product__details__tab col-12" id="tab_list">
	    <ul class="nav nav-tabs" role="tablist">
	        <li class="nav-item" >
	            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
	                aria-selected="true" onclick="menushow(0)">객실안내/예약</a>
	        </li>
	        <li class="nav-item" >
	            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
	                aria-selected="false" onclick="menushow(1)">숙소 정보</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
	                aria-selected="false" onclick="menushow(2)">리뷰 </a>
	        </li>
	    </ul>
	    <div class="tab-content">
	        <div class="tab-pane active" id="tabs-1" role="tabpanel">
	            
	        </div>
	        <div class="tab-pane" id="tabs-2" role="tabpanel">
	           
	        </div>
	        <div class="tab-pane" id="tabs-3" role="tabpanel">
	          
	        </div>
	    </div>
	</div>
</div>
	    
		<div id="onRoom0">
			<div class="container">
		    	<div class="col-4" style="margin: auto;">
	    		  <div class="row row-space">
	                      <div class="col-6">
	                          <div class="input-group">
	                              <label class="label">체크인</label>
	                              <input class="input--style-1" type="text" name="check-in" placeholder="mm/dd/yyyy" id="input-start">
	                              <i class="zmdi zmdi-calendar-alt input-group-symbol"></i>
	                          </div>
	                      </div>
	                      <div class="col-6">
	                          <div class="input-group">
	                              <label class="label">체크아웃</label>
	                              <input class="input--style-1" type="text" name="check-out" placeholder="mm/dd/yyyy" id="input-end">
	                              <i class="zmdi zmdi-calendar-alt input-group-symbol"></i>
	                          </div>
	                      </div>
	                    </div>
		    	</div>
		    </div>
		
				<!-- jj -->
					<div class="host-item">
						<div>
						<c:forEach items="${roomPhoto }" var="room" varStatus="j">
							<div class="row mb-5 mt-5 res_contents">
							<div class="col-7" id="res_photo_box">
								<div id="carouselExampleControls${j.index }" class="carousel slide" data-bs-ride="carousel">
				                    <div class="carousel-inner centers">
							<c:forEach items="${room.roomPhotos }" var="getroom" varStatus="i">
								<div class="img-wrapper">
			                       <c:if test="${i.index==0 }">
			                          <div class="carousel-item active">
			                           <img src="images/room/${getroom.room_photo}" class="d-block w-100" alt="숙소사진" style="height: 250px;">
			                         </div>
			                       </c:if>
			                       <c:if test="${i.index!=0 }">
			                          <div class="carousel-item">
			                           <img src="images/room/${getroom.room_photo}" class="d-block w-100" alt="숙소사진" style="height: 250px;">
			                         </div>
			                       </c:if>
								</div>
			             	 	<button class="carousel-control-prev" id="slide_btn" type="button" data-bs-target="#carouselExampleControls${j.index }" data-bs-slide="prev">
			                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			                      <span class="visually-hidden">Previous</span>
			                    </button>
			                    <button class="carousel-control-next" id="slide_btn" type="button" data-bs-target="#carouselExampleControls${j.index }" data-bs-slide="next">
			                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
			                      <span class="visually-hidden">Next</span>
			                    </button>
			             	</c:forEach>
			                    </div></div>
							</div>
						<div class="col-1"></div>
						<div class="col-4">
							<div class="row res_states">
								<div class="col-6 res_state">
									<b>${room.room_name }</b>
									<b>${room.dayfee } 원</b>
									<b>${room.room_info }</b>
								</div>
								<div class="col-6 res_state_btn">
									<form id="frm${j.index }" action="resContent" onsubmit="return false">
										<input type="hidden" name="host_num" value="${room.host_num }">
										<input type="hidden" name="room_num" value="${room.room_num }">
										<input type="hidden" name="res_start" class="res_start">
										<input type="hidden" name="res_end" class="res_end">
										<input type="hidden" name="sale_price" value=${room.dayfee }>
										<button type="submit" class="btn btn-outline-primary" id="goReserve" onclick="chkDate(${j.index })">예약</button>
									</form>
									<div>
										<form action="roomUpdateForm">
											<input type="hidden" name="host_num" value="${room.host_num }">
											<input type="hidden" name="room_num" value="${room.room_num }">
											<c:if test="${host_mem_num==mem_num }">
												<button class="btn btn-outline-danger" type="submit">객실수정</button>
											</c:if>
										</form>
										<form action="roomDelete" id="roomDeleteForm">
											<input type="hidden" name="host_num" value="${room.host_num }">
											<input type="hidden" name="room_num" value="${room.room_num }">
											<c:if test="${host_mem_num==mem_num }">
												<button class="btn btn-outline-danger" type="submit" onclick="roomremoveCheck()">객실삭제</button>
											</c:if>
										</form>
									</div>
								</div>
							</div>
							<span id="resPossible${j.index }" ></span>
						</div>
						</div>
						</c:forEach>
						</div>
					</div>
				<!--  -->
			</div>
			
			
		<div class="on_room1" id="onRoom1">
		 	
				
			<!--  -->
			<div class="accordion" id="accordionPanelsStayOpenExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
			       	 기본정보
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
			      <div class="accordion-body">
			        <strong><br>오는길 : ${stayinfo.way}<br><br>
				        		체크인 : ${stayinfo.checkin }<br><br>
			    				체크아웃 : ${stayinfo.checkout }</strong><br><br> 
			    			<div class="maps" id="staymap"></div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
			        	편의 시설
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
			      <div class="accordion-body">
			        <strong>${stayinfo.convenient}</strong> 
			      </div>
			    </div>
			  </div>
			<!--  -->
		</div>
		</div>
		</div>
	
		<div class="on_room2" id="onRoom2">
			<!-- review -->
				 <div>
				 <c:if test="${hostreview.rev_count == 0}"><img alt="리뷰" src="images/bh/한라봉01.png"></c:if>
				<c:if test="${hostreview.rev_count != 0}">
				<div class="totalData">
					<h1 class="total_gradeLevel"><b>평점 :</b>&nbsp<strong>${hostreview.host_avg}</strong></h1>
					<h2 class="total_revNumber"><strong>총 리뷰 :</strong>&nbsp<b>${hostreview.rev_count }</b></h2>
					<hr>
				</div>
				<!-- start -->
	            <c:forEach items="${maps }" var="map" varStatus="l">

	            <div>
	            	<div class="rev_infos">
	            		<div>
							<div class="">
								<c:if test="${map.content.photo == null }">
									<img style="border-radius: 70%; width: 150px; height: 150px; box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;" alt="${map.content.photo }" src="images/profile/기본.png">
								</c:if>
								<c:if test="${map.content.photo != null }">
									<img style="border-radius: 70%; width: 150px; height: 150px; box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;" alt="${map.content.photo }" src="images/profile/${map.content.photo }">
								</c:if>
							</div>
	            			<div class="total_gradeLevel"><b>평점 :</b>&nbsp<strong>${map.content.rev_point}</strong></div>
	            			<div><b>객실 : ${map.content.room_name}</b></div>
	            		</div>
		            	
						<div>
							<div id="carouselExampleControls3${l.index }" class="carousel slide" data-bs-ride="carousel" style="width: 400px;">
								<div class="carousel-inner">
									<c:forEach items="${map.content.revPhoto }" var="getPhoto" varStatus="r">
										<c:if test="${r.index==0 }">
											<div class="carousel-item active">
												<img src="images/bh/${getPhoto.rev_photo}" class="d-block w-100" alt="리뷰사진" style="height: 250px;">
											</div>
										</c:if>
										<c:if test="${r.index!=0 }">
											<div class="carousel-item">
												<img src="images/bh/${getPhoto.rev_photo}" class="d-block w-100" alt="리뷰사진" style="height: 250px;">
											</div>
										</c:if>
									</c:forEach>
								</div>
								<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls3${l.index }" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls3${l.index }" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
		            	
	            		<div>등록일자 : ${map.content.rev_date}</div>
	            	</div>
	            	<div class="review">${map.content.rev_content}</div>
	            	
               		<form style="display:inline-block;" action="reviewUpdateForm">
	               		<input type="hidden" name="host_num" value="${host_num }">
				   		<input type="hidden" name="rev_num" value="${map.content.rev_num }">
				   		<c:if test="${map.content.mem_num==mem_num }">
	               		<button class="btn btn-outline-danger">수정</button>
	               		</c:if>
	               </form> 
	               <form style="display:inline-block;" action="reviewDelete" id="reviewDeleteForm">
	               		<input type="hidden" name="host_num" value="${host_num }">
				   		<input type="hidden" name="rev_num" value="${map.content.rev_num }">
				   		<c:if test="${map.content.mem_num==mem_num }">
	               		<button type="button" class="btn btn-outline-danger" onclick="revDeleteCheck()">삭제</button>
	               		</c:if>
	               </form> 
	               
	               <c:if test="${map.reply!=null }">
		            	<div class="row host_rev_after">
	            			<div class="col-2">
								<c:if test="${map.reply.photo == null }">
									<img style="border-radius: 70%; width: 150px; height: 150px" alt="${map.content.photo }" src="images/profile/기본.png">
								</c:if>
								<c:if test="${map.reply.photo != null }">
									<img style="border-radius: 70%; width: 150px; height: 150px;" src="images/profile/${map.reply.photo}">
								</c:if>
							</div>
							<div class="col-10 host_reply">
								<p>등록일자 : ${map.reply.rev_date }</p>
								<h2><b>FROM HOST</b></h2>
								<div>${map.reply.rev_content }</div>
							</div>
		            	</div>
		            </c:if>
	               
					<form  action="reviewRef" id="reviewRef">
						<input type="hidden" name="host_num" value="${host_num }">
						<input type="hidden" name="rev_num" value="${map.content.rev_num }">
						<c:if test="${host_mem_num==mem_num}">
							<b>To Guest<b>
							<textarea class="host_rev" rows="10" cols="10" name="rev_content"></textarea>
							<button type="button" class="btn btn-outline-primary host_revBtn" onclick="revRefCheck()">답글달기</button>
						</c:if>
					</form>
	            </div>

	            </c:forEach> 
				<!--end  -->
			</c:if>
			</div>
		</div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/bh/stayinfo.js"></script>
	<script type="text/javascript" src="js/bh/reviewRead.js"></script>
    <script src="js/bh/select2/select2.min.js"></script>
    <script src="js/bh/datepicker/moment.min.js"></script>
    <script src="js/bh/datepicker/daterangepicker.js"></script>
    <script src="js/bh/bootstrap.min.js"></script>
    <!-- Main JS-->
    <script src="js/bh/global.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e16bda872939904d33c13e42c58e211b&libraries=services"></script>
</body>
</html>