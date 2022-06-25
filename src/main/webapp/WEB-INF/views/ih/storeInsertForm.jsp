<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/ih/storePhoto.css">
<link rel="stylesheet" href="css/ih/menuList.css">
<script type="text/javascript" src="js/ih/storePhoto.js"></script>
<script type="text/javascript" src="js/ih/menuList.js"></script>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<div style="text-align: center; margin-top: 100px;">
	    	<form action="storeInsert" method="post" style="text-align: center;" enctype="multipart/form-data">
				<div>
					<div>
						<div class="" id="preview"></div>
					</div>
					
					<div>
						<div class="insertPhoto" >
							<c:forEach begin="0" end="4" varStatus="i">
			                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}" >
			                       	 👉 CLICK HERE!👈 
									<input type="file" class="host_photo" id="inputInfo${i.index }" name="host_photo${i.index}" 
										onchange="previewFiles(${i.index })" accept="images/ih/*">
			                    </label>
			                </c:forEach>
	      				</div>
					</div>
				</div>
		    	<div>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>식당명</b>
		    		</label>
		    		<label>
		    			<b><input type="text" name="host_name" required="required"></b>
		    		</label><p>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>주소</b>
		    		</label>
		    		<label>
		    			<b><input type="text" name="host_addr" required="required"></b>
		    		</label>
		    		<p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>주차가능여부</b>
		    		</label>
			    	<label>
			    		<select name="parking" >
			    			<option value="Y">주차가능</option>
			    			<option value="N">주차불가</option>
			    		</select>
			    	</label>
			    	<p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;" >
		    			<b>영업시간</b>
		    		</label>
		    		<label>
		    			<input type="time" name="start_time"> ~ <input type="time" name="end_time" required="required">
		    		</label>
		    		<p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>브레이크타임</b>
		    		</label>
			    	<label>
			    		<input type="time" name="break_start_time"> ~ <input type="time" name="break_end_time">
			    	</label>
			    	<p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>음식종류</b>
		    		</label>
		    		<label>
		    			<select name="food_type">
		    				<c:forEach var="foodcode" items="${foodcodeList }">
		    					<option value="${foodcode.mcd}">${foodcode.name }</option>
		    				</c:forEach>
		    			</select>
		    		</label><p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>메뉴</b>
		    		</label>
	   					<label class="labelmenuInfo" id="labelmenuInfo0" for="menuinputInfo0">
		    				메뉴명 : <input type="text" name="menu_list[0].menu_name" id="menuinputInfo0" required="required">
					    	가격    : <input type="number" name="menu_list[0].menu_price" id="menuinputInfo0" required="required">
				    			  <input type="button" onclick="menuPlus(0)" id="menuInfoInsert0" value="+" class="btn btn-primary">
			    		</label><p/>
			    	<p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>업체소개</b>
		    		</label>
		    		<label>
		    			<textarea rows="5px;" cols="70px;" name="host_info" required="required"></textarea>
		    		</label>
		    	</div>
				<input type="submit" value="등록요청" class='btn btn-primary'>
	    	</form>
    	</div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
</body>
</html>