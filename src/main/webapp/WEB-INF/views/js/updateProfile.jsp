<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/template.css">
<link rel="stylesheet" href="css/js/updateForm.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<title>제주 감수광</title>
<style type="text/css">
	.id_ok{color:#6A82FB; display: none; margin: 5px;}
	.id_already{color:#FF0000; display: none; margin: 5px;}
	.phone_ok{color:#6A82FB; display: none; margin: 5px;}
	.phone_already{color:#FF0000; display: none; margin: 5px;}
	.phone_Chk{color:#FF0000; margin: 5px;}
</style>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
	<div class="row py-lg-5">
			<div class="col-lg-5 col-md-5 mx-auto">
				<h1 class="fw-bolder" style="text-align: center;">프로필 수정</h1>
				<c:if test="${msg!=null}">${msg}</c:if>
				<form class="row g-3" action="updateInfo" method="post" onsubmit="return join()" enctype="multipart/form-data">
				<div>
					<div class="photoBox">
	    				<img id="preview" class="profilePhoto" style="width: 200px; height: 200px;" src = "${pageContext.request.contextPath}/images/js/${profile.photo}"/>
					</div>
				</div>
					<div>
						<input class="form-control" type="file" name="profilePhoto" id="photo"		
							onchange="readURL(this);" accept="image/png, image/jpeg, image/jpg">
					</div>
					<div class="col-12"> 
						<label for="passwd" class="form-label">비밀번호</label> 
						<input type="password" name="pw" class="form-control" id="pw"
							   placeholder="6~10자의 영문 대소문자와 숫자로만 입력" maxlength="10">
					</div>
					<div class="col-12">
						<label for="pwCheck" class="form-label">비밀번호 확인</label>
					    <input type="password" class="form-control" id="pwCheck" placeholder="비밀번호 확인" maxlength="12" >
					</div>
					<div class="col-md-6">
						<label for="name" class="form-label">이름</label>
						<input type="text" name="name" class="form-control" autocomplete="off" id="name" maxlength="20" 
							   onkeyup="nameCheck(this)" onkeydown="nameCheck(this)" placeholder="한글로만 입력해주세요" value="${profile.name }">
					</div>
					<div class="col-md-6">
						<label for="gender" class="form-label">성별</label> 
						<select id="gender" class="form-select" name="gender" value="${profile.gender}">
							<option value="" selected="selected">선택하세요</option>
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</div>
					<div class="col-12">
						<label for="birth" class="form-label">생년월일</label> 
						<input type="text" name="birth" autocomplete="off" class="form-control" id="birth" 
							   placeholder="ex)19980514" onkeyup="birthCheck(this)" onkeydown="birthCheck(this)" value="${profile.birth }">
					</div>
					<div class="col-12">
						<label for="phone" class="form-label">전화번호</label> 
						<input type="text" autocomplete="off" name="phone" id="phone" class="form-control" placeholder="'-'없이  숫자로 11자리 입력해주세요"  
					  		 autocomplete="off" oninput = "checkPhonek()" 
					  		 onkeyup="phoneCheck(this)" onkeydown="phoneCheck(this)" value="${profile.phone }">
					  		 <span class="phone_Chk" style="margin: 0px">전화번호 수정을 원치 않으면 어떠한값도 입력하지 말아주세요</span>
					</div>
						<span class="phone_ok" style="margin: 0px">사용 가능한 핸드폰번호 입니다.</span>
					    <span class="phone_already" style="margin: 0px">사용 불가능한 핸드폰 번호입니다.</span>
					<div class="col-12">
						<label for="email" class="form-label">이메일</label>
						<input type="text" placeholder="이메일을 입력해주세요" name="email" id="email" class="form-control" autocomplete="off"  value="${profile.email }">
						<button type="button" id="email_auth_btn" class="btn btn-primary" style="float: right; margin-top: 5px;" onclick="auth_btn()">인증번호 받기</button>
					</div>
					<div class="col-12"  style="margin-top: 0px;">
						<label for="email_auth_key" class="form-label" >인증번호</label>
						<input type="text" autocomplete="off" placeholder="인증번호 입력" id="email_auth_key" class="form-control">
					</div>
					<div style="text-align: right;">
						<button type="submit" class="btn btn-primary" >수정완료</button>
						<button type="button" class="btn btn-primary" onclick="location.href='myPage'">취소</button>				
					</div>
				</form>
			</div>
		</div>
	</div>
    <!-- 여기 위로오 ============================================================ -->   
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/js/updateProfile.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>