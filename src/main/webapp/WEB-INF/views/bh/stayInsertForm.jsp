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
.labelInfo {
    float:left;
    height:50px;
}

.file_input_div {
    position:relative;
    width:80px;
    height:36px;
    overflow:hidden;
}

.img_btn {
    padding:0 0 0 5px;
}

.host_photo {
    font-size:29px;
    position:absolute;
    right:0px;
    top:0px;
    opacity:0;
    filter: alpha(opacity=0);
    -ms-filter: alpha(opacity=0);
    cursor:pointer;
}
.input-group-text{
	margin-left: auto;
	width: 100px;
}
#ips{
	margin-right: auto;
	width: 500px;
   </style>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<div style="text-align: center; margin-top: 100px;">
    	
    	<form action="stayInsert" method="post" style="text-align: center;" enctype="multipart/form-data">
			<div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">숙소명</span>
			  <input id="ips" type="text" name="host_name" required="required" placeholder="제주 NEW 호텔" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">업체주소</span>
			  <input id="ips" type="text" name="host_addr" required="required" placeholder="도로명주소" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div>
				<div>
					<div id="preview" ></div>
				</div>
				<div>
					<div style="display: inline-block; margin-top: 15px; align-content: center;" class="insertPhoto" >
						<c:forEach begin="0" end="4" varStatus="i">
		                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}">
		                       	<img src="images/bh/upload.svg" class="file_input_img_btn" alt="사진 " style="width: 50px; height: 50px;"/>
								<input type="file" class="host_photo" id="inputInfo${i.index }" name="host_photo${i.index}" 
									onchange="previewFiles(${i.index })" accept="images/bh/*" required="required">
		                    </label><p/>
		                </c:forEach>
      				</div>
				</div>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">숙소종류</span>
		  		<select id="ips" name="stay_type" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
    				<c:forEach var="staycode" items="${codeList }">
    					<option value="${staycode.mcd}">${staycode.name }</option>
    				</c:forEach>
    			</select>
			 </div>			
				
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">업체소개</span>
			  <input id="ips" type="text" name="host_info" required="required" placeholder="업체에대한 간략한소개 및 사장님 한마디" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">편의시설</span>
			  <input id="ips" type="text" name="convenient" required="required" placeholder="ex)헬스장,바베큐장" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">오시는길</span>
			  <input id="ips" type="text" name="way" required="required" placeholder="ex)공항에서 차로 10분 거리,버스 30번 이용후 xx정류장하차" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">체크인 가능시간</span>
			  <input id="ips" type="time" class="form-control" name="checkin" id="stay_checkin" autocomplete="off" required="required" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">체크아웃 완료시간</span>
			  <input id="ips" type="time"  class="form-control" name="checkout" id="stay_checkout" autocomplete="off" required="required" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			</div>
			<input type="submit" value="등록요청">
    	</form>
    	</div>
    	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>