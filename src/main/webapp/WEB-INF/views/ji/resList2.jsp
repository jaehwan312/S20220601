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
			<section class="list_present">
				<h3>예약 내역</h3>
				<ul class="list_wrap"></ul>
				<!---->
			</section>
			<section class="list_past">
				<h3>이용 내역</h3>
				<ul class="list_wrap">
					<li class="reservation-detail">
						<div>
							<button type="button" data-target-list="usedList" class="btn_del">
								삭제</button>
							<p class="pic">
								<img loading="lazy"
									srcset="https://image.goodchoice.kr/resize_354x184/affiliate/2022/06/02/15/x2dpyBVO7KWT.jpg, https://image.goodchoice.kr/resize_531x276/affiliate/2022/06/02/15/x2dpyBVO7KWT.jpg 1.5x , https://image.goodchoice.kr/resize_708x368/affiliate/2022/06/02/15/x2dpyBVO7KWT.jpg 2x"
									src="https://image.goodchoice.kr/resize_354x184/affiliate/2022/06/02/15/x2dpyBVO7KWT.jpg"
									alt="가평 보타니칼 펜션" class="align">
							</p>
							<a href="/reservation-detail/82790493" class="product-title"><i
								class="bg_w">이용완료</i> <strong>가평 보타니칼 펜션</strong> <span>
									01.14 금 - 01.15 토 • 1박 </span> <b>예약 상세 &gt;</b></a>
							<p class="btn_re">
								<a
									href="https://www.goodchoice.kr/product/detail?ano=67113&amp;adcno=3&amp;sel_date=2022-06-02&amp;sel_date2=2022-06-02">
									다시 예약 </a>
							</p>
						</div>
					</li>
					<li class="reservation-detail"><div>
							<button type="button" data-dono="55843612"
								data-target-list="usedList" class="btn_del">삭제</button>
							<p class="pic">
								<img loading="lazy"
									srcset="https://image.goodchoice.kr/resize_354x184/affiliate/2020/02/04/5e3938842e59e.jpg, https://image.goodchoice.kr/resize_531x276/affiliate/2020/02/04/5e3938842e59e.jpg 1.5x , https://image.goodchoice.kr/resize_708x368/affiliate/2020/02/04/5e3938842e59e.jpg 2x"
									src="https://image.goodchoice.kr/resize_354x184/affiliate/2020/02/04/5e3938842e59e.jpg"
									alt="코트야드 메리어트 서울 보타닉 파크" class="align">
							</p>
							<a href="/reservation-detail/55843612" class="product-title"><i
								class="bg_w">이용완료</i> <strong>코트야드 메리어트 서울 보타닉 파크</strong> <span>
									12.12 토 - 12.13 일 • 1박 </span> <b>예약 상세 &gt;</b></a>
							<p class="btn_re">
								<a
									href="https://www.goodchoice.kr/product/detail?ano=52487&amp;adcno=2&amp;sel_date=2022-06-02&amp;sel_date2=2022-06-02">
									다시 예약 </a>
							</p>
						</div></li>
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
											<a href="reReserve">다시 예약 </a>
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
							<div class="wrapper">
								<p>
									<img alt="숙소사진"
										src="${context }/images/bh/${listCancleRes.host_photo}"
										style="cursor: pointer;" width="350" height="160">
								</p>
								<a href="resDetail"> <c:if
										test="${listCancleRes.res_status=='3'}">
										<span class="status">예약 취소</span>
										<span class="status">예약번호 : ${listCancleRes.res_num }</span>

									</c:if> <strong>${listCancleRes.host_name}</strong> <span>${listCancleRes.sday}
										- ${listCancleRes.eday} • ${listCancleRes.nday}박</span>
								</a>
								<p>
									<a href="reReserve">다시 예약 </a>
								</p>

							</div>

						</li>


					</c:forEach>
				</ul>
				<!---->
				<P>
			</section>


		</div>


<script type="text/javascript">
		$(document).ready(function() {
			$("#cbx_chkAll").click(function() {
				if ($("#cbx_chkAll").is(":checked"))
					$("input[name=chk]").prop("checked", true);
				else
					$("input[name=chk]").prop("checked", false);
			});

			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;

				if (total != checked)
					$("#cbx_chkAll").prop("checked", false);
				else
					$("#cbx_chkAll").prop("checked", true);
			});
		});
	</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" id="cbx_chkAll" /></th>
				<th>체크박스 테스트</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" name="chk"></td>
				<td>체크 1</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="chk"></td>
				<td>체크 2</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="chk"></td>
				<td>체크 3</td>
			</tr>
		</tbody>
	</table>
</body>





		<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>