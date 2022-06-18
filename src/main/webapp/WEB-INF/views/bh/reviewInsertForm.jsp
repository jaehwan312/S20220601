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
    position:absolute;
    right:0px;
    top:0px;
    opacity:0;
    filter: alpha(opacity=0);
    -ms-filter: alpha(opacity=0);
    cursor:pointer;
}
   </style>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<form action="reviewInsert">
    	<div style="text-align: center; margin-top: 100px;">
    	<input type="hidden" value="${host_num }" name="host_num">
    	<input type="hidden" value="${mem_num }" name="mem_num">
    		<label>
    			리뷰내용
    		</label>
    		<label>
    			<textarea class="ReviewEditor__Editor" maxlength="1000" style="overflow: hidden; overflow-wrap: break-word; height: 150px;" placeholder="숙소에 이용에 대한 솔직한 리뷰 감사합니다"></textarea>
    		</label>
    			<div>
					<div>
						<div id="preview" ></div>
						</div>
						<div>
							<div class="insertPhoto">
								<c:forEach begin="0" end="4" varStatus="i">
				                  <%--   <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}">
				                       	 사진 업로드
										<input type="file" class="host_photo" id="inputInfo${i.index }" name="room_photo${i.index}" 
											onchange="previewFiles(${i.index })" accept="images/bh/*">
				                    </label> --%>
				                    <input type="text" id="labelInfo${i.index }" class="labelInfo" readonly >
										<div class="file_input_div">
										    <img src="images/bh/upload.svg" class="img_btn" alt="open" />
										    <input type="file" name="room_photo${i.index}" class=host_photo id="inputInfo${i.index }"
										    onchange="previewFiles(${i.index })" accept="images/bh/*" />
										</div>
				                </c:forEach>
		      				</div>
						</div>
					</div>
    	</div>
    	</form>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/bh/StayPhoto.js"></script>
</body>
</html>