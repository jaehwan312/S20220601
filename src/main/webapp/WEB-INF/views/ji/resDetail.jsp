<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/js/sideBar.css">
<link rel="stylesheet" href="css/ji/resDetail.css">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
		<div id="page-wrapper">
			<%@ include file="../sideBar.jsp"%>
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
								<label class="label"><strong>체크인 </strong></label>${res.sday} ${res.checkin}
								<input type="hidden" id="res_start" value="${res.sday}">
								<input type="hidden" id="checkin" value="${res.checkin}">
							</p>
							<p>
								<label class="label"><strong>체크아웃 </strong></label>${res.eday} ${res.checkout}
							</p>
						</div>
						<div>
							<p>
								<label class="label"><strong>예약번호 </strong></label>${res.res_num}
							</p>
							<p>
								<label class="label"><strong>예약자 이름 </strong></label>${res.name}
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
								<label class="label"><strong>총 결제금액 </strong></label> <b> ${res.price}원</b>
							</p>
						</div>
					</section>
					<a href="tel:18339306" class="btn_call">전화문의하기</a>
					<section>
						<!---->

						<c:if test="${res.res_status eq '1' }">
							<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"  onclick="dateChk()">예약취소하기</button>
						</c:if>
						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">취소내용 확인</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<p>
											<strong>총 결제금액 </strong> <b> ${res.price}원</b>
										</p>
										
										<div class="cacle-reason">
											<h3>취소사유</h3>
											<select name ="cancle" id="cancle-select" class="form-select" aria-label="Default select example">
												<c:forEach var="cancleCode" items="${cancCodeList }">
													<option value="${cancleCode.mcd}">${cancleCode.name }</option>
												</c:forEach>
											</select>
											<!---->
											<!---->
										</div>
									</div>
									<div class="modal-footer">
<!-- 										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button> -->
								<!-- 예약취소하기 버튼		 -->
									<form  id="resCancle" action="statusChange2" name="cancleForm" onsubmit="return false">
										<input type="hidden" name="canc_reason" id="canc_reason" value="">
										<input type="hidden" name="res_num" value="${res.res_num}">
										<button type="submit" class="btn btn-outline-primary" onclick="reasonChk()" >취소하기</button>
									</form>
									</div>
								</div>
							</div>
						</div>
					<!-- /Modal -->
						<c:if test="${res.res_status eq '2' }">
						<form action="reviewInsertForm" class="reviewFrm">
						<input type="hidden" name="host_num" value="${res.host_num }">
						<input type="hidden" name="room_num" value="${res.mem_num }">
							<button type="submit"  class="btn btn-outline-primary review">리뷰작성하기</button>
						</form>
							<button type="button"  class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">삭제</button>
						</c:if>
						<c:if test="${res.res_status eq '3' }">
							<button type="button"  class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">삭제</button>
						</c:if>
					<!--Delete Modal2 -->

						
						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm">
						    <div class="modal-content">
						      <div class="modal-body">
								 <span style="text-align: center">예약내역을 삭제하시겠습니까?</span>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						        <form action="resDelete">
						        	<input type="hidden" name="res_num" value="${res.res_num}">
						        	<button type="submit" class="btn btn-primary">삭제</button>
						        </form>
						      </div>
						    </div>
						  </div>
						</div>
				<!--/Delete modal2 -->
					</section>
				</div>
				<!-- /본문 -->
			</div>
		</div>
		<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script type="text/javascript">
	
	
	
	
	
	//체크인시간 지나면 예약취소 불가능
	function dateChk(){	
		const  res_start = document.getElementById("res_start").value;	//2022.02.02 수
		const  checkin = document.getElementById("checkin").value;		//14:00
		const  res_start2= res_start.substr(0,10);	//2022.02.02
		const  result = res_start2+' '+checkin	//2022.02.02 14:00
		const modalToggle = document.getElementById('staticBackdrop'); 


		const date1 = new Date(result);	//체크인시간
		const date2 = new Date(); //현재시간

//			체크인시간 // 현재시간
		if(date1.getTime() < date2.getTime()){
			alert("예약취소 시간이 지났습니다.");
			$('#staticBackdrop').modal('hide')
		} else {
			$('#staticBackdrop').modal('show')
			
		
		}};
		
		function reasonChk() {

	            var target = document.getElementById("cancle-select");
	            var selectVal = target.options[target.selectedIndex].value;
	            alert(selectVal);
	            $('#canc_reason').val(selectVal);
	            if (selectVal==""||selectVal==null) {
	                alert("취소사유를 선택해주세요");
	                
	             }else {
	                document.getElementById('resCancle').submit();
	             }
	            
	            
	            
	                   
	            
		}

	</script>
</body>
</html>
<!-- 여기밑에만 복사 -->
