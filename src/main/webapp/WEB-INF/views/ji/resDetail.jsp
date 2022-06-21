<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/js/sideBar.css">
<link rel="stylesheet" href="css/ji/resDetail.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
				<div id="page-wrapper">
			<!-- 사이드바 -->
			<div id="sidebar-wrapper">
				<c:choose>
					
					<c:when test="${grade=='1' }">
						<ul class="sidebar-nav">
							<li class="sidebar-brand"><a href="myPage">마이페이지</a>
								<hr style="width: 60%;"></li>
							<li><a href="myPage">나의 프로필</a></li>
							<li><a href="#">예약내역</a></li>
							<li><a href="#">나의 픽(찜목록)</a></li>
							<li><a href="#">나의 식당정보</a></li>
							<li><a href="#">나의 숙소정보</a></li>
							<li><a href="#">관리자 페이지</a></li>
						</ul>
					</c:when>
					<c:when test="${grade=='2' }">
						<ul class="sidebar-nav">
							<li class="sidebar-brand"><a href="myPage">마이페이지</a>
								<hr style="width: 60%;"></li>
							<li><a href="myPage">나의 프로필</a></li>
							<li><a href="#">예약내역</a></li>
							<li><a href="#">나의 픽(찜목록)</a></li>
							<li><a href="#">나의 식당정보</a></li>
							<li><a href="#">나의 숙소정보</a></li>
						</ul>
					</c:when>
				</c:choose>
			</div>
			<!-- /사이드바 -->
			<!-- 본문 -->
			<div id="content-wrapper">
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
						<P>
							<strong>${res.host_name}</strong>
						<p>
							<span>${res.room_name} • ${res.nday}박</span>
					</div>
				</div>
				<section>
					<div>
						<p>
							<strong>체크인 </strong>${res.sday} ${res.checkin}
						</p>
						<p>
							<strong>체크아웃 </strong>${res.eday} ${res.checkout}
						</p>
					</div>
					<div>
						<p>
							<strong>예약번호 </strong>${res.res_num}
						</p>
						<p>
							<strong>예약자 이름 </strong>${res.name}
						</p>
						<p>
							<span>휴대폰 번호 ${res.phone }은(는)<br>안심번호로 숙소에 전송되며, 퇴실
								후 7일간 보관됩니다.
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

						<c:if test="${res.res_status eq '1' }">
							<button type="button" onclick="location.href=">예약취소하기</button>
						</c:if>
						<c:if test="${res.res_status eq '2' }">
							<button type="button" onclick="location.href=">리뷰작성하기</button>
							<button type="button" onclick="location.href=">삭제</button>
						</c:if>
						<c:if test="${res.res_status eq '3' }">
							<button type="button" onclick="location.href=">삭제</button>
						</c:if>
					</section>
			</div>
			<!-- /본문 -->
		</div>
</div>
		<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>







<!-- 여기밑에만 복사 -->
