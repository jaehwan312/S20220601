<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/ih/storePhoto.css">
<link rel="stylesheet" href="css/ih/menuList.css">
<script type="text/javascript" src="js/ih/storeUpdatePhoto.js"></script>
<script type="text/javascript" src="js/ih/menuList.js"></script>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<div style="text-align: center; margin-top: 100px;">
	    	<form action="storeUpdate" method="post" style="text-align: center;" enctype="multipart/form-data">
	    		<input type="hidden" name="host_num" value="${store.host_num }">
	    		<input type="hidden" name="mem_num" value="${store.mem_num }">
	    		<input type="hidden" name="host_app" value="${store.host_app }">
	    		<input type="hidden" name="host_avg" value="${store.host_avg }">
	    		<input type="hidden" name="like_count" value="${store.like_count }">
	    		<input type="hidden" name="rev_count" value="${store.rev_count}">
				<div>
					<div style="display: inline;">
						<div id="preview1" style="display: inline;"><!-- read photo  -->
						<c:forEach items="${storePhoto }" var="storePhoto" varStatus="i">
								<img src="images/ih/${storePhoto.host_photo }" width="100px" height="100px" >
							 <c:if test="${i.last }">
							 	<input type="hidden" value="${i.index + 1 }" id="photoEndIndex">
							 </c:if>
						</c:forEach>
						</div>
					</div>
					
					<div>
						<div class="insertPhoto" >
							<c:forEach begin="0" end="4" varStatus="i">
			                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}" >
			                       	 👉 CLICK HERE!👈 
									<input type="file" class="host_photo" id="inputInfo${i.index }" name="host_photo${i.index}" 
										onchange="previewFiles(${i.index })" accept="images/*">
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
		    			<b><input type="text" name="host_name" required="required" value="${store.host_name }"></b>
		    		</label><p>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>주소</b>
		    		</label>
		    		<label>
		    			<b><input type="text" name="host_addr" required="required" value="${store.host_addr }"></b>
		    		</label>
		    		<p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>주차가능여부</b>
		    		</label>
			    	<label>
			    		<select name="parking" class="parking" data-parking="${store.parking }">
			    			<option value="Y">주차가능</option>
			    			<option value="N">주차불가</option>
			    		</select>
			    	</label>
			    	<p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;" >
		    			<b>영업시간</b>
		    		</label>
		    		<label>
		    			<input type="time" name="start_time" value="${store.open_time.split('~')[0]}"> ~ <input type="time" name="end_time" required="required" value="${store.open_time.split('~')[1]}">
		    		</label>
		    		<p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>브레이크타임</b>
		    		</label>
			    	<label>
			    		<input type="time" name="break_start_time" value="${store.break_time.split('~')[0]}"> ~ <input type="time" name="break_end_time" value="${store.break_time.split('~')[1]}">
			    	</label>
			    	<p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>음식종류</b>
		    		</label>
		    		<label>
		    			<select name="food_type" class="food_type" data-food_type="${store.food_type }">
		    				<c:forEach var="foodcode" items="${foodcode }">
		    					<option value="${foodcode.mcd}">${foodcode.name }</option>
		    				</c:forEach>
		    			</select>
		    		</label><p/>
		    		<div>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    			<b>메뉴</b>
		    		</label>
		    		</div>
		    		
		    			<c:forEach items="${menuList }" var="menuList" varStatus="i">
		    				<div>
			   					<label class="labelmenuInfo" id="labelmenuInfo${i.index}" for="menuinputInfo${i.index}">
			   								<input type="hidden" name="menu_list[${i.index}].menu_num" id="menuinputInfo${i.index}" value="${menuList.menu_num}">
			   								<input type="hidden" name="menu_list[${i.index}].host_num" id="menuinputInfo${i.index}" value="${menuList.host_num}">
				    				메뉴명 : <input type="text" name="menu_list[${i.index}].menu_name" id="menuinputInfo${i.index}" value="${menuList.menu_name}" required="required">
							    	가격    : <input type="number" name="menu_list[${i.index}].menu_price" id="menuinputInfo${i.index}" value="${menuList.menu_price}" required="required">
					    			  <input type="button" onclick="menuPlus(${i.index})" id="menuInfoInsert${i.index}" value="+" class="btn btn-primary">
				    				  <c:if test="${i.index != 0 }">
				    				 	 <input type="button" onclick="menuDel(${i.index})" id="menuInfoDel${i.index}" value="-" class="btn btn-primary">
					    			  </c:if>	
					    		</label><p/>
					    		<c:if test="${i.last }">
									<input type="hidden" id="menuEndIndex" value="${i.index }"></input>
								</c:if>
							</div>
			    		</c:forEach>
			    	
			    	<p/>
		    		<label style="float: left;  margin-right: 25px; width: 100px;">
		    		
		    			<b>업체소개</b>
		    		</label>
		    		<label>
		    			<textarea rows="5px;" cols="70px;" name="host_info" required="required">${store.host_info }</textarea>
		    		</label>
		    	</div>
				<input type="submit" value="수정요청" class='btn btn-primary'>
	    	</form>
    	</div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/ih/updateSelect.js"></script>
</body>
</html>