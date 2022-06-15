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
/* 
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
 */
   </style>
<title>제주 감수광</title>

</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<input type="button" id="add" value="객실 추가"><p>
    	<form action="roomInsert"  method="post">
    	<input type="hidden" value="${host_num }" name="host_num">
    	<table  id="stayforEach">
    		<tr id="tradd">
    			<td><strong>객실</strong></td>
    			<td><input type="text" 		name="RoomPhotoList[0].room_name" 	required="required" placeholder="객실명"></td>
    			<td><input type="number" 	name="RoomPhotoList[0].allow" 		required="required" min="1" max="20" value="1"></td>
    			<td><input type="text"		name="RoomPhotoList[0].room_info" 	required="required" placeholder="객실 소개글"></td>
    			<td><input type="text"  	name="RoomPhotoList[0].dayfee" 		required="required" placeholder="평일요금"></td>
    			<td><input type="text"   	name="RoomPhotoList[0].weekfee" 	required="required" placeholder="주말요금"></td>
    		</tr>
    						
							<tr><td colspan="6">
							<c:forEach  begin="0" end="4" varStatus="i">
							  <div style="width: 15%; display: inline-block;">
			                    <label class="labelInfo" id="labelInfo${i.index}" for="inputInfo${i.index}">
									<input type="file" class="host_photo" id="inputInfo${i.index}" name="host_photo${i.index}" 
										onchange="previewFiles(${i.index})" accept="images/bh/*" style="width: 200px; height: 30px;">
			                    </label>
			                   </div></c:forEach> </td></tr>
			               
			              
			               
			               
    	</table>
    	<br><input type="submit" value="등록요청">
    	</form>
    	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/bh/roomList.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
	    var index_num = 1;
		$(function() {
			$('#add').click(function() {
				alert('add start...');
				var photo = [5];
				var iterable = {1:0,2:1,3:2,4:3,5:4};
				var addtable= '<tr id="tradd">'+
				  '<td><strong>객실</strong></td>'+
				  '<td><input type="text" name="RoomPhotoList['+index_num+'].room_name" required="required" placeholder="객실명"></td>'+
	    		  '<td><input type="number" name="RoomPhotoList['+index_num+'].allow" required="required" min="1" max="20" value="1"></td>'+
	    		  '<td><input type="text" name="RoomPhotoList['+index_num+'].room_info" required="required" placeholder="객실 소개글"></td>'+
	    		  '<td><input  type="text"  name="RoomPhotoList['+index_num+'].dayfee" required="required" placeholder="평일요금"></td>'+
	    		  '<td><input type="text"   name="RoomPhotoList['+index_num+'].weekfee" required="required" placeholder="주말요금"></td></tr>';
	    		  
					        //photo = '<c:forEach var="idx" begin="0" end="4" varStatus="status">'
					        
								for (var key in iterable) {
								  photo[iterable[key]] = "";
								  if(key==1){photo[iterable[key]] += '<tr colspan="6">'}
								  photo[iterable[key]] += '<div class="insertPhoto' + iterable[key] + '">'
								  + '<label class="labelInfo" id="labelInfo'+iterable[key]+'" for="inputInfo'+iterable[key]+'">'
								  + '<input type="file" class="host_photo" id="inputInfo'+iterable[key]+'" name="host_photo'+iterable[key]+'" onchange="previewFiles('+iterable[key]+')" accept="images/bh/*">'
								  + '</label></div>';
								  console.log(iterable[key] + "번째" + photo[iterable[key]]);
								  if(key==5){photo[iterable[key]] += '</tr>'}
							}
					        
					        	//'</c:forEach>'
					$('#stayforEach').append(addtable);
					$('#stayforEach').append(photo[0]);
					$('#stayforEach').append(photo[1]);
					$('#stayforEach').append(photo[2]);
					$('#stayforEach').append(photo[3]);
					$('#stayforEach').append(photo[4]);
					console.log(photo[0]);
					console.log(photo[1]);
					console.log(photo[2]);
					console.log(photo[3]);
					console.log(photo[4]);
					index_num ++;
			});
		});
	</script>
</body>
</html>