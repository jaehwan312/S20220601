<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="bg_img">
    	<div class="col-lg-4">
    		<div class="title_text">
				<p class="title">맛집? 숙소?</p>
				<h1 class="title">검색하러 감수광!</h1>
			</div>
        	<div class="input-group input-group-lg" id="main_search">
			  <input type="text" class="form-control" placeholder="숙소 또는 맛집을 입력하세요" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			  <span class="input-group-text" id="inputGroup-sizing-lg"><img alt="" src="images/jj/search.png" style="height: 30px"></span>
			</div>
         </div>
    </div>
    <div class="container">
    </div>
	<%@ include file="footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>