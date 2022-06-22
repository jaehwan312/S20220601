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

   </style>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<div style="text-align: center; margin-top: 100px;">
    	<form action="roomUpdate" method="post" style="text-align: center;" enctype="multipart/form-data">
    		<input type="hidden" value="${room.host_num }" name="host_num">
    		<input type="hidden" value="${room.room_num }" name="room_num">
			<div>
				<label>
					객실명 :
				</label>
				<label>
					<input type="text" name="room_name" value="${room.room_name}">
				</label><p/><p/>
				<label>
					인원 :
				</label>
				<label>
					<input type="number"    name="allow"    min="1" max="20" value="${room.allow}">
				</label><p/>
				<label>
					객실 소개글 :
				</label>
				<label>
					<input type="text"      name="room_info"  value="${room.room_info}">
				</label><p/>
				<label>
					평일요금 :
				</label>
				<label>
					<input type="number"     name="dayfee"   value="${room.dayfee}">
				</label><p/>
				<label>
					주말요금 :
				</label>
				<label>
					<input type="number"      name="weekfee"  value="${room.weekfee}">
				</label><p/>
					
					<div>
						<div>
							<div id="preview" ></div>
						</div>
						<div>
							<div class="insertPhoto">
								<c:forEach begin="0" end="4" varStatus="i">
				                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}">
				                       	 사진 업로드
										<input type="file" class="host_photo" id="inputInfo${i.index }" name="room_photo${i.index}" 
											onchange="previewFiles(${i.index })" accept="images/bh/*">
				                    </label><p/>
				                </c:forEach>
		      				</div>
						</div>
					</div>
			</div>
			<input type="submit" value="수정">
    	</form>
    	</div>
   <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/bh/StayPhoto.js"></script>
</body>
</html>