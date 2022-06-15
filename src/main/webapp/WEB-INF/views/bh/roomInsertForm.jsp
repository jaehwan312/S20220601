<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
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
    	<input type="button" id="add" value="객실 추가">
    	<form action="roomInsert"  method="post">
    	<input type="hidden" value="${host_num }" name="host_num">
    	<div >
    	<table border="1" id="stayforEach">
    		<tr id="tradd">
    			<td><strong>객실</strong></td>
    			<td><input type="text" name="room_name" required="required" placeholder="객실명"></td>
    			<td><input type="number" name="allow" required="required" min="1" max="20" value="1"></td>
    			<td><input type="text" name="room_info" required="required" placeholder="객실 소개글"></td>
    			<td><input  type="text"  name="dayfee" required="required" placeholder="평일요금"></td>
    			<td><input type="text"   name="weekfee" required="required" placeholder="주말요금"></td>
    			<td><div>
				</div>
    		</tr>
    		<tr>
							<c:forEach  begin="0" end="4" varStatus="i">
			                    <label class="labelInfo" id="labelInfo${i.index}" for="inputInfo${i.index}">
			                       	 사진 업로드
									<input type="file" class="host_photo" id="inputInfo${i.index}" name="host_photo${i.index}" 
										onchange="previewFiles(${i.index})" accept="images/bh/*">
			                    </label><p/>
			               </c:forEach>
    		</tr>
    	</table>
    	</div>
    	<input type="submit" value="등록요청">
    	</form>
    	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/bh/roomList.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#add').click(function() {
				alert('add start...');
				var photo;
				var iterable = [0];
				var addtable= '<tr id="tradd">'+
				  '<td><strong>객실</strong></td>'+
				  '<td><input type="text" name="room_name" required="required" placeholder="객실명"></td>'+
	    		  '<td><input type="number" name="allow" required="required" min="1" max="20" value="1"></td>'+
	    		  '<td><input type="text" name="room_info" required="required" placeholder="객실 소개글"></td>'+
	    		  '<td><input  type="text"  name="dayfee" required="required" placeholder="평일요금"></td>'+
	    		  '<td><input type="text"   name="weekfee" required="required" placeholder="주말요금"></td>'+
	    		  '<td><div></div>';
					
					
					
					
					        photo = '<c:forEach var="idx" begin="0" end="4" varStatus="status">'
							for (var key in iterable) {
								  photo = photo + '<div class="insertPhoto"' + key + '">';
								  photo = photo + '<div id="preview' + key + '" ></div>';
								  photo = photo + '<label class="labelInfo" id="labelInfo'+key+'" for="inputInfo'+key+'">';
								  photo = photo + '<input type="file" class="host_photo" id="inputInfo'+key+'" name="host_photo'+key+'" ';
								  photo = photo + 'onchange="previewFiles('+key+')" accept="images/bh/*">';
								  photo = photo + '</label><p/></div>';
								}
					        	'</c:forEach>'
							
					
					$('#stayforEach').append(addtable);
					$('#stayforEach').append(photo);
			
			
			});
		
		});
	</script>
</body>
</html>