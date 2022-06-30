<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/ih/storePhoto.css">
<link rel="stylesheet" href="css/ih/menuList.css">
<link rel="stylesheet" href="css/ih/storeInsertForm.css">
<script type="text/javascript" src="js/ih/storeUpdatePhoto.js"></script>
<script type="text/javascript" src="js/ih/menuList.js"></script>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<!-- boot -->
    	<div class="col-8 mx-auto">
			<h2 class="storeInsertTitle">나의 식당 수정</h2>
		</div>
	    	
    	<form action="storeUpdate" method="post" enctype="multipart/form-data">
    		<input type="hidden" name="host_num" value="${store.host_num }">
    		<input type="hidden" name="mem_num" value="${store.mem_num }">
    		<input type="hidden" name="host_app" value="${store.host_app }">
    		<input type="hidden" name="host_avg" value="${store.host_avg }">
    		<input type="hidden" name="like_count" value="${store.like_count }">
    		<input type="hidden" name="rev_count" value="${store.rev_count}">
			<div>
				<div class="col-4 mx-auto">
					<div class="row g-3">
						<div class="col-12">
			              <label for="address" class="form-label">식당명</label>
			              <input type="text" value="${store.host_name }" class="form-control" id="address" placeholder="식당명을 입력해주세요" required="required" name="host_name">
			            </div>
			            <div class="col-12">
			              <label for="address" class="form-label">주소</label>
			              <input type="text" class="form-control" value="${store.host_addr }" id="address" placeholder="주소를 입력해주세요" required="required" name="host_addr">
			            </div>
			            <div class="col-12">
			                <label for="address" class="form-label">주차가능여부</label>
			               	<select id="country" name="parking" class="form-select parking" data-parking="${store.parking }">
				    			<option value="Y">주차가능</option>
				    			<option value="N">주차불가</option>
			    			</select>
			            </div>
			            <div class="col-md-6">
			            	<label for="address" class="form-label">영업 시작시간</label>
			            	<input type="time" class="form-control" value="${store.open_time.split('~')[0]}" id="address" required="required" name="start_time">
			            </div>
			            <div class="col-md-6">
			            	<label for="address" class="form-label">영업 종료시간</label>
			            	<input type="time" class="form-control" value="${store.open_time.split('~')[1]}" id="address" required="required" name="end_time">
			            </div>
			            <div class="col-md-6">
			            	<label for="address" class="form-label">브레이크 타임</label>
			            	<input type="time" class="form-control" value="${store.break_time.split('~')[0]}" id="address" required="required" name="break_start_time">
			            </div>
			            <div class="col-md-6">
			            	<label for="address" class="form-label">&nbsp;</label>
			            	<input type="time" class="form-control" value="${store.break_time.split('~')[1]}" id="address" required="required" name="break_end_time">
			            </div>
			            <div class="col-12">
		            		<label for="address" class="form-label">음식종류</label>
					    	<select name="food_type" id="country"  class="form-select food_type" data-food_type="${store.food_type }">
		    				<option value="">선택하세요</option>
		    				<c:forEach var="foodcode" items="${foodcode }">
		    					<option value="${foodcode.mcd}">${foodcode.name }</option>
		    				</c:forEach>
		    			</select>		
			            </div>
			         </div>
			            <!-- 메뉴 등록  -->
				         <div id="menubox"  class="row g-3">
				         <c:if test="${fn:length(menuList) ==0 }">
					            <div class="col-md-4" id="menu0">
					              <label for="menuinputInfo0" class="form-label">메뉴이름</label>
					              <input type="text" class="form-control" name="menu_list[0].menu_name" id="menuinputInfo0" required="required">
					            </div>
					            <div class="col-md-4" id="price0">
					              <label for="priceinputInfo0" class="form-label">가격</label>
					              <input type="number" class="form-control" name="menu_list[0].menu_price" id="priceinputInfo0" required="required">
					            </div>
					            <div class="col-md-4 button0">
					              <label for="menuInfoInsert0" class="form-label">&nbsp;</label>
								  <input class="form-control btn btn-primary" type="button" id="menuInfoInsert0" value="추가" onclick="menuPlus(0)">
					            </div>
				         </c:if>
				         <c:if test="${fn:length(menuList) !=0 }">
					         <c:forEach items="${menuList }" var="menuList" varStatus="i">
					         	 	<!-- 첫번째 메뉴  -->
					         	 	 <c:if test="${i.first }">
									     <input type="hidden" name="menu_list[${i.index}].menu_num" id="menuinputInfo${i.index}" value="${menuList.menu_num}">
						   				 <input type="hidden" name="menu_list[${i.index}].host_num" id="menuinputInfo${i.index}" value="${menuList.host_num}">
									   	<!-- 메뉴가 하나일때 -->
									   	<c:if test="${i.first == i.last }">
										   	 <div class="col-md-4" id="menu${i.index }">
											     <label for="menuinputInfo${i.index }" class="form-label">메뉴이름</label>
											     <input type="text" class="form-control" name="menu_list[${i.index }].menu_name" id="menuinputInfo${i.index }" value="${menuList.menu_name}" required="required">
										     </div>
										     <div class="col-md-4" id="price${i.index }">
											     <label for="priceinputInfo${i.index }" class="form-label">가격</label>
											     <input type="number" class="form-control" name="menu_list[${i.index }].menu_price" id="priceinputInfo${i.index }" value="${menuList.menu_price}" required="required">
										     </div>
									     	 <div class="col-md-4 button${i.index}">
									    	 	<label for="menuInfoInsert${i.index }" class="form-label">&nbsp;</label>
										 		 <input class="form-control btn btn-primary" type="button" id="menuInfoInsert${i.index }" value="추가" onclick="menuPlus(${i.index })">
									     	</div>
								     	</c:if>
								     	<!-- 메뉴가 하나 이상 일때 -->
							     		<c:if test="${i.first != i.last }">
										   	 <div class="col-md-6" id="menu${i.index }">
											     <label for="menuinputInfo${i.index }" class="form-label">메뉴이름</label>
											     <input type="text" class="form-control" name="menu_list[${i.index }].menu_name" id="menuinputInfo${i.index }" value="${menuList.menu_name}" required="required">
										     </div>
										     <div class="col-md-6" id="price${i.index }">
											     <label for="priceinputInfo${i.index }" class="form-label">가격</label>
											     <input type="number" class="form-control" name="menu_list[${i.index }].menu_price" id="priceinputInfo${i.index }" value="${menuList.menu_price}" required="required">
										     </div>
										     <div class="col-md-4 button${i.index}">
									    	 	<label for="menuInfoInsert${i.index }" class="form-label">&nbsp;</label>
										 		 <input class="form-control btn btn-primary" type="button" id="menuInfoInsert${i.index }" value="추가" onclick="menuPlus(${i.index })">
									     	</div>
								     	</c:if>
									</c:if>
									<!-- 두번째 메뉴 ~ 마지막 전 메뉴 -->
					         	 	<c:if test="${!i.last && !i.first}">
							         	 <input type="hidden" name="menu_list[${i.index}].menu_num" id="menuinputInfo${i.index}" value="${menuList.menu_num}">
						   				 <input type="hidden" name="menu_list[${i.index}].host_num" id="menuinputInfo${i.index}" value="${menuList.host_num}">
									     <div class="col-md-6" id="menu${i.index }">
										     <label for="menuinputInfo${i.index }" class="form-label">메뉴이름</label>
										     <input type="text" class="form-control" name="menu_list[${i.index }].menu_name" id="menuinputInfo${i.index }" value="${menuList.menu_name}" required="required">
									     </div>
									     <div class="col-md-6" id="price${i.index }">
										     <label for="priceinputInfo${i.index }" class="form-label">가격</label>
										     <input type="number" class="form-control" name="menu_list[${i.index }].menu_price" id="priceinputInfo${i.index }" value="${menuList.menu_price}" required="required">
									     </div>
									     <div class="col-md-2 button${i.index}">
									    	 <label for='menuInfoInsert${i.index }' class='form-label'>&nbsp;</label>
										 	 <input class="form-control btn btn-primary" type="button" id="menuInfoInsert${i.index }" value="추가" onclick="menuPlus(${i.index })">
								  		</div>
								      	<div class="col-md-2 button${i.index}">
								      		 <label for='menuInfoDel${i.index }' class='form-label'>&nbsp;</label>
					    				 	 <input type="button" onclick="menuDel(${i.index})" id="menuInfoDel${i.index}" value="삭제" class="form-control btn btn-primary">
						    			</div>
									  </c:if>
									  <!-- 마지막 메뉴  -->
									  <c:if test="${i.last && i.index != 0}">
										 <input type="hidden" name="menu_list[${i.index}].menu_num" id="menuinputInfo${i.index}" value="${menuList.menu_num}">
						   				 <input type="hidden" name="menu_list[${i.index}].host_num" id="menuinputInfo${i.index}" value="${menuList.host_num}">
									     <div class="col-md-4" id="menu${i.index }">
										     <label for="menuinputInfo${i.index }" class="form-label">메뉴이름</label>
										     <input type="text" class="form-control" name="menu_list[${i.index }].menu_name" id="menuinputInfo${i.index }" value="${menuList.menu_name}" required="required">
									     </div>
									     <div class="col-md-4" id="price${i.index }">
										     <label for="priceinputInfo${i.index }" class="form-label">가격</label>
										     <input type="number" class="form-control" name="menu_list[${i.index }].menu_price" id="priceinputInfo${i.index }" value="${menuList.menu_price}" required="required">
									     </div>
									    <div class="col-md-2 button${i.index}">
									    	 <label for='menuInfoInsert${i.index }' class='form-label'>&nbsp;</label>
										 	 <input class="form-control btn btn-primary" type="button" id="menuInfoInsert${i.index }" value="추가" onclick="menuPlus(${i.index })">
								  	   </div>
								      	<div class="col-md-2 button${i.index}">
								      		 <label for='menuInfoDel${i.index }' class='form-label'>&nbsp;</label>
					    				 	 <input type="button" onclick="menuDel(${i.index})" id="menuInfoDel${i.index}" value="삭제" class="form-control btn btn-primary">
						    			</div>
									  </c:if>
				          	       <c:if test="${i.last }">
								 	  <input type="hidden" id="menuEndIndex" value="${i.index }"></input>
								   </c:if>
					           </c:forEach>
				           </c:if>
			             </div>
			             <!-- 메뉴 등록 끝  -->
			             <div class="row g-3" id="host_info_input">
				            <div class="col-12" >
				              <label for="address" class="form-label">업체소개</label>
				              <textarea rows="5" class="form-control" style="resize: none;" name="host_info">${store.host_info }</textarea>
				            </div>
			            </div>
					</div>
				</div>
				<!-- 사진수정 -->
				<div style="text-align: center;"id="photo_preview">
					<div id="preview"><!-- read photo  -->
						<c:forEach items="${storePhoto }" var="storePhoto" varStatus="i">
								<img src="images/store/${storePhoto.host_photo }" width="100px" height="100px" >
							 <c:if test="${i.last }">
							 	<input type="hidden" value="${i.index + 1 }" id="photoEndIndex">
							 </c:if>
						</c:forEach>
					</div>
				</div>
				
				<div style="text-align: center;">
					<div class="insertPhoto" >
						<c:forEach begin="0" end="4" varStatus="i">
		                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}" >
		                       		<img alt="plus" src="images/store/plus.png">
								<input type="file" class="host_photo" id="inputInfo${i.index }" name="host_photo${i.index}" 
									onchange="previewFiles(${i.index })" accept="images/*">
		                    </label>
		                </c:forEach>
      				</div>
				</div>
				<!-- 사진 등록 끝  -->
				<div style="text-align: center; margin: 10px;">
					<input type="submit" value="수정요청" class='btn btn-outline-primary review_btn' >
				</div>
			
			
    	</form>	
    	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/ih/updateSelect.js"></script>
</body>
</html>