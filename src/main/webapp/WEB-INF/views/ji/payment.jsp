<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비숲 | 결제</title>
<link href="css/common.css" rel="stylesheet" type="text/css">
<link href="css/payment.css" rel="stylesheet" type="text/css">
<script src="js/jquery.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	

	 $(function() {
		 
		 	// 우편번호 검색
		 	$('#search_post').click(function() {
		 		new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var addr = ''; // 주소 변수
			            var extraAddr = ''; // 참고항목 변수
			
			            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                addr = data.roadAddress;
			            } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                addr = data.jibunAddress;
			            }
			
			            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			            if(data.userSelectedType === 'R'){
			                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                    extraAddr += data.bname;
			                }
			                // 건물명이 있고, 공동주택일 경우 추가한다.
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                if(extraAddr !== ''){
			                    extraAddr = ' (' + extraAddr + ')';
			                }
			                // 조합된 참고항목을 해당 필드에 넣는다.
			                //document.getElementById("sample6_extraAddress").value = extraAddr;
			                addr += extraAddr;
			            
			            } else {
			                //document.getElementById("sample6_extraAddress").value = '';
			                addr += '';
			            }
			
			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('sample6_postcode').value = data.zonecode;
			            document.getElementById("sample6_address").value = addr;
			            // 커서를 상세주소 필드로 이동한다.
			            document.getElementById("sample6_detailAddress").focus();
			        }
			    }).open();
		 	});
		 
		 	// 쿠폰 선택
			$('#selectCoupon').click(function() {
				window.open("/couponList","","width=500px,height=500px");
			});
			
		 	// 마일리지 계산
			$('#mile_use').change(function() {
				var mile_use = $('#mile_use').val();
				var total_amount = $("#total_amount").val();
				var total_sale = 0;
				var coup_sale = $("#coup_sale").val();
				var total_real_amount = 0;
				
				coup_sale = Number(coup_sale);
				mile_use = Number(mile_use);
				
				total_sale = coup_sale + mile_use;
				
				
				var subs = $("#subs").val();
				
				if(subs == 0) {
					total_real_amount = total_amount - total_sale + 3000;
				} else {
					total_real_amount = total_amount - total_sale;
				}
				
				var mile_use_view = mile_use.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				var coup_sale_view = coup_sale.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				var total_sale_view = total_sale.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				var total_real_amount_view = total_real_amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
				
				$("#total_sale").val(total_sale);
				$(".total_sale_li").html(total_sale_view+"원");
				
				$("#total_real_amount_li").html(total_real_amount_view+"원");
				$("#real_amount").val(total_real_amount);
				$("#goPay").html(total_real_amount_view+"원 결제하기");
			});
		 	
		 	// phantom 선택
			$('#phantom').click(function() {
				console.log("phantom event Start...")
			});

	 });	
	
</script>



