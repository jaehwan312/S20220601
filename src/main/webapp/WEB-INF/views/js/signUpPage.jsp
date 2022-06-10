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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>제주 감수광</title>
<style type="text/css">
	.id_ok{color:#6A82FB; display: none; margin: 5px;}
	.id_already{color:#FF0000; display: none; margin: 5px;}
</style>
</head>
<script type="text/javascript">

		//ajax 아이디 체크
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
		
		// 아이디 특수문자 및 한글 입력 방지
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
		
	
		
		// 이미지 미리보기
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
		
		function auth_btn(){
			 var email = $('#email').val();
	    	 
	    	 if(email == ''){
	    	 	alert("이메일을 입력해주세요.");
	    	 	return false;
	    	 }
	    		$.ajax({
				type : "POST",
				url : "/emailAuth",
				data : {email : email},
				success: function(data){
					alert("인증번호가 발송되었습니다.");
					email_auth_cd = data;
				},
				error: function(data){
					alert("메일 발송에 실패했습니다.");
				}
			});  
		}; 	
		

		 	
		 	var email_auth_cd = '';
		 			
				  function join() {
			
					
					if($('#id').val() == ""){
						alert("아이디를 입력해주세요.");
						return false;
					}
					
					
					if($('#pw').val() == ""){
						alert("비밀번호를 입력해주세요.");
						return false;
					}
					
					if($('#pw').val() != $('#pwCheck').val()){
						alert("비밀번호가 일치하지 않습니다.");
						return false;
					}
					
					if($('#name').val() == ""){
						alert("이름을 입력해주세요.");
						return false;
					}
					
					if($('#gender').val() == ""){
						alert("성별을 선택해주세요.");
						return false;
					}
					
					if($('#birth').val() == ""){
						alert("생년월일을 입력해주세요.");
						return false;
					}
					
					if($('#phone').val() == ""){
						alert("전화번호를 입력해주세요.");
						return false;
					}
					
					if($('#email').val() == ""){
						alert("이메일을 입력해주세요.");
						return false;
					}
					
					if($('#email_auth_key').val() == ""){
						alert("인증번호를 넣어주세요.");
						return false;
					}
					
					if($('#email_auth_key').val() != email_auth_cd){
						alert("인증번호가 일치하지 않습니다.");
						return false;
					} 

					if(!$("input:checked[id='agree']").is(":checked")){
						alert("개인정보 수집 이용 및 약관에 동의하셔야 가입이 가능합니다.");
						 document.getElementById("agree").focus();
						return false;
					}
					
						
				}; 
			
		
	
</script>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
	<div class="row py-lg-5">
			<div class="col-lg-5 col-md-5 mx-auto">
				<h1 class="fw-bolder" style="text-align: center;">회원가입</h1>
				<c:if test="${msg!=null}">${msg}</c:if>
				<form class="row g-3" action="signUp" method="post" enctype="multipart/form-data">
					<div style="text-align: center;">
	    				<tr>
							<td><img  id="preview" width="80%" style="width: 250px; height: 250px; margin: 10px;"/></td>
						</tr>
						<tr>
							<td><input class="form-control" type="file" name="profilePhoto" id="photo"	
							onchange="readURL(this);" accept="images/js/*"></td>
						</tr>
					</div>
					
					
					<div class="col-12" style="margin-bottom: 0px">
						<label for="id" class="form-label">아이디</label>
					    <input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력해주세요"  
					  		 autocomplete="off" maxlength="10" oninput = "checkId()" 
					  		 onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
					</div>
					   <span class="id_ok" style="margin: 0px">사용 가능한 아이디입니다.</span>
					   <span class="id_already" style="margin: 0px">누군가 이 아이디를 사용중입니다.</span>
					
					<div class="col-12">
						<label for="passwd" class="form-label">비밀번호</label> 
						<input type="password" name="pw" class="form-control" id="pw" placeholder="4~12자의 영문 대소문자와 숫자로만 입력" maxlength="12">
					</div>
					<div class="col-12">
						<label for="pwCheck" class="form-label">비밀번호 확인</label>
					    <input type="password" class="form-control" id="pwCheck" placeholder="비밀번호 확인" maxlength="12" >
					</div>
					<div class="col-md-6">
						<label for="name" class="form-label">이름</label>
						<input type="text" name="name" class="form-control" id="name" maxlength="20">
					</div>
					<div class="col-md-6">
						<label for="gender" class="form-label">성별</label> 
						<select id="gender" class="form-select" name="gender">
							<option value="" selected="selected">선택하세요</option>
							<option value="M">남자</option>
							<option value="W">여자</option>
						</select>
					</div>
					<div class="col-12">
						<label for="birth" class="form-label">생년월일</label> 
						<input type="text" name="birth" class="form-control" id="birth" placeholder="ex)19980514">
					</div>
					<div class="col-12">
						<label for="phone" class="form-label">전화번호</label> 
						<input type="tel" name="phone" class="form-control" id="phone" placeholder="'-'없이 입력" pattern="[0-9]{11}">
					</div>
					<div class="col-12">
						<label for="email" class="form-label">이메일</label>
						<input type="text" placeholder="이메일을 입력해주세요" name="email" id="email" class="form-control">
						<button type="button" id="email_auth_btn" class="btn btn-danger" style="float: right;" onclick="auth_btn()">인증번호 받기</button>
					</div>
					<div class="col-12"  style="margin-top: 0px;">
						<label for="email_auth_key" class="form-label" >인증번호</label>
						<input type="text" placeholder="인증번호 입력" id="email_auth_key" class="form-control">
					</div>
					
					
					<div class="col-12"  style="margin-bottom: 10px; text-align: center;">
						<br>
						   <input type="checkbox" name="agree" id="agree" value="Y"><a href="signUpCheckPage" target="_blank" style="text-decoration: underline;  color: #4b70fd;">개인정보 수집 이용 및 약관</a> 동의합니다.
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