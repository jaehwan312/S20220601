<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(function() {
	$("#btnLogin").click(function() {
		id=$("#id").val();
		var pw=$("#pw").val(); 
		if(id == ""){
			alert("아이디를 입력하세요");
			$("#id").focus(); 
			
			return;
		}
		if(pw == ""){
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return;
		}
	
		
	  });	
	});

</script>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
	<div class="col-lg-3 col-md-8 mx-auto" style="align-items: center; padding: 100px 0px;">
	  <form action="loginCheck" name="form1" method="post">
	    <div class="form-floating" style="margin-top: 10px;">
	      <input type="text" class="form-control" id="id" name="id" >
	      <label for="floatingInput">아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="pw" name="pw">
	      <label for="floatingPassword">비밀번호</label>
	    </div>
	    <button class="w-100 btn btn-lg btn-danger" id="btnLogin" type="submit" style="margin-top: 10px;">로그인</button>
	    <c:if test="${message == 'error'}">
	    	<div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
	    </c:if>
	    <c:if test="${message == 'logout'}">
	    	<div style="color:red;"> 로그아웃되었습니다.</div>
	    </c:if>
	    <button class="w-100 btn btn-lg btn-danger" type="button" style="margin-top: 10px;" 
	    	    onclick="location.href='signUpPage'">회원 가입
	    </button>
	    <div style="margin-bottom: 10px; text-align: center;">
		    <button type="button" class="btn btn-link btn-block" style="margin-top: 10px;"
		            onclick="location.href=' '">아이디 찾기</button>
		    <button type="button" class="btn btn-link btn-block" style="margin-top: 10px;"
		            onclick="location.href=' '">비밀번호 찾기</button>
	    </div>
	  	</form>	
		</div>
	</div>
	

    <!-- 여기 위로오 ============================================================ -->   
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>