<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
		<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach items="${hostList}" var="list">
		  <div class="col">
		    <div class="card" >
		      <a href="stayRead?host_num=${list.host_num}"><img style="width: 300px; height: 200px;" src="images/bh/${list.host_photo}" class="card-img-top" alt="..."></a>
		      <div class="card-body">
		        <h5 class="card-title">${list.host_name}</h5>
		        <p class="card-text">${list.host_addr}</p>
		      </div>
		    </div>
		  </div>
		</c:forEach>
		</div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
</body>
</html>