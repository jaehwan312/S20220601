<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="js/bh/StayPhoto.js"></script>
   
   <style type="text/css">
   div img{
	width: 100px;
	height: 100px;
}
   #labelInfo0{
	display: block;	
	text-align: center;
}

#labelInfo1{
	display: none;	
}
#labelInfo2{
	display: none;	
}
#labelInfo3{
	display: none;	
}
#labelInfo4{
	display: none;	
}
.img_btn {
    padding:0 0 0 5px;
}

.host_photo {
    font-size:29px;
    left:0px;
    top:300px;
    opacity:0;
    filter: alpha(opacity=0);
    -ms-filter: alpha(opacity=0);
    cursor:pointer;
    display: none;
}

.input-group-text{
	margin-left: auto;
	width: 100px;
}
#ips{
	margin-right: auto;
	width: 500px;
}

.roomInsertTitle {
	font-family: 'Gugi', cursive;
	font-size: 25px;
	margin-top: 50px;
}

.horizontal_rule {
	margin-bottom: 50px;
}

.labelInfo {
	text-align: center;
}

#preview {
	text-align: center;
}
   </style>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	
    	<form action="stayUpdate" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="host_num" value="${stay.host_num }">
	    		<input type="hidden" name="mem_num" value="${stay.mem_num }">
	    		<input type="hidden" name="host_app" value="${stay.host_app }">
	    		<input type="hidden" name="host_avg" value="${stay.host_avg }">
	    		<input type="hidden" name="like_count" value="${stay.like_count }">
	    		<input type="hidden" name="rev_count" value="${stay.rev_count}">
			<div>
			<h1 class="roomInsertTitle">나의 객실 추가</h1>
			</div>
			<hr class="horizontal_rule">
	    	<div class="row">
	    	<div class="col-8 mx-auto">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">숙소명</span>
			  <input type="text" name="host_name" value="${stay.host_name }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">업체주소</span>
			  <input type="text" name="host_addr"  value="${stay.host_addr }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			
			
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">숙소종류</span>
			  <select name="stay_type" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			  	<c:forEach var="staycode" items="${codeList }">
   					<option value="${staycode.mcd}">${staycode.name }</option>
   				</c:forEach>
			  </select>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">업체소개</span>
			  <input type="text" name="host_info"  value="${stay.host_info }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">편의시설</span>
			  <input type="text" name="convenient"  value="${stay.convenient}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>	
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">오시는길</span>
			  <input type="text" name="way"  value="${stay.way }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>		
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">체크인 가능시간</span>
			  <input type="time" class="form-control" name="checkin" id="stay_checkin" autocomplete="off" value="${stay.checkin}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>		
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">체크인 가능시간</span>
			  <input type="time"  class="form-control" name="checkout" id="stay_checkout" autocomplete="off" value="${stay.checkout}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>	
			<div>
				<div id="preview"></div>
				<div>
					<div class="insertPhoto" style="display: flex; justify-content: center; margin-top: 10px;">
						<c:forEach begin="0" end="4" varStatus="i">
		                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}">
		                       	 <img src="images/bh/upload.svg" class="file_input_img_btn" alt="사진 " style="width: 50px; height: 50px;"/>
								<input type="file" class="host_photo" id="inputInfo${i.index }" name="host_photo${i.index}" 
									onchange="previewFiles(${i.index })" accept="image/jpg, image/jpeg, image/png, image/gif, image/webp">
		                    </label>
		                </c:forEach>
      				</div>
				</div>
			</div>
			<input class="btn btn-outline-primary mb-5 mx-auto" style="display: flex; justify-content: center; margin-top: 10px;" type="submit" value="수정">
			</div>
			</div>
    	</form>
    	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>