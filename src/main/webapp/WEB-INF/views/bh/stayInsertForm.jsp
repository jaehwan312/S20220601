<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
   
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
    	<form action="stayInsert" method="post" style="text-align: center;" enctype="multipart/form-data">
			<div>
				<label>
					숙소명 :
				</label>
				<label>
					<input type="text" name="host_name" required="required">
				</label><p/><p/>
				<label>
					업체주소 :
				</label>
				<label>
					<input type="text" name="host_addr" required="required">
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
								<input type="file" class="host_photo" id="inputInfo${i.index }" name="host_photo${i.index}" 
									onchange="previewFiles(${i.index })" accept="images/bh/*">
		                    </label><p/>
		                </c:forEach>
      				</div>
				</div>
			</div>
				<label>
					숙소종류 :
				</label>
				<label>
					<select name="stay_type">
	    				<c:forEach var="staycode" items="${codeList }">
	    					<option value="${staycode.mcd}">${staycode.name }</option>
	    				</c:forEach>
	    			</select>
				</label><p/>
				<label>
					업체소개 :
				</label>
				<label>
					<input type="text" name="host_info" required="required">
				</label><p/>
				<label>
					편의시설 :
				</label>
				<label>
					<input type="text" name="convenient" required="required">
				</label><p/>
				<label>
					오시는길 :
				</label>
				<label>
					<input type="text" name="way" required="required">
				</label><p/>
				<label>
					체크인 가능시간 :
				</label>
				<label>
					 <input autocomplete="off" type="text" class="form-control" name="checkin" id="stay_checkin"  >
				</label><p/>
				<label>
					체크아웃 완료시간 :
				</label>
				<label>
					<input type="text" class="form-control" name="checkout" id="stay_checkout" autocomplete="off">
				</label><p/>
			
			
			</div>
			<input type="submit" value="등록요청">
    	</form>
    	</div>
    	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
   <script type="text/javascript" src="js/bh/StayPhoto.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>