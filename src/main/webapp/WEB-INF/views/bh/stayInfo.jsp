<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
</head>
<body>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    <div style="text-align: center;">
    <h1>기본정보</h1>
    	오는길 : ${stay.way}
    	체크인 : ${stay.checkin } 
    	체크아웃 : ${stay.checkout }
    	
    <h1>편의 시설</h1>
    ${stay.convenient}
    </div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
</body>
</html>