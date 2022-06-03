<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/profile.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>제주 감수광</title>
</head>
<script type="text/javascript">

		// ajax 아이디 체크
		function checkId(){
		    var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
		    $.ajax({
		        url:'idCheck', //Controller에서 인식할 주소
		        type:'post', //POST 방식으로 전달
		        data:{id:id},
		        success:function(cnt){	// 컨트롤러에서 넘어온 cnt 값 받음
		        if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
		            $('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                }
		        },
		        error:function(){
		            alert("에러입니다");
		        }
		    });
		};
		
		// 특수문자 입력 방지
		function characterCheck(obj){
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
		var regExp1 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		// 허용할 특수문자 및 한글은 여기서 삭제
		// 띄어쓰기도 특수문자 처리됨
		if( regExp.test(obj.value) ){
			alert("특수문자 및 띄워쓰기는 입력하실수 없습니다.");
			obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
			}
		else if( regExp1.test(obj.value) ){
			alert("한글은 입력하실수 없습니다.");
			obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 한글,띄어쓰기 한자리 지움
			}
		}
		
	
		
		function chk(){
		 var pw = $("#password").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		 if(pw.length < 8 || pw.length > 15){
		
		  alert("8자리 ~ 15자리 이내로 입력해주세요.");
		  return false;
		 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  return false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
		  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		  return false;
		 }else {
			console.log("통과"); 
		    return true;
		 }
		
		}
		
		function readURL(input) {
			
//			alert('input.files[0]->'+input.files[0]);
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					// preview 라는 이미지의 값 세팅
					document.getElementById('preview').src = e.target.result;
				};
				// 실질적으로 파일을 화면에 보여주는 역할
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preview').src = "";
			}
		}
		
		
</script>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
	<div class="row py-lg-5">
			<div class="col-lg-5 col-md-5 mx-auto">
				<h1 class="fw-bolder" style="text-align: center;">회원가입</h1>
				<form class="row g-3" action="loginPage" onsubmit="return chk()" name="join" method="post">
					<div style="text-align: center;">
	    				<tr>
							<td><img  id="preview" width="80%" style="width: 250px; height: 250px; margin: 10px;"/></td>
						</tr>
						<tr>
							<td><input class="form-control" type="file" name="photo"
							onchange="readURL(this);" accept="image/png, image/jpeg, image/jpg"></td>
						</tr>
					</div>
					<label for="userId2" class="form-label" style="margin-bottom: -10px;">아이디</label>
					<div class="input-group mb-3">
					  <input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력해주세요"  
					  		 autocomplete="username" maxlength="10" required oninput = "checkId()" 
					  		 onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
					   <span class="id_ok">사용 가능한 아이디입니다.</span>
					   <span class="id_already">누군가 이 아이디를 사용중입니다.</span>
					</div>
					<div class="col-12" style="margin-top: 0;">
						<label for="passwd" class="form-label">비밀번호</label> 
						<input type="password" name="pw1" required="required" class="form-control" id="passwd" placeholder="10글자 이하 알파벳 대소문자 및 숫자 조합" maxlength="10">
					</div>
					<div class="col-12">
						<label for="passwd2" class="form-label">비밀번호 확인</label>
					    <input type="password" name="pw2" required="required" class="form-control" id="passwd2" placeholder="비밀번호 확인" maxlength="10">
					</div>
					<div class="col-md-6">
						<label for="name" class="form-label">이름</label> <input
							type="text" name="name" required="required" class="
							form-control" id="name" maxlength="20">
					</div>
					<div class="col-md-6">
						<label for="gender" class="form-label">성별</label> <select
							id="gender" class="form-select" name="gender">
							<option>선택하세요</option>
							<option value="M">남자</option>
							<option value="W">여자</option>
						</select>
					</div>
					<div class="col-12">
						<label for="birth" class="form-label">생년월일</label> <input
							type="text" name="birth" required="required" class="
							form-control" id="birth" placeholder="ex)19980514">
					</div>
					<div class="col-12">
						<label for="email" class="form-label">이메일</label>
						<div class="input-group" id="email">
							<input type="text" class="form-control" name="email">
							<div class="input-group-text">@</div>
							<select class="form-select" name="emaillast">
								<option>선택하세요</option>
								<option value="naver.com" >naver.com</option>
								<option value="google.com">google.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
						</div>
					</div>
					<div class="col-12">
						<label for="phone" class="form-label">전화번호</label> <input
							type="tel" name="phone" required="required" class="
							form-control" id="phone" placeholder="'-'없이 입력" pattern="[0-9]{11}">
					</div>
					<div class="col-12"  style="margin-bottom: 10px; text-align: center;">
						<br>
						   <input type="checkbox" name="chk()"><a href="signUpCheckPage" target="_blank" style="text-decoration: underline;  color: #4b70fd;">개인정보 수집 이용 및 약관</a> 동의합니다.
						<br>
					</div>
					<button type="submit" class="btn btn-danger btn-lg" style="margin-top: 50px;">회원가입</button>
					
				</form>
			</div>
		</div>
	</div>
    <!-- 여기 위로오 ============================================================ -->   
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>