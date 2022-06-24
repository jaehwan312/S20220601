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

.input-group-text{
	margin-left: auto;
	width: 100px;
}
#ips{
	margin-right: auto;
	width: 500px;
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
    		<input type="hidden" value="${host_num }" name="host_num">
			<div style="text-align: center;">
			
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">객실명</span>
			  <input id="ips" type="text" name="room_name" required placeholder="객실 이름" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">인원</span>
			  <input id="ips" type="number" name="allow" required min="1" max="20" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>	
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">객실 소개글</span>
			  <textarea id="ips" name="room_info" required placeholder="객실 소개글" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="height: 150px;"></textarea>
			</div>	
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">평일요금</span>
			  <input id="ips" type="number"     name="dayfee"       required placeholder="ex)100000" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">주말요금</span>
			  <input id="ips" type="number"      name="weekfee"    required placeholder="ex)150000" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>	
					<div>
						<div>
							<div id="preview" ></div>
						</div>
						<div>
							<div style="display: inline-block; margin-top: 15px; height: 50px; align-content: center;" class="insertPhoto">
								<c:forEach begin="0" end="4" varStatus="i">
				                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}">
				                       	<img src="images/bh/upload.svg" class="file_input_img_btn" alt="사진 " style="width: 50px; height: 50px;"/>
										<input type="file" class="host_photo" id="inputInfo${i.index }" name="room_photo${i.index}" 
											onchange="previewFiles(${i.index })" accept="images/bh/*">
				                    </label><p/>
				                </c:forEach>
		      				</div>
						</div>
					</div>
			</div>
			<div style="margin-bottom: 30px;">
			<input type="submit" value="등록요청"><br>
			</div>
    	</form>
	    	<table class="table">
	    		<thead class="table-light">
		    		<c:if test="${roomList != null}">
		    			<th>객실명</th>
		    			<th>인원수</th>
		    			<th>객실 소개글</th>
		    			<th>평일요금</th>
		    			<th>주말요금</th>
		    		</c:if>
		    	 </thead>	
		    	 <tbody>
		    	 	<c:if test="${roomList != null}">
			    		<c:forEach items="${roomList}" var="room">
				    		<tr>
				    			<td>${room.room_name}</td>
				    			<td>${room.allow}</td>
				    			<td>${room.room_info}</td>
				    			<td>${room.dayfee}</td>
				    			<td>${room.weekfee}</td>
				    		</tr>
			    		</c:forEach>
		    		</c:if>
		    	</tbody>
	    	</table>
    	</div>
    	
     <!-- 여기 위로오 ============================================================ -->   
   <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/bh/StayPhoto.js"></script>
</body>
</html>