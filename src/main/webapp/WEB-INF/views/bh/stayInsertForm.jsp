<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bh/stayInsertForm.css">
<script type="text/javascript" src="js/bh/StayPhoto1.js"></script>
   
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	
    	<div class="col-8 mx-auto">
			<h2 class="stayInsertTitle">나의 숙소 등록</h2>
		</div>
    	
    	<form action="stayInsert" method="post" enctype="multipart/form-data">
			
			<div class="col-4 mx-auto">
				<div class="row g-3">
					<div class="col-12">
		              <label for="hostName" class="form-label">숙소명</label>
		              <input type="text" class="form-control" name="host_name" id="hostName" placeholder="숙소명을 입력해주세요" required="">
		            </div>
		            <div class="col-12">
		              <label for="hostAddress" class="form-label">주소명</label>
		              <input type="text" class="form-control" name="host_addr" id="hostAddress" placeholder="주소를 입력해주세요" required="">
		            </div>
		            <div class="col-12">
		              <label for="stayType" class="form-label">숙소 종류</label>
		              <select class="form-select" name="stay_type" id="stayType" required="">
		              	<option selected="selected">선택하세요</option>
		              	<c:forEach var="staycode" items="${codeList }">
	    					<option value="${staycode.mcd}">${staycode.name }</option>
	    				</c:forEach>
		              </select>
		            </div>
		            
		            <div class="col-12">
		              <label for="hostInfo" class="form-label">업체소개</label>
		              <textarea rows="5" name="host_info" id="hostInfo" class="form-control" style="resize: none;" placeholder="업체에대한 간략한소개 및 사장님 한마디" required="required"></textarea>
		            </div>
		            
		            <div class="col-md-6">
		              <label for="stay_checkin" class="form-label">체크인 가능 시간</label>
		              <input type="time" class="form-control" name="checkin" id="stay_checkin" autocomplete="off" required="required" >
		            </div>
		            <div class="col-md-6">
		              <label for="stay_checkout" class="form-label">체크아웃 가능 시간</label>
		              <input type="time" class="form-control" name="checkout" id="stay_checkout" autocomplete="off" required="required">
		            </div>
		            
		            <div class="col-12">
		              <label for="convenient" class="form-label">편의시설</label>
		              <input type="text" class="form-control" name="convenient" id="convenient" placeholder="ex)헬스장,바베큐장" required="">
		            </div>
		            
		            <div class="col-12">
		              <label for="way" class="form-label">오시는길</label>
		              <textarea rows="3" name="way" id="way" class="form-control" style="resize: none;" placeholder="ex)공항에서 차로 10분 거리,버스 30번 이용후 xx정류장하차" required="required"></textarea>
		            </div>
		            <div class="col-12" style="margin-top: 20px; text-align: center;">
						<div id="preview" style="display: flex; justify-content: center; margin-top: 10px;"></div>
							<c:forEach begin="0" end="4" varStatus="i">
			                   <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}" style="margin-top: 10px; margin: auto;">
			                      	<!-- <img alt="plus" src="images/ih/plus.png" class="file_input_img_btn"> -->
			                      	<img src="images/bh/upload.svg" class="file_input_img_btn" alt="사진 " style="width: 50px; height: 50px; margin-top: 10px;"/>
								<input type="file" class="host_photo" id="inputInfo${i.index }" name="host_photo${i.index}" 
									onchange="previewFiles(${i.index })" accept="image/jpg, image/jpeg, image/png, image/gif, image/webp" >
			                   </label>
			               </c:forEach>
			           </div>
			        <input class="btn btn-primary btn-lg" id="submitbtn" type="submit" value="등록요청">
		        </div>
		    </div>
			
			
			
			
			
			
			
			
    	</form>
    	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>