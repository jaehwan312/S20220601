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
<link rel="stylesheet" href="css/main.css">
   <!-- Css Styles -->
    <link rel="stylesheet" href="css/bh/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/bh/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/bh/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/bh/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/bh/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/bh/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/bh/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/bh/style.css" type="text/css">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
		<div>
			

		
		<!-- test st -->
		<section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                    <!-- 사진 -->
		                <div style="width: 50%; float: left;">
		                  <div id="carouselExampleControls${j.index }" class="carousel slide" data-bs-ride="carousel" style="width: 100%;">
		                    <div class="carousel-inner">
		                    <c:forEach items="${stayPhoto }" var="getPhoto" varStatus="i">
		                       <c:if test="${i.index==0 }">
		                          <div class="carousel-item active">
		                           <img src="images/bh/${getPhoto.host_photo}" class="d-block w-100" alt="리뷰사진" style="height: 250px;">
		                         </div>
		                       </c:if>
		                       <c:if test="${i.index!=0 }">
		                          <div class="carousel-item">
		                           <img src="images/bh/${getPhoto.host_photo}" class="d-block w-100" alt="리뷰사진" style="height: 250px;">
		                         </div>
		                       </c:if>
		                  </c:forEach>
		                    </div>
		                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls${j.index }" data-bs-slide="prev">
		                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		                      <span class="visually-hidden">Previous</span>
		                    </button>
		                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls${j.index }" data-bs-slide="next">
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
                        <h3>${stay.host_name}</h3>
                        <div class="product__details__rating">
                            ${stay.host_avg} ${stay.rev_count}
                        </div>
                        	${stay.host_addr}
                        <div class="product__details__price">${stay.host_info}</div>
                       
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item" >
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">객실안내/예약</a>
                            </li>
                            <li class="nav-item" id="stay">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">숙소 정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">리뷰 <span>(1)</span></a>
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
		<!-- test end -->
		<!--  -->
		
		                  
		
	<!--  -->
		<div>
			<c:forEach items="${roomPhoto }" var="room" varStatus="j">
				<p><div style="text-align: left; width: 100%; float: left; height: 200px; margin-top: 50px;">
			<div style="border: 1px solid black; margin-bottom: 20px;">
					<%-- <c:forEach items="${room.roomPhotos }" var="photo">
						<img alt="객실사진" src="images/bh/${photo.room_photo}" width="200px;"
						height="200px;">
					</c:forEach> --%>
					
					<div id="carouselExampleControls${j.index }" class="carousel slide" data-bs-ride="carousel" style="width: 400px;">
		                    <div class="carousel-inner">
		                    <c:forEach items="${room.roomPhotos  }" var="getPhoto" varStatus="i">
		                       <c:if test="${i.index==0 }">
		                          <div class="carousel-item active">
		                           <img src="images/bh/${getPhoto.room_photo}" class="d-block w-100" alt="리뷰사진" style="height: 250px;">
		                         </div>
		                       </c:if>
		                       <c:if test="${i.index!=0 }">
		                          <div class="carousel-item">
		                           <img src="images/bh/${getPhoto.room_photo}" class="d-block w-100" alt="리뷰사진" style="height: 250px;">
		                         </div>
		                       </c:if>
		                  </c:forEach>
		                    </div>
		                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls${j.index }" data-bs-slide="prev">
		                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		                      <span class="visually-hidden">Previous</span>
		                    </button>
		                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls${j.index }" data-bs-slide="next">
		                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
		                      <span class="visually-hidden">Next</span>
		                    </button>
		                  </div>
		                  </div>
							<li style="float: right; width: 30%; height: 200px;">
										${room.room_name }<p />
										${room.dayfee }원<p />
										${room.room_info }<p />
							<!-- 예약페이지에 가져갈 값 *날짜는 임의설정 , * 가격도 수정 해야함-->
								<form action="resContent" method="post">
									<input type="hidden" name="host_num" value="${room.host_num }">
									<input type="hidden" name="room_num" value="${room.room_num }">
									<input type="hidden" name="res_start" value="2022-06-26">
									<input type="hidden" name="res_end" value="2022-06-30">
									<input type="hidden" name="sale_price" value=${room.dayfee }>
									<button type="submit">예약</button>
								</form>
							</li>
		                  </div>
					</c:forEach>
							
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