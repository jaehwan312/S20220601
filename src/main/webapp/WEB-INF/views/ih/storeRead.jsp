<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	
    	<c:forEach items="${storePhoto }" var="photo">
    		<div style="text-align: center;">
				<img alt="업체사진" src="images/ih/${photo.photo}" width="300px;" height="300px;">
    		</div>
    	</c:forEach>
    	
    	<div>
    		식당이름: ${store.host_name}<p/>
    		식당주소: ${store.host_addr}<p/>
    		업체소개: ${store.host_info}<p/>
	    	식당평점: ${store.host_avg}<p/>
	    	주차가능여부: ${store.parking}<p/>
    	</div>
    	
    	<div>
    		<h2>운영시간</h2>
	    	영업시간: ${store.open_time}<p/>
	    	브레이크타임: ${store.break_time}<p/>
    	</div>
    	
    	<div>
    		<h2>memu</h2>
	    	음식종류: ${store.food_type}<p/>
	    	<label style="float: left;  margin-right: 25px; width: 80px;">메뉴번호</label>
	    	<label style="float: left;  margin-right: 50px; width: 100px;">메뉴이름</label>
	    	<label style="float: left;  margin-right: 50px; margin-left: 50px; width: 100px;">메뉴가격</label>
	    	<br/>
	    	<c:forEach items="${menuList }" var="menu">
	    		<div style="float: left;  margin-right: 50px; margin-left: 25px; width: 30px;">${menu.menu_num}</div>
	    		<div style="float: left;  margin-right: 50px; width: 100px;">${menu.menu_name}</div>
	    		<div style="float: left;  margin-right: 50px; margin-left: 50px; width: 100px;">${menu.menu_price}</div>
	    		<br/>
	    	</c:forEach>
    	</div>
    	
    	<div>
    		hidden값
    		업체번호: ${store.host_num}<p/>
    		업체코드: ${store.host_code}<p/>
    		회원번호: ${store.mem_num}<p/>
    	</div>
    	<div>
    		필요 X
    		찜한사람수: ${store.like_count}<p/>
    		리뷰수: ${store.rev_count}<p/>
    	</div>
    	
    	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>