<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/ih/storePhoto.css">
<link rel="stylesheet" href="css/ih/menuList.css">
<link rel="stylesheet" href="css/ih/storeInsertForm.css">
<script type="text/javascript" src="js/ih/storePhoto.js"></script>
<script type="text/javascript" src="js/ih/menuList.js"></script>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<div class="col-8 mx-auto">
			<h2 class="storeInsertTitle">나의 식당 등록</h2>
		</div>
	    	
    	<form action="storeInsert" method="post" enctype="multipart/form-data">
			<div>
				<div class="col-4 mx-auto">
					<div class="row g-3">
						<div class="col-12">
			              <label for="address" class="form-label">식당명</label>
			              <input type="text" class="form-control" id="address" placeholder="식당명을 입력해주세요" required="required" name="host_name">
			            </div>
			            <div class="col-12">
			              <label for="address" class="form-label">주소</label>
			              <input type="text" class="form-control" id="address" placeholder="주소를 입력해주세요" required="required" name="host_addr">
			            </div>
			            <div class="col-12">
			                <label for="address" class="form-label">주차가능여부</label>
						    <select class="form-select" id="country" name="parking">
			               		<option value="">선택하세요</option>
				    			<option value="Y">주차 가능</option>
				    			<option value="N">주차 불가</option>
			                </select>		              
			            </div>
			            <div class="col-md-6">
			            	<label for="address" class="form-label">영업 시작시간</label>
			            	<input type="time" class="form-control" id="address" required="required" name="start_time">
			            </div>
			            <div class="col-md-6">
			            	<label for="address" class="form-label">영업 종료시간</label>
			            	<input type="time" class="form-control" id="address" required="required" name="end_time">
			            </div>
			            <div class="col-md-6">
			            	<label for="address" class="form-label">브레이크 타임</label>
			            	<input type="time" class="form-control" id="address" required="required" name="break_start_time">
			            </div>
			            <div class="col-md-6">
			            	<label for="address" class="form-label">&nbsp;</label>
			            	<input type="time" class="form-control" id="address" required="required" name="break_end_time">
			            </div>
			            <div class="col-12">
		            		<label for="address" class="form-label">음식종류</label>
					    	<select class="form-select" id="country" name="food_type">
		                		<option value="">선택하세요</option>
		    					<c:forEach var="foodcode" items="${foodcodeList }">
		    						<option value="${foodcode.mcd}">${foodcode.name }</option>
		    					</c:forEach>
		              		</select>		
			            </div>
				         <!-- 메뉴 등록 -->
				         <div id="menubox">
				            <div class="divmenuInfo" id="divmenuInfo0" style="display: flex;">
					            <div class="col-md-4" id="menu0">
					              <label for="menuinputInfo0" class="form-label">메뉴이름</label>
					              <input type="text" class="form-control" name="menu_list[0].menu_name" id="menuinputInfo0" required="required">
					            </div>
					            <div class="col-md-4" id="price0">
					              <label for="menuinputInfo0" class="form-label">가격</label>
					              <input type="number" class="form-control" name="menu_list[0].menu_price" id="menuinputInfo0" required="required">
					            </div>
					            <div class="col-md-4">
					              <label for="button1" class="form-label">&nbsp;</label>
								  <input class="form-control btn btn-primary" type="button" id="menuInfoInsert0" value="추가" onclick="menuPlus(0)">
					            </div>
				            </div>
			             </div>
			             <!-- 메뉴 등록 끝  -->
			             
			            <div class="col-12">
			              <label for="address" class="form-label">업체소개</label>
			              <textarea rows="5" class="form-control" style="resize: none;" name="host_info"></textarea>
			            </div>
					</div>
				</div>
				
				<!-- 사진등록 -->
				<div style="text-align: center; margin: 10px;">
					<div class="" id="preview"></div>
				</div>
				<div style="text-align: center; margin: 10px;">
					<div class="insertPhoto" >
						<c:forEach begin="0" end="4" varStatus="i">
		                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}" >
		                       	 👉 CLICK HERE!👈 
								<input type="file" class="host_photo" id="inputInfo${i.index }" name="host_photo${i.index}" 
									onchange="previewFiles(${i.index })" accept="images/ih/*">
		                    </label>
		                </c:forEach>
      				</div>
				</div>
				<!-- 사진 등록 끝  -->
				<div style="text-align: center; margin: 10px;">
					<input type="submit" value="등록요청" class='btn btn-outline-primary review_btn' style="width=100%;">
				</div>
			</div>
			
    	</form>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
</body>
</html>