<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    <h3>예약 상세</h3>

		<div class="reserve_detail">
			<!---->
			<div class="info">
				<div>
				<c:if test="${res.res_status eq '1' }">
					<i class=""> 예약확정 </i> 
				</c:if>
				<c:if test="${res.res_status eq '2' }">
					<i class=""> 이용완료 </i> 
				</c:if>
				<c:if test="${res.res_status eq '3' }">
					<i class=""> 예약취소 </i> 
				</c:if>
					<P><strong>${res.host_name}</strong> <p>
					<span>${res.room_name} • ${res.nday}박</span>
				</div>
			</div>
			<section>
				<div>
					<p>
						<strong>체크인	</strong>${res.sday} ${res.checkin}
					</p>
					<p>
						<strong>체크아웃	</strong>${res.eday} ${res.checkout}
					</p>
				</div>
				<div>
					<p>
						<strong>예약번호	</strong>${res.res_num}
					</p>
					<p>
						<strong>예약자 이름	</strong>${res.name}
					</p>
					<p>
						<span >휴대폰
							번호 ${res.phone }은(는)<br>안심번호로 숙소에 전송되며, 퇴실 후 7일간 보관됩니다.
						</span>
					</p>
				</div>
				<br>
				<div class="total" style="border-bottom: none;">
					<p>결제정보</p>
					<p>
						<strong>총 결제금액 </strong> <b> ${res.price}원</b>
					</p>
				</div>
			</section>
			<a href="tel:18339306" class="btn_call">전화문의하기</a>
			<section>
				<!---->
				<p>
					<button type="button">삭제</button>
				</p>
			</section>
		</div>
		<!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>