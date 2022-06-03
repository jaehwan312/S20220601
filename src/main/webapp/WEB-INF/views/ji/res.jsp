<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script  src="https://code.jquery.com/jquery-latest.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/modal.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
		<div id="content">
			<div class="right" d>
				<section class="info">
					<p class="name">
						<strong>숙소이름</strong>양평 쁘띠펜션
					</p>
					<p>
						<strong>객실타입/기간</strong>화이트 / 1박
					</p>
					<p>
						<strong>체크인</strong>06.02 목 15:00
					</p>
					<p>
						<strong>체크아웃</strong>06.03 금 11:00
					</p>
				</section>
				<section class="total_price_pc">
					<p>
						<strong><b>총 결제 금액</b>(VAT포함)</strong><span class="in_price">70,000원</span>
					</p>
					<ul>
						<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
						<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면
							됩니다
						</li>
					</ul>
				</section>
				<!---->
				<button type="button" class="btn_pay gra_left_right_red">결제하기</button>
			</div>
		</div>
		<div class="left">
			<!---->
			<div>
				<section class="info_chkin">
					<h3 style="margin-top: 0;">예약자 정보</h3>
					<strong>예약자 이름</strong>
					<p class="inp_wrap remove">
						<input type="text" name="userName" placeholder="체크인시 필요한 정보입니다."
							maxlength="20" value="권재인">
					</p>
					<p data-show="name" class="alert_txt" style="visibility: hidden">한글,
						영문, 숫자만 입력 가능. (문자 사이 공백은 1칸만 입력 가능)</p>
					<div>
						<strong class="mt_09">휴대폰 번호</strong> <span class="safety_txt">개인
							정보 보호를 위해 안심번호로 숙소에 전송됩니다.</span>
						<div class="phone_confirm">
							<div class="input-box">
								<input type="tel" name="userPhone" placeholder="체크인시 필요한 정보입니다."
									maxlength="13" value="" class="input">
								<div class="cancel-icn-touch">
									<svg height="20" width="20" xmlns="http://www.w3.org/2000/svg"
										class="cancel-icn">
										<path
											d="M10 17.5a7.5 7.5 0 110-15 7.5 7.5 0 010 15zm0-8.914L7.172 5.757 5.757 7.172 8.586 10l-2.829 2.828 1.415 1.415L10 11.414l2.828 2.829 1.415-1.415L11.414 10l2.829-2.828-1.415-1.415z"></path></svg>
								</div>
							</div>
							<!---->
							<p data-show="tel" class="alert_txt error-message"
								style="visibility: hidden"></p>
							<div id="verificationCode" style="display: none; height: 48px">
								<b>인증 번호</b>
								<section>
									<div class="input-box">
										<input id="digit" type="tel" name="userPhone" minlength="4"
											maxlength="4" value=""
											class="input validation-required-input">
									</div>
									<button type="button" class="btn_ok btn_confirm phone-auth-btn">확인</button>
								</section>
							</div>
						</div>
					</div>
					<!---->
				</section>
				<!---->
				<!---->
			</div>
			<section class="price_wrap total_price">
				<p>
					<strong><b>총 결제 금액</b>(VAT포함)</strong><span class="in_price_app">70,000원</span>
				</p>
				<!---->
				<ul>
					<!---->
					<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
					<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면 됩니다
					</li>
				</ul>
			</section>
			<section class="pay_select">
				<h3>결제수단 선택</h3>
				<select id="payment-select" class="select_type_1"><option
						data-minprice="0" selected="selected" value="KAKAO">카카오페이</option>
					<option data-minprice="0" value="CARD">신용/체크카드</option>
					<option data-minprice="0" value="AT_QUICK">간편계좌이체</option>
				</select>

			</section>
			<section class="agree">
				<p class="all_check">
					<label><input type="checkbox" name="checkAll"
						class="inp_chk_02"> <span>전체 동의</span></label>
				</p>
				<p>
					<input type="checkbox" name="checkOne" class="inp_chk_02">
					<span onclick="pop_agree_01();"><i>숙소이용규칙 및
							취소/환불규정 동의</i><b> (필수)</b></span>
				</p>
				<p>
					<input type="checkbox" name="checkOne" class="inp_chk_02">
					<span onclick="pop_agree_02();"><i>개인정보 수집 및 이용
							동의</i><b> (필수)</b></span>
				</p>
				<p>
					<input type="checkbox" name="checkOne" class="inp_chk_02">
					<span onclick="pop_agree_03();"><i>개인정보 제 3자 제공
							동의</i><b> (필수)</b></span>
				</p>
				<!---->
			</section>
			<button type="button" class="btn_pay gra_left_right_red"
				data-v-f785cca6="">결제하기</button>
		</div>


		    
		<div id="myModal" class="modal">
			       
			<!-- Modal content -->
			      
			<div class="modal-content">
				                
				<p style="text-align:  center;">
					<span style="font-size:  14pt;"><b> <span
							style="font-size:  24pt;">공지</span></b></span>
				</p>
				                
				<p style="text-align:  center;  line-height:  1.5;">
					<br />
				</p>
				                
				<p style="text-align:  center;  line-height:  1.5;">
					<span style="font-size:  14pt;">사이트 서버 점검으로</span>
				</p>
				                
				<p style="text-align:  center;  line-height:  1.5;">
					<b><span style="color:  rgb(255,  0,  0);  font-size: 14pt;">10:00 - 18:00 까지</span></b>
				</p>
				                
				<p style="text-align:  center;  line-height:  1.5;">
					<span style="font-size: 14pt;">사이트 사용이 중지 됩니다.</span>
				</p>
				                
				<p style="text-align:  center;  line-height:  1.5;">
					<span style="font-size: 14pt;"><br /></span>
				</p>
				                
				<p style="text-align:  center;  line-height:  1.5;">
					<span style="font-size: 14pt;">이용에 불편을 드린 점 양해를 </span>
				</p>
				                
				<p style="text-align:  center;  line-height:  1.5;">
					<span style="font-size:  14pt;">부탁드립니다.</span>
				</p>
				                
				<p style="text-align:  center;  line-height:  1.5;">
					<br />
				</p>
				                
				<p>
					<br />
				</p>
				            
				<div
					style="cursor: pointer; background-color: #DDDDDD; text-align:  center; padding-bottom:  10px; padding-top:  10px;"
					onClick="close_pop();">
					                <span class="pop_bt" style="font-size: 13pt;"> 닫기</span>            
				</div>
				      
			</div>
			     
		</div>
		    
		<script type="text/javascript">
			              jQuery(document).ready(function() {
				$('#myModal').show();
			}); //팝업 Close 기능        
			function close_pop(flag) {
				$('#myModal').hide();
			};              
		</script>




		<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>