</head>
<!-- -----------------------------------------body------------------------------------------------------------- -->
<body>
	<div id="wrap">
	
		<jsp:include page="/WEB-INF/views/header.jsp"/>
		
		<!-- ----------------------------------------------------------------------main시작----------------------------------- -->
		<div class="margin_wrap">
			<div id="main">
				<h2>결제하기</h2>
				<form action="/kakaoPay" name="frm" id="frm" method="post" onsubmit="return false">
					
					<!-- 왼쪽 -->
					<div id="left_side">
						<!-- 주문 상품 -->
						<div id="p_list_box">
							<h3>주문 상품</h3>
							<table class="table" id="p_list">
							    <thead>
							      <tr>
							      	<th></th>
							        <th>상품명</th>
							        <th>수량</th>
							        <th>가격</th>
							      </tr>
							    </thead>
							    
							    <tbody>
							    	<c:if test="${from == 0 }">
							    		<input type="hidden" name="prodno" value="${product.prodno }">
										<input type="hidden" name="quantity" value ="${quantity }">
										<tr>
										    <td class="p_img"><img src="images/sample.png"></td>
										    <td>[${product.brand_name }]${product.prod_name }</td>
										    <td>${quantity }개</td>
										    <td><fmt:formatNumber value="${product.sale_price * quantity}" groupingUsed="true"></fmt:formatNumber>원</td>
									    </tr>				    	
							    	</c:if>
							    	
							    	<c:if test="${from == 1 }">
							    		<c:forEach var="product" items="${p_list }">
							    			<input type="hidden" name="prodno" value="${product.prodno }">
							    			<input type="hidden" name="quantity" value="${product.bas_qty }">
							    			<tr>
											    <td class="p_img"><img src="images/sample.png"></td>
											    <td>[${product.brand_name }]${product.prod_name }</td>
											    <td>${product.bas_qty }개</td>
											    <td><fmt:formatNumber value="${product.sale_price * product.bas_qty}" groupingUsed="true"></fmt:formatNumber>원</td>
										    </tr>
							    		</c:forEach>
							    	</c:if>
						    		
							    </tbody>
							</table>
						</div>
						
						
						<!-- 주문자 정보 -->
						<div id="order_info">
							<h3>주문자 정보</h3>
							<input type="text" class="form-control mt-3" name="name" placeholder="이름" value="${member.name }">
							<input type="number" class="form-control mt-3" name="tel" placeholder="전화번호(-없이 입력)" value="${member.tel }">
							<input type="email" class="form-control mt-3" name="email" placeholder="이메일" value="${member.email }">
						</div>
						
						
						<!-- 배송정보 -->
						<div id="delivery_info">
							<h3>배송 정보</h3>
							<input type="text" class="form-control mt-3" name="rec_name" placeholder="수령인" value="${member.name }">
							<input type="text" class="form-control mt-3" name="rec_phone" placeholder="전화번호(-없이 입력)" value="${member.tel }">
							<input type="text" id="sample6_postcode" class="form-control mt-3" name="del_post_code" placeholder="우편번호" value="${member.post_code }" style="width:80%;float:left">
							<button class="btn btn-dark" id="phantom" style="display:none">phantom Buttom</button>
							<button class="btn btn-dark" id="search_post" style="width:20%;margin-top:1rem;">우편번호 찾기</button>
							<input type="text" id="sample6_address" class="form-control mt-3" name="del_address" placeholder="주소" value="${member.address }">
							<input type="text" id="sample6_detailAddress" class="form-control mt-3" name="del_daddress" placeholder="상세주소" value="${member.det_address }">
						</div>
						<input type="checkbox" name="default_addCheck" class="form-check-input" id="flexCheckChecked">
						<label class="form-check-label" for="flexCheckChecked" id="checkLabel">
							기본 배송지로 설정
						</label>
						
						
						<!-- 쿠폰 / 마일리지 할인 -->
						<div id="discount">
							<h3>쿠폰 / 마일리지 할인</h3>
							
							<ul class="cp_arrange clearfix">
								<li class="left">쿠폰 할인</li>	
								<li class="right">
									<span class="blue" id="coup_sale_span"></span>
									<button type="button" class="btn btn-dark" id="selectCoupon" >쿠폰 선택</button>
								</li>
							</ul>
							
							<hr>
							
							<ul class="cp_arrange clearfix">
								<li class="left">보유 마일리지</li>	
								<li class="right"><fmt:formatNumber value="${member.mileage }" groupingUsed="true"></fmt:formatNumber>원</li>
								
							</ul>
							<br>
							<ul class="cp_arrange clearfix">
								<li class="left">마일리지 사용</li>	
								<li class="right"><input type="number" name="mile_use" id="mile_use">원</li>
							</ul>
  							
							
							
							<hr>
							
							<ul class="cp_arrange clearfix">
								<li class="left">할인 합계</li>
								
								<li class="right blue total_sale_li">
									0원
								</li>
							</ul>
							
						</div>
						
					</div>
					
					
					
					<!-- 오른쪽 -->
					<div id="right_side">
						<!-- 결제 금액 -->
						<div id="pay">
							<h3>결제 금액</h3>
							
							<ul class="cp_arrange clearfix">
								<li class="left">주문 금액</li>	
								<li class="right">
									<p><fmt:formatNumber value="${total_amount }" groupingUsed="true"></fmt:formatNumber>원</p>
									<span class="blue" id="mile_save"><fmt:formatNumber value="${mile_save }" groupingUsed="true"></fmt:formatNumber>원</span>
								</li>
							</ul>
							
							<br>
							
							<ul class="cp_arrange clearfix">
								<li class="left">배송비</li>	
								<li class="right">
									<c:if test="${member.subs == 0}">
										3,000원
									</c:if>
									
									<c:if test="${member.subs == 1}">
										무료
									</c:if>
									
								</li>
							</ul>
							
							<br>
							<br>
							
							<ul class="cp_arrange clearfix">
								<li class="left">할인 합계</li>	
								<li class="right blue total_sale_li">
									0원
								</li>
							</ul>
							
							<hr>
							
							<ul class="cp_arrange clearfix" id="total">
								<li class="left bold">총 결제 금액</li>	
								<li class="right bold" id="total_real_amount_li">
									<fmt:formatNumber value="${total_amount }" groupingUsed="true"></fmt:formatNumber>원
								</li>
							</ul>
							
							<hr>
							
							<p id="agreement">위 주문 내역을 확인하였으며, 결제에 동의합니다.</p>
							
							
							<input type="hidden" name="subs" id="subs" value="${member.subs }">
							<input type="hidden" name="org_amount" id="total_amount" value="${total_amount }">
							<input type="hidden" name="mile_save" id="mile_save" value="${mile_save }">
							<input type="hidden" name="from" id="from" value="${from }">
							<input type="hidden" name="coupno" id="coupno">
							<input type="hidden" name="coup_sale" id="coup_sale">
							<input type="hidden" name="total_sale" id="total_sale">	
							<input type="hidden" name="real_amount" id="real_amount">
							
							
							<button class="btn btn-dark" id="goPay"><fmt:formatNumber value="${total_amount }" groupingUsed="true"></fmt:formatNumber>원 결제하기</button>
							
						</div>
					</div>
				
				</form>
				<script type="text/javascript">
					$(function() {
						$("#goPay").click(function() {
							var result = true;
							const total_amount = ${total_amount}
							
							if(!frm.mile_use.value) {
								$("#mile_use").val(0);
							}
							if(!frm.real_amount.value) {
								$("#real_amount").val(total_amount);
							}
							if(!frm.coupno.value) {
								$("#coupno").val(0);
							}
							
							if(!frm.name.value) {
								alert("이름을 입력해주세요");
								frm.name.focus();
								result = false;
							}
							else if(!frm.tel.value) {
								alert("전화번호를 입력해주세요");
								frm.tel.focus();
								result = false;
							}
							else if(!frm.email.value) {
								alert("이메일을 입력해주세요");
								frm.email.focus();
								result = false;
							}
							else if(!frm.rec_name.value) {
								alert("수령인 이름을 입력해주세요");
								frm.rec_name.focus();
								result = false;
							}
							else if(!frm.rec_phone.value) {
								alert("수령인 전화번호를 입력해주세요");
								frm.rec_phone.focus();
								result = false;
							}
							else if(!frm.del_post_code.value) {
								alert("우편 번호를 입력해주세요");
								frm.name.focus();
								result = false;
							}
							else if(!frm.del_address.value) {
								alert("주소를 입력해주세요");
								frm.name.focus();
								result = false;
							}
							else if(!frm.del_daddress.value) {
								alert("상세 주소를 입력해주세요");
								frm.name.focus();
								result = false;
							}
							
							if(result == true) {
								document.getElementById('frm').submit();
							}
							
							
						});
					});
				</script>
				
				
				
				
				
				
				<div class="clearfix"></div>
			</div> <!-- main 끝 -->
		</div>
		<!-- ----------------------------------------------------------------------main끝----------------------------------- -->
		
		<jsp:include page="/WEB-INF/views/footer.jsp"/>
		
	</div> <!-- wrap -->
</body>
</html>