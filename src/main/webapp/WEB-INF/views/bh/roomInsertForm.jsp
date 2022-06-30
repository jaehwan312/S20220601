<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
 <!-- <link rel="stylesheet" href="css/bh/stayInsertForm.css"> -->
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
    left:0px;
    top:300px;
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

.roomInsertTitle {
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
			<h1 class="roomInsertTitle">나의 객실 추가</h2>
		</div>
		<hr class="horizontal_rule">
    	<div class="row">
    	<div class="col-8 mx-auto">
    	<form action="roomInsert" method="post" style="text-align: center;" enctype="multipart/form-data">
			<div>
    		<input type="hidden" value="${host_num }" name="host_num">
			
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">객실명</span>
			  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" type="text" name="room_name" required placeholder="객실 이름" >
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">인원</span>
			  <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="allow" required min="1" max="20" value="1">
			</div>	
			<div class="input-group mb-3">
			  <span class="input-group-text">객실 소개글</span>
			  <textarea name="room_info" required placeholder="객실 소개글" class="form-control" aria-label="With textarea"></textarea>
			</div>	
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">평일요금</span>
			  <input type="number"     name="dayfee"       required placeholder="ex)100000" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">주말요금</span>
			  <input id="ips" type="number"      name="weekfee"    required placeholder="ex)150000" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
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
			<input class="btn btn-outline-primary" type="submit" value="등록">
			<button class="btn btn-outline-primary" type="button" onclick="location.href='main'">저장</button>
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
    	</div>
   <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/bh/StayPhoto.js"></script>
</body>
</html>