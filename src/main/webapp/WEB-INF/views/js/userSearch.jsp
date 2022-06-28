<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/template.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<script type="text/javascript">
	function search_check(num) {
			if (num == '1') {
				document.getElementById("searchPw").style.display = "none";
				document.getElementById("searchId").style.display = "";	
			} else {
				document.getElementById("searchId").style.display = "none";
				document.getElementById("searchPw").style.display = "";
			}
		}

	// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/SearchId?name="+$('#name').val()+"&phone="+$('#phone').val(),
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
				}
			}
		});
	}
	
	var pwSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/SearchPw?id="+$('#id').val()+"&email="+$('#email').val(),
			success:function(cnt){
				if(cnt == 0){
					alert("아이디 또는 이메일을 확인해주세요.");
				} else {
					alert("메일로 임시비밀번호가 전송 되었습니다.");
				}
			}
		});
	}



	$(document).ready(function() {
		// 1. 모달창 히든 불러오기
		$('#searchBtn').click(function() {
			$('#background_modal').show();
		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			$('#background_modal').hide();
		});
		// 3. 모달창 윈도우 클릭 시 닫기
		$(window).on('click', function() {
			if (event.target == $('#background_modal').get(0)) {
	            $('#background_modal').hide();
	         }
		});
	});
</script>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    <%@ include file="/WEB-INF/views/js/userIdSearchModal.jsp"%>
	<div class="full">
		<div class="container" style=" display: flex;  justify-content: center;  align-items: center;  min-height: 60vh;">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-black" style="z-index: 2;">
					<h3>아이디/비밀번호 찾기</h3>
					<p>회원가입시 등록한 이메일로 찾기가 가능합니다</p>
					<hr>
				</div>
				<div style="margin-bottom: 10px;" class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-black"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchId">
					<div class="form-group">	
						<label class="form-label" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="name" name="name" placeholder="ex)홍길동">
						</div>
					</div>
					<div class="form-group">
						<label class="form-label" for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="phone" name="phone" placeholder="ex) 01011111111">
						</div>
					</div>
					<div class="form-group" style="margin-top: 10px;">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
						<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				<div id="searchPw" style="display: none;">
					<div class="font-weight-bold text-black">
						<label class="form-label" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="id" name="id" placeholder="ex)admin">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="email"	name="email" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group" style="margin-top: 10px;">
						<button id="searchBtn2" type="button" class="btn btn-primary btn-block" onclick="pwSearch_click()">확인</button>
						<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>