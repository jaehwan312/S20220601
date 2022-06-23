
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/ji/resList.css">
<link rel="stylesheet" href="css/js/sideBar.css">
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
							<li><a href="resList">예약내역</a></li>
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
			<!-- 밑에는 내꺼 -->
			<div id="content-wrapper">
 			<div class="reserve_list">

				<section class="list_present">
					<h4>예약 확정</h4>
					<ul class="list_wrap">
						<c:forEach var="listRes" items="${listRes}">
							<li>
								<div class="row">
									<div class="col-6">
										<div class="wrapper">
											<p>
												<img alt="숙소사진"
													src="${context }/images/bh/${listRes.host_photo}"
													style="cursor: pointer;" width="350" height="160">
											</p>
											<a href="resDetail?res_num=${listRes.res_num }"> <c:if
													test="${listRes.res_status=='1'}">
													<span class="status">예약확정</span>
													<span>예약번호 : ${listRes.res_num }</span>
												</c:if> <strong>${listRes.host_name}</strong> <span class="day">${listRes.sday}
													- ${listRes.eday} • ${listRes.nday}박</span>
											</a>
											<P>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<!---->
					<p>
				</section>
				<section class="list_past">
					<h4>이용 내역</h4>
					<ul class="list_wrap">
						<c:forEach var="listBeforeRes" items="${listBeforeRes}">
							<li>
								<div class="row">
									<div class="col-6">
										<div class="wrapper">
											<p>
												<img alt="숙소사진"
													src="${context }/images/bh/${listBeforeRes.host_photo}"
													style="cursor: pointer;" width="350" height="160">
											</p>
											<a href="resDetail?res_num=${listBeforeRes.res_num }"> <c:if
													test="${listBeforeRes.res_status=='2'}">
													<span class="status">이용 완료</span>
													<span class="status">예약번호 : ${listBeforeRes.res_num }</span>
												</c:if> <strong>${listBeforeRes.host_name}</strong> <span
												class="day">${listBeforeRes.sday} -
													${listBeforeRes.eday} • ${listBeforeRes.nday}박</span>
											</a>
											<p>
												<a href="stayRead?host_num=${listBeforeRes.host_num }">다시
													예약 </a>
											</p>

										</div>
									</div>
								</div>
							</li>


						</c:forEach>


					</ul>
					<!---->
					<p>
				</section>

				<section class="list_cancle">
					<h4>취소 내역</h4>
					<ul class="list_wrap">
						<c:forEach var="listCancleRes" items="${listCancleRes}">
							<li>
								<div class="row">
									<div class="col-6">
										<div class="wrapper">
											<p>
												<img alt="숙소사진"
													src="${context }/images/bh/${listCancleRes.host_photo}"
													style="cursor: pointer;" width="350" height="160">
											</p>
											<a href="resDetail?res_num=${listCancleRes.res_num }"> <c:if
													test="${listCancleRes.res_status=='3'}">
													<span class="status">예약 취소</span>
													<span>예약번호 : ${listCancleRes.res_num }</span>
												</c:if> <strong>${listCancleRes.host_name}</strong> <span
												class="day">${listCancleRes.sday} -
													${listCancleRes.eday} • ${listCancleRes.nday}박</span>
											</a>
											<p>
												<a href="stayRead?host_num=${listCancleRes.host_num }">다시
													예약 </a>
											</p>

										</div>
									</div>
								</div>
							</li>


						</c:forEach>


					</ul>
					<!---->
					<p>
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