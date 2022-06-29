<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/template.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<title>제주 감수광</title>
<script type="text/javascript" src="js/js/signUpPage.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	
</script>
<style type="text/css">
	.id_ok{color:#6A82FB; display: none; margin: 5px;}
	.id_already{color:#FF0000; display: none; margin: 5px;}
	.phone_ok{color:#6A82FB; display: none; margin: 5px;}
	.phone_already{color:#FF0000; display: none; margin: 5px;}
</style>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
	<div class="row py-lg-5">
			<div class="col-lg-5 col-md-5 mx-auto">
				<h1 class="fw-bolder" style="text-align: center;">회원가입</h1>
				<c:if test="${msg!=null}">${msg}</c:if>
				<form class="row g-3" action="signUp" method="post" onsubmit="return join()" enctype="multipart/form-data">
					<div style="text-align: center;">
	    				<tr>
							<td><img  id="preview" width="80%" style="width: 250px; height: 250px; margin: 10px;"/></td>
						</tr>
						<tr>
							<td><input class="form-control" type="file" name="profilePhoto" id="photo"	
							onchange="readURL(this);" accept="image/png, image/jpeg, image/jpg"></td>
						</tr>
					</div>
					
					
					<div class="col-12" style="margin-bottom: 0px">
						<label for="id" class="form-label">아이디</label>
					    <input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력해주세요"  
					  		 autocomplete="off" maxlength="10" oninput = "checkId()" 
					  		 onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
					</div>
					   <span class="id_ok" style="margin: 0px">사용 가능한 아이디입니다.</span>
					   <span class="id_already" style="margin: 0px">사용 불가능한 아이디입니다.</span>
					
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
						<input type="text" name="name" class="form-control" autocomplete="off" id="name" maxlength="20" onkeyup="nameCheck(this)" onkeydown="nameCheck(this)" placeholder="한글로만 입력해주세요">
					</div>
					<div class="col-md-6">
						<label for="gender" class="form-label">성별</label> 
						<select id="gender" class="form-select" name="gender">
							<option value="" selected="selected">선택하세요</option>
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</div>
					<div class="col-12">
						<label for="birth" class="form-label">생년월일</label> 
						<input type="text" name="birth" autocomplete="off" class="form-control" id="birth" placeholder="ex)19980514" onkeyup="birthCheck(this)" onkeydown="birthCheck(this)">
					</div>
					<div class="col-12">
						<label for="phone" class="form-label">전화번호</label> 
						<input type="text" autocomplete="off" name="phone" id="phone" class="form-control" placeholder="'-'없이  숫자로 11자리 입력해주세요"  
					  		 autocomplete="off" oninput = "checkPhonek()" 
					  		 onkeyup="phoneCheck(this)" onkeydown="phoneCheck(this)">
					</div>
						<span class="phone_ok" style="margin: 0px">사용 가능한 핸드폰번호 입니다.</span>
					    <span class="phone_already" style="margin: 0px">사용 불가능한 핸드폰 번호입니다.</span>
					<div class="col-12">
						<label for="email" class="form-label">이메일</label>
						<input type="text" placeholder="이메일을 입력해주세요" name="email" id="email" class="form-control" autocomplete="off">
						<button type="button" id="email_auth_btn" class="btn btn-primary" style="float: right; margin-top: 5px;" onclick="auth_btn()">인증번호 받기</button>
					</div>
					<div class="col-12"  style="margin-top: 0px;">
						<label for="email_auth_key" class="form-label" >인증번호</label>
						<input type="text" autocomplete="off" placeholder="인증번호 입력" id="email_auth_key" class="form-control">
					</div>
					
					
					<div class="col-12"  style="margin-bottom: 10px; text-align: center;">
						<br>
						   <input type="checkbox" name="agree" id="agree" value="Y"><a href="tosContent" target="_blank" style="text-decoration: underline;  color: #4b70fd;">개인정보 수집 이용 및 약관</a> 동의합니다.
						<br>
					</div>
					<button type="submit" class="btn btn-primary btn-lg" style="margin-top: 50px;">회원가입</button>					
				</form>
			</div>
		</div>
	</div>
    <!-- 여기 위로오 ============================================================ -->   
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>