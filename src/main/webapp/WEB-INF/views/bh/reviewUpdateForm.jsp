<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<link rel="stylesheet" href="css/bh/star.css">
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
    	<form action="reviewInsert" method="post" enctype="multipart/form-data" id="reviewForm">
    	<div style="text-align: center; margin-top: 100px;">
    	<input type="hidden" value="${resInfo.host_num }" name="host_num" id="hostnum">
    	<input type="hidden" value="${resInfo.mem_num }" name="mem_num" id="memnum">
    	<input type="hidden" name="rev_point" id="revpoint">
    		<section class="section">
              <div class="card-body">
                  <div id="step" class="star-rating"  style="width: 160px; height: 32px; background-size: 32px;" title="1/5"></div>
           	  </div>
     		</section>	
    		<label>
    			<textarea class="ReviewEditor__Editor"  name="rev_content" maxlength="1000" style="overflow: hidden; overflow-wrap: break-word; height: 250px; width: 400px;"   placeholder="숙소에 이용에 대한 솔직한 리뷰 감사합니다"></textarea>
    		</label>
    			<div>
					<div>
						<div id="preview" ></div>
						</div>
						<div style="display: inline-block; margin-top: 50px; ">
							<div class="insertPhoto" style="align-content: center;">
								<c:forEach begin="0" end="4" varStatus="i">
				                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}">
				                       	<img src="images/bh/upload.svg" class="file_input_img_btn" alt="사진 " style="width: 50px; height: 50px;"/>
										<input type="file" class="host_photo" id="inputInfo${i.index }" name="rev_Photo${i.index}" 
											onchange="previewFiles(${i.index })" accept="images/bh/*">
				                    </label>
				                    
				                </c:forEach>
		      				</div>
						</div>
					</div>
    	</div>
    	<div style="margin-top: 100px; text-align: center;">
    	<input type="button" value="수정" onclick="starrating()">
    	</div>
    	</form>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/bh/StayPhoto.js"></script>
	<script src="js/bh/rater-js.js"></script>
	<script src="js/bh/rater-js2.js"></script>
</body>
</html>