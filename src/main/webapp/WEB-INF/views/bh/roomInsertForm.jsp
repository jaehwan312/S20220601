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
   
   </style>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<div style="text-align: center; margin-top: 100px;">
    	<form action="roomInsert" method="post" style="text-align: center;" enctype="multipart/form-data">
			<div class="insert" id="insert0" >
				<input type="button" onclick="" value="+객실" class="roombutton">
				<input type="hidden" value="${host_num }" name="host_num">
				<label>
					객실명 :
				</label>
				<label>
					<input type="text" name="room_name" required="required" placeholder="트윈룸">
				</label><p/><p/>
				<label>
					인원 :
				</label>
				<label>
					<input type="number" name="allow" required="required" min="1" max="20" value="1">
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
											onchange="previewFiles(${i.index })" accept="images/bh/*"  >
				                    </label><p/>
				                </c:forEach>
		      				</div>
						</div>
					</div>
				<label>
					객실 소개글 :
				</label>
				<label>
					<input type="text" name="room_info" required="required" placeholder="객실 기본정보 및 편의시설">
				</label><p/>
				<label>
					평일 요금 :
				</label>
				<label>
					 <input  type="text"  name="dayfee" required="required" placeholder="50000">
				</label><p/>
				<label>
					주말 요금 :
				</label>
				<label>
					<input type="text"   name="weekfee" required="required" placeholder="80000">
				</label><p/>
			
				
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