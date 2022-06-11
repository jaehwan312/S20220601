<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/ji/resContent.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>제주 감수광</title>
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
 //check2 클릭
	$("#check2").click(function iamport(){
		alert("d야아아아");
		//가맹점 식별코드
		IMP.init('imp52482779');
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '상품1' , //결제창에서 보여질 이름
		    amount : 100, //실제 결제되는 가격
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	});
</script>
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
					<input type="text" name="name" placeholder="체크인시 필요한 정보입니다."
						maxlength="30" value="${prof.name }" required
						oninput="checkName()"> <span class="name_ok"
						style="display: none">예약자 이름을 확인해주세요.</span>
					<p>휴대폰 번호</p>
					<input type="text" name="phone" placeholder="체크인시 필요한 정보입니다."
						maxlength="30" value="${prof.phone }" id="phone"
						oninput="checkPhone()"> <span class="phone_ok"
						style="display: none">휴대폰 번호를 확인해주세요.</span>

				</div>
				<br> <br>
				<div>
					<h3>결제수단 선택</h3>
					<select id="payment-select" class="select_type_1">
						<option data-minprice="0" selected="selected" value="KAKAO"
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
						<input class="form-check-input" type="checkbox" value=""
							id="cbx_chkAll"> <label class="form-check-label"
							for="flexCheckDefault" id=chkAll>전체 동의 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="flexCheckDefault" name="chk"> <label  
							class="form-check-label" for="flexCheckDefault"> 숙소이용규칙 및
							취소/환불규정 동의 (필수) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="flexCheckChecked" name="chk"> <label
							class="form-check-label" for="flexCheckChecked">개인정보 수집 및
							이용 동의 (필수) </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="flexCheckChecked" name="chk"> <label
							class="form-check-label" for="flexCheckChecked"> 개인정보 제
							3자 제공 동의 (필수) </label>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="room-info">

					<div>

						<section class="info">
							<p class="name">
								<strong>숙소이름</strong>${room1.host_name }
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
								<strong><b>총 결제 금액</b>(VAT포함)</strong><span class="in_price">84,500원</span>
							</p>

							<p>
								해당 객실가는 세금, 봉사료가 포함된 금액입니다<br> 결제완료 후 <span>예약자 이름</span>으로
								바로 <span>체크인</span>하시면됩니다
							</p>


						</section>
						<button type="button" class="btn btn-primary m-5"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop">결제하기</button>


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
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="check2">동의 후 결제</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>