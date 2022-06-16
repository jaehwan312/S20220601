<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:forEach items="${roomPhoto }" var="room" varStatus="j">
					<p>
					<div style="text-align: left; width: 100%; float: left; height: 200px; margin-top: 50px;">
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
</body>
</html>