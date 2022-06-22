<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div>
			<input type="hidden" name="host_num" value="${host_num }" id="hostNumId">
			<input type="hidden" name="mem_num" value="${mem_num }" id="memNumId">
			<input type="hidden" name="room_num" value="${room_num }" id="roomNumId">
			<!-- test st -->
			<section class="product-details spad">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-6 col-md-6">
	                    <div class="product__details__pic">
	                    <!-- 사진 -->
			                <div style="width: 500px; height:300px; overflow-x: hidden; float: left; margin: 0px; padding: 0px;">
			                  <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			                    <div class="carousel-inner">
			                    <c:forEach items="${stayPhoto }" var="getPhoto" varStatus="i">
			                       <c:if test="${i.index==0 }">
			                          <div class="carousel-item active">
			                           <img src="images/bh/${getPhoto.host_photo}" class="d-block w-100" alt="숙소사진" style="height: 250px;">
			                         </div>
			                       </c:if>
			                       <c:if test="${i.index!=0 }">
			                          <div class="carousel-item">
			                           <img src="images/bh/${getPhoto.host_photo}" class="d-block w-100" alt="숙소사진" style="height: 250px;">
			                         </div>
			                       </c:if>
			                  </c:forEach>
			                    </div>
			                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls${i.index }" data-bs-slide="prev">
			                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			                      <span class="visually-hidden">Previous</span>
			                    </button>
			                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls${i.index }" data-bs-slide="next">
			                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
			                      <span class="visually-hidden">Next</span>
			                    </button>
			                  </div>
			                  </div>
	                       <!-- 사진 -->
	                    </div>
	                </div>
	                <div class="col-lg-6 col-md-6">
	                    <div class="product__details__text">
	                        <h3 id="stayname">${stay.host_name}</h3>
	                        <form action="stayUpdateForm">
		                        <input type="hidden" name="host_num" value="${host_num }">
			                        <c:if test="${host_mem_num==mem_num}">
			                        	<button class="btn btn-outline-danger" type="submit" >숙소 수정</button>
			                        </c:if>
		                    </form>
	                        <form action="stayDelete" id="stayDeleteForm">
		                        <input type="hidden" name="host_num" value="${host_num }">
			                        <c:if test="${host_mem_num==mem_num}">
			                        	<button class="btn btn-outline-danger" type="button" onclick="stayremoveCheck()">삭제요청</button>
			                        </c:if>
		                    </form>
	                        <form action="roomInsertForm" id="roomInsertForm" method="post">
									<input type="hidden" name="host_num" value="${host_num }">
										<c:if test="${host_mem_num==mem_num }">
											<button class="btn btn-outline-danger" type="submit" onclick="roomInsertCheck()">객실추가</button>
										</c:if>
							</form>
	                        <div class="product__details__rating">
	                            ${stay.host_avg} ${stay.rev_count}
	                        </div>
	                        <div id="stayaddr">${stay.host_addr}</div>
	                        <div class="product__details__price">${stay.host_info}</div>
	                       
	                    </div>
	                </div>
	                <div class="col-lg-12">
	                    <div class="product__details__tab">
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
	            </div>
	        </div>
	    </section>
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
						<div class="row">
						<c:forEach items="${roomPhoto }" var="room" varStatus="j">
							<div class="col-5">
								<div id="carouselExampleControls${j.index }" class="carousel slide" data-bs-ride="carousel" style="width: 400px; float: left; margin: 0px; padding: 0px;">
				                    <div class="carousel-inner">
							<c:forEach items="${room.roomPhotos }" var="getroom" varStatus="i">
								<div class="img-wrapper">
			                       <c:if test="${i.index==0 }">
			                          <div class="carousel-item active">
			                           <img src="images/bh/${getroom.room_photo}" class="d-block w-100" alt="숙소사진" style="height: 250px;">
			                         </div>
			                       </c:if>
			                       <c:if test="${i.index!=0 }">
			                          <div class="carousel-item">
			                           <img src="images/bh/${getroom.room_photo}" class="d-block w-100" alt="숙소사진" style="height: 250px;">
			                         </div>
			                       </c:if>
								</div>
			             	 	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls${j.index }" data-bs-slide="prev">
			                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			                      <span class="visually-hidden">Previous</span>
			                    </button>
			                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls${j.index }" data-bs-slide="next">
			                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
			                      <span class="visually-hidden">Next</span>
			                    </button>
			             	</c:forEach>
			                    </div></div>
							</div>
						<div class="col-7">
							<div style="float: right; width: 30%; height: 200px;">
								${room.room_name }<p/>
								${room.dayfee }원<p/>
								${room.room_info }<p/>
								
								<form action="resContent" method="post">
									<input type="hidden" name="host_num" value="${room.host_num }">
									<input type="hidden" name="room_num" value="${room.room_num }">
									<input type="hidden" name="res_start" id="res_start">
									<input type="hidden" name="res_end" id="res_end">
									<input type="hidden" name="sale_price" value=${room.dayfee }>
									<button type="submit" id="goReserve" onclick="chkDate(${j.index })">예약</button>
								</form>
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
							<span id="resPossible${j.index }" >여기다넣자</span>
							
						</div>
						</c:forEach>
						</div>
					</div>
				<!--  -->
			</div>
			
			
		<div id="onRoom1" style="margin-bottom: 100px;">
		 	
				
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
	
		<div id="onRoom2">
			<!-- review -->
				 <div style="text-align: center; margin-top: 100px;">
	
				<h1>리뷰</h1>
				<div>
					<h2>${hostreview.host_avg}</h2>
					<p />
					리뷰 : ${hostreview.rev_count }
				</div>
				<!-- start -->
				<div style="padding: 80px; border: 1px solid black;">
	            <c:forEach items="${reviewList }" var="getList" varStatus="l">
	            <div style="border: 1px solid black; margin-top: 20px;">
	            	<div>${getList.rev_point}</div>
	               <div style="text-align: left; padding-left: 70px; padding-top:30px;">
	                      ${getList.room_name}
	                </div>
	                <div style="width: 40%; text-align: left; padding-left: 60px; padding-bottom: 30px; padding-top: 30px;">
	                  ${getList.rev_content}</div>
	               <div style="width: 100%; height: 200px; text-align: left; padding-left: 60px; margin-bottom: 30px; ">
	                  <div id="carouselExampleControls3${l.index }" class="carousel slide" data-bs-ride="carousel" style="width: 400px;">
	                    <div class="carousel-inner">
	                    <c:forEach items="${getList.revPhoto }" var="getPhoto" varStatus="r">
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
	               ${getList.rev_date} 
	               <button>수정</button> <button>삭제</button>
	            </div>
	            
	            </c:forEach> 
	         </div>
				<!--end  -->
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
    <!-- Main JS-->
    <script src="js/bh/global.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e16bda872939904d33c13e42c58e211b&libraries=services"></script>
</body>
</html>