<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/js/sideBar.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<!-- 사이드바 -->
	<div id="sidebar-wrapper">
		<c:choose>

			<c:when test="${grade=='1' }">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="myPage">마이페이지</a>
						<hr style="width: 60%;"></li>
					<li><a href="myPage">나의 프로필</a></li>
					<li><a href="resList">예약내역</a></li>
					<li><a href="#">나의 픽(찜목록)</a></li>
					<li><a href="#">나의 식당정보</a></li>
					<li><a href="#">나의 숙소정보</a></li>
					<li><a href="#">관리자 페이지</a></li>
				</ul>
			</c:when>
			<c:when test="${grade=='2' }">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="myPage">마이페이지</a>
						<hr style="width: 60%;"></li>
					<li><a href="myPage">나의 프로필</a></li>
					<li><a href="resList">예약내역</a></li>
					<li><a href="#">나의 픽(찜목록)</a></li>
					<li><a href="#">나의 식당정보</a></li>
					<li><a href="#">나의 숙소정보</a></li>
				</ul>
			</c:when>
		</c:choose>
	</div>
	<!-- /사이드바 -->

</body>
</html>