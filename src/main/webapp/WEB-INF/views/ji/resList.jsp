
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
					<form action="resList" id="reset"></form>
					<section class="list_present">
						<h4>예약 확정</h4>
						<div class="row row-cols-1 row-cols-md-3 g-4">
							<c:forEach var="listRes" items="${listRes}" varStatus="j">
								<div class="col">

									<div class="valueCheck">
										<input type="hidden" name="res_num"
											value="${listRes.res_num }" id="res_num${j.index }">
										<input type="hidden" name="res_end" value="${listRes.res_end}"
											id="res_end${j.index }"> <input type="hidden"
											name="checkout" value="${listRes.checkout}"
											id="checkout${j.index }">
									</div>


									<div class="card h-100">
										<img alt="숙소사진"
											src="${context }/images/bh/${listRes.host_photo}"
											style="cursor: pointer;"  class="card-img-top">
										<div class="card-body">
									
											<a href="resDetail?res_num=${listRes.res_num }"> <c:if
													test="${listRes.res_status=='1'}">
													
													<span class="status">예약확정</span>
											
												</c:if> <strong>${listRes.host_name}</strong> <span class="day">${listRes.sday}
													- ${listRes.eday} • ${listRes.nday}박</span>
											</a>
											
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!---->
						<p>
					</section>
					<section class="list_past">
						<h4>이용 내역</h4>

						<div class="row row-cols-1 row-cols-md-3 g-4">
							<c:forEach var="listBeforeRes" items="${listBeforeRes}">
								<div class="col">
									<div class="card h-100">

										<img alt="숙소사진"
											src="${context }/images/bh/${listBeforeRes.host_photo}"
											style="cursor: pointer;"  class="card-img-top">
										<div class="card-body">
										
											<a href="resDetail?res_num=${listBeforeRes.res_num }"> <c:if
													test="${listBeforeRes.res_status=='2'}">
													<span class="status">이용 완료</span>
											
												</c:if> <strong>${listBeforeRes.host_name}</strong> <span
												class="day">${listBeforeRes.sday} -
													${listBeforeRes.eday} • ${listBeforeRes.nday}박</span>
											</a>
											
												<a href="stayRead?host_num=${listBeforeRes.host_num }">다시
													예약 </a>
											
										
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!---->
						<p>
					</section>

					<section class="list_cancle">
						<h4>취소 내역</h4>
						<div class="row row-cols-1 row-cols-md-3 g-4">
							<c:forEach var="listCancleRes" items="${listCancleRes}">
								<div class="col">
									<div class="card h-100">
										<img alt="숙소사진"
											src="${context }/images/bh/${listCancleRes.host_photo}"
											style="cursor: pointer;"  class="card-img-top">
										<div class="card-body">
									
											<a href="resDetail?res_num=${listCancleRes.res_num }"> <c:if
													test="${listCancleRes.res_status=='3'}">
													<span class="status">예약 취소</span>
												</c:if> <strong>${listCancleRes.host_name}</strong> <span
												class="day">${listCancleRes.sday} -
													${listCancleRes.eday} • ${listCancleRes.nday}박</span>
											</a>
											
												<a href="stayRead?host_num=${listCancleRes.host_num }">다시
													예약 </a>
											
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
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

	<script>
		$(document).ready(
				function() {
					const values = document
							.getElementsByClassName('valueCheck');
					
					var change = 0;
					for (var i = 0; i < values.length; i++) {
						var res_number = $('#res_num' + i).val();
						var res_end = $('#res_end' + i).val();
						var checkout = $('#checkout' + i).val();
						var res_end2 = res_end.substr(0, 8);
						var res_end3 = res_end2.replace(
								/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3');
						var result = res_end3 + ' ' + checkout;

						var date1 = new Date(result); //체크아웃
						var date2 = new Date(); //현재시간

						if (date1.getTime() < date2.getTime()) {
							$.ajax({
								url : 'statusChange',
								data : {
									res_num : res_number
								},
								type : 'get',
								dataType : 'json',
								success : function(data) {
									change++;
								}
							});

						}
					}
					;
					if (change > 0) {
						alert(change + "건 변경 완료");
						location.reload(true);
					}

				});
	</script>
</body>
</html>