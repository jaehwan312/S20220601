<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/ji/resContent.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<title>제주 감수광</title>

</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
		<br> <br>
		
		<div class="row">
			<div class="col-6">

				<div>
					<h3>예약자 정보</h3>
					<p>예약자 이름</p>
					<input type="text" id="res_name" name="name" placeholder="체크인시 필요한 정보입니다."
						maxlength="30" value="${prof.name }" required
						oninput="checkName()"> <span class="name_ok"
						style="display: none">예약자 이름을 확인해주세요.</span>

					<p>휴대폰 번호</p>
					<input type="tel" name="phone" placeholder="체크인시 필요한 정보입니다." value="${prof.phone }" 
					id="phone"oninput="checkPhone()" pattern="[0-9]{11}" maxlength="11"> 
						<span class="phone_ok" style="display: none">휴대폰 번호를 확인해주세요.</span>
	
				</div>
				<br> <br>
				<div>
					<h3>결제수단 선택</h3>
					<select id="payment-select" class="select_type_1">
						<option data-minprice="0" selected="selected" value="kakaopay"
							data-v-f785cca6="">카카오페이</option>
						<option data-minprice="0" value="CARD">신용/체크카드</option>
						<option data-minprice="0" value="AT_QUICK">간편계좌이체</option>
						<option data-minprice="0" value="NAVER">네이버페이</option>
						<option data-minprice="0" value="CELLPHONE">휴대폰결제</option>
					</select>
					<!---->
					<!---->
				</div>
				<br> <br>
				<div class="cbx_agree">

					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="cbx_chkAll"> 
						<label class="form-check-label" for="flexCheckDefault" id=chkAll>전체 동의 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" name="chk"> 
						<label class="form-check-label" for="flexCheckDefault"> 숙소이용규칙 및 취소/환불규정 동의 (필수) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" name="chk"> 
						<label class="form-check-label" for="flexCheckChecked">개인정보 수집 및 이용 동의 (필수) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" name="chk"> 
						<label class="form-check-label" for="flexCheckChecked"> 개인정보 제 3자 제공 동의 (필수) </label>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="room-info">

					<div>

						<section class="info">
							<p class="name">
								<strong>숙소이름</strong>${room1.host_name }(host_num : ${room1.host_num }/room_num : ${room1.room_num })
							</p>
							<p>
								<strong>객실타입/기간</strong>${room1.room_name } / ${nday }박
							</p>
							<p>
								<strong>체크인</strong>${checkin } ${room1.checkin }
							</p>
							<p>
								<strong>체크아웃</strong>${checkout } ${room1.checkout }
							</p>
						</section>
						<section class="total_price">
							<p>
								<strong><b>진짜 총 결제 금액</b>(VAT포함)</strong><span class="in_price">${total_fee }</span>
							</p>

							<p>
								해당 객실가는 세금, 봉사료가 포함된 금액입니다<br> 결제완료 후 <span>예약자 이름</span>으로
								바로 <span>체크인</span>하시면됩니다
							</p>

						</section>
						<button type="button" class="btn btn-primary m-5"
							data-bs-toggle="modal" onclick="resCheck()" data-target="#staticBackdrop">결제하기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">예약내역 확인</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p></p>
						<p>${room1.host_name }</p>
						<p>${room1.room_name }/${nday }박</p>
						<p>
							<span>체크인</span>${checkin } ${room1.checkin }
						</p>
						<p>
							<span>체크아웃</span>${checkout } ${room1.checkout }
						</p>
						<p>
							<span>----------------------------------------</span>
						</p>
						<p>
							미성년자는 보호자 동반 시 투숙이 가능합니다.<br> <span>취소 및 환불 규정</span>에 따라
							취소수수료 부과 및 <br>취소불가 될 수 있습니다.
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<form method="post" action="/kakaoPay">
						<input type="hidden" name="mem_num"	value=5>
							<input type="hidden" name="room_name"	value="${room1.room_name }">
							<input type="hidden" name="host_num"	value="${room1.host_num }">
							<input type="hidden" name="room_num" 	value="${room1.room_num }">
							<input type="hidden" name="res_start" 	value="${res.res_start }">
							<input type="hidden" name="res_end" 	value="${res.res_end}"> 
							<input type="hidden" name="total_fee" 	value="${total_fee }">
							<input type="hidden" name="name" 	value="${prof.name }">
							<input type="hidden" name="id" 	value="${prof.id }">
							<input type="hidden" name="phone" 	value="${prof.phone }">
							<input type="hidden" name="email" 	value="${prof.email }">
							<input type="hidden" name="pay" 	value="1">
							
							<button type="submit" class="btn btn-primary">동의 후 결제</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="js/ji/kakao.js"></script>
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
		function checkName() {
			var name = $("input[name=name]").val(); //id값이 "id"인 입력란의 값을 저장
			var storyLength = $("input[name=name]").val().length;
	
			if (name == "")
				$('.name_ok').css("display", "inline-block");
			else {
				$('.name_ok').css("display", "none");
			}
	
		};
		function checkPhone() {
			var phone = $("input[name=phone]").val(); //id값이 "id"인 입력란의 값을 저장
			var total = $("input[name=chk]").length;
	
			if (phone == "")
				$('.phone_ok').css("display", "inline-block");
			else {
				$('.phone_ok').css("display", "none");
			}
	
		};
	
		function resCheck() {
	
			if ($("input[name=name]").val() == "") {
				alert("예약자  이름을 입력해주세요.");
				$('#staticBackdrop').modal('hide')
			} else if ($('#phone').val() == "") {
				alert("휴대폰번호를 입력해주세요.");
				$('#staticBackdrop').modal('hide')
			} else if (!$("#cbx_chkAll").is(":checked")) {
				alert("필수 이용 동의 항목에 동의(체크)해주세요.");
				document.getElementById("cbx_chkAll").focus();
				$('#staticBackdrop').modal('hide')
			} else {
				$('#staticBackdrop').modal('show')
			}
	
		};
	</script>
</body>
</html>