<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
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
    height:28px;
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
    right:0px;
    top:0px;
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
.roomUpdateTitle {
	font-family: 'Gugi', cursive;
	font-size: 25px;
	margin-top: 50px;
}

.horizontal_rule {
	margin-bottom: 50px;
}
   </style>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<div>
			<h1 class="roomUpdateTitle">나의 객실 수정</h1>
		</div>
		<hr class="horizontal_rule">
    	<div style="text-align: center; margin-top: 100px;">
    	<form action="roomUpdate" method="post" style="text-align: center;" enctype="multipart/form-data">
    		<input type="hidden" value="${room.host_num }" name="host_num">
    		<input type="hidden" value="${room.room_num }" name="room_num">
			<div>
			<div class="horizontal_rule">
			<div class="row">
				<div class="col-8 mx-auto">
			<div class="input-group mb-3">
		  		<span class="input-group-text" id="inputGroup-sizing-default">객실명</span>
		 	 	<input id="ips" type="text" name="room_name" value="${room.room_name}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
	  			<span class="input-group-text" id="inputGroup-sizing-default">인원</span>
	 	 		<input id="ips" type="number"    name="allow"    min="1" max="20" value="${room.allow}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
	  			<span class="input-group-text" id="inputGroup-sizing-default">소개글</span>
	 	 		<input id="ips" type="text"      name="room_info"  value="${room.room_info}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>	
			<div class="input-group mb-3">
	  			<span class="input-group-text" id="inputGroup-sizing-default">평일요금</span>
	 	 		<input id="ips" type="number"     name="dayfee"   value="${room.dayfee}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>		
			<div class="input-group mb-3">
	  			<span class="input-group-text" id="inputGroup-sizing-default">주말요금</span>
	 	 		<input id="ips" type="number"      name="weekfee"  value="${room.weekfee}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
					<div>
						<div>
							<div id="preview" ></div>
						</div>
						<div>
							<div style="display: inline-block; margin-top: 15px; height: 50px; align-content: center;" class="insertPhoto">
								<c:forEach begin="0" end="4" varStatus="i">
				                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}">
				                       	<img src="images/bh/upload.svg" class="file_input_img_btn" alt="사진 " style="width: 50px; height: 50px; display: flex; margin: auto;"/>
										<input type="file" class="host_photo" id="inputInfo${i.index }" name="room_photo${i.index}" 
											onchange="previewFiles(${i.index })" accept="image/jpg, image/jpeg, image/png, image/gif, image/webp">
				                    </label><p/>
				                </c:forEach>
		      				</div>
						</div>
					</div>
			<input type="submit" value="수정" class="btn btn-primary" style="margin-top: 20px; width: 100px;">
			</div>
			</div>
			</div>
			</div>
    	</form>
    	</div>
   <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/bh/StayPhoto.js"></script>
</body>
</html>