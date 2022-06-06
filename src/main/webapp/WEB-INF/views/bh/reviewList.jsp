<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
		<div style="text-align: center; margin-top: 100px;">
			<h1>리뷰</h1>
			<div>
				<h2>${hostreview.host_avg}</h2>
				<p />
				리뷰 : ${hostreview.rev_count }
			</div>
			<div style="padding: 80px;">
				<c:forEach items="${reviewList }" var="getList">
					<div style="text-align: left; padding-left: 70px; padding-top: 30px;">
	    					${getList.room_name }
	    			</div>
    				<div
						style="width: 40%; text-align: left; padding-left: 60px; padding-bottom: 30px; padding-top: 30px;">
						${getList.rev_content}</div>
					<div
						style="width: 100%; height: 200px; text-align: left; padding-left: 60px;">
						<c:forEach items="${getList.revPhoto }" var="getPhoto">
							<img alt="리뷰사진" src="images/bh/${getPhoto.rev_photo}"
								width="200px;" height="200px;">
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>