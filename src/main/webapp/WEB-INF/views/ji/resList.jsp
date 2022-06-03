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
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
		<div class="reserve_list">
		<h1>${total }</h1>
			<section class="list_present">
				<h3>예약 내역</h3>
				<ul class="list_wrap">
					
						<div>
							<c:forEach var="listRes" items="${listRes}" >
							<li>
							<p>${listRes.name}</p>
							<p>${listRes.host_name} / ${listRes.room_name}</p>
							<p>${listRes.res_start} - ${listRes.res_end}</p>
							<p>${listRes.res_status}</p>
							<img  alt ="숙소사진"  src="${context }/images/bh/${listRes.host_photo}" style="cursor: pointer;" width="354" height="200">
							
							</li>
							
							
							</c:forEach>
						</div>
					
				</ul>
				<!---->
			</section>
			<section class="list_past">
				<h3>이용 내역</h3>
				<ul class="list_wrap">
					<li class="reservation-detail"></li>
					<li class="reservation-detail"></li>
				</ul>
				<!---->
				<section class="list_cancle">
					<h3>취소 내역</h3>
					<ul class="list_wrap">
					</ul>
					<!---->
				</section>
			</section>


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