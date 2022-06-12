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
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
		<div>
		<div>
		<c:forEach items="${stayPhoto }" var="photo">
			<div style="float: left; width: 30%; height: 300px;">
				<img alt="숙소사진" src="images/bh/${photo.host_photo}" width="300px;"
					height="300px;">
			</div>
		</c:forEach>

		</div>
		<div
			style="text-align: left; width: 35%; float: left; height: 300px; margin-top: 50px; margin-right: 350px">
			${stay.host_name}
			<p />
			${stay.host_avg} ${stay.rev_count}
			<p />
			${stay.host_addr}
			<p />
			${stay.host_info}
			<p />
		</div>


		<div style="float: left; width: 100%;">
			<div class="tab" style="margin-bottom: 50px;">
				<button class="">
					<span>객실안내/예약</span>
				</button>
				<button class="">
					<span>숙소 정보</span>
				</button>
				<button class="">
					<span>리뷰</span>
				</button>
			</div>
		</div>
		<div>
			<c:forEach items="${roomPhoto }" var="room">
				<div style="text-align: left; width: 70%; float: left; height: 200px; margin-top: 50px;">
			<div style="border: 1px solid black; margin-bottom: 20px;">
					<c:forEach items="${room.roomPhotos }" var="photo">
						<img alt="객실사진" src="images/bh/${photo.room_photo}" width="200px;"
						height="200px;">
					</c:forEach>
				<div style="float: right; width: 30%; height: 200px;">
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
				</div>
				</div>
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