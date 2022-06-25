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
<link rel="stylesheet" href="css/template.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/js/userSleepTitle.css">
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
		<div class="col-lg-3 col-md-5 mx-auto" style="margin-top: 10%">
				<div class="userSleepTitle">
         		   <h1>회원탈퇴</h1>
   		        </div>	
				<form id="userSleep" class="row g-3" action="userSleepUpdate" method="post" >
					<div class="col-12">
						<label for="passwd" class="form-label">비밀번호</label> 
						<input type="password" name="pw" class="form-control" id="pw" placeholder="비밀번호를 입력하세요" maxlength="12">
					</div>
					<div class="col-12">
						<label for="pwCheck" class="form-label">비밀번호 확인</label>
					    <input type="password" class="form-control" id="pwCheck" placeholder="비밀번호 확인" maxlength="12">
					</div>
					<div style="text-align: right;">
						<button type="button" class="btn btn-primary" onclick="join()">회원탈퇴</button>
						<button type="button" class="btn btn-primary" onclick="location.href='myPage'">취소</button>				
					</div>
				</form>
		</div>

		<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="js/js/userSleep.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>