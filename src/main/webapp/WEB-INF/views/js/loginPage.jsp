<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/template.css">
<link rel="stylesheet" href="css/js/loginPage.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<title>제주 감수광</title>
</head>
<script type="text/javascript">
	function message() {
		var value2 = "${msg}";
		if(value2 != ""){
			alert(value2);
		}
	}
</script>
<body onload="message()">
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
	<div class="col-lg-3 col-md-8 mx-auto" style="align-items: center; padding: 100px 0px;">
	  <form action="loginCheck" name="form1" method="post" onsubmit="return logCheck()">
	 	 <div class="loginTitle">
            <h1>제주 감수광</h1>
        </div>
	    <div class="form-floating mb-3" style="margin-top: 10px;">
	      <input type="text" class="form-control" id="id" name="id" >
	      <label for="floatingInput">아이디</label>
	    </div>
	    <div class="form-floating mb-3">
	      <input type="password" class="form-control" id="pw" name="pw">
	      <label for="floatingPassword">비밀번호</label>
	    </div>
	    <c:if test="${message == 'error'}">
	    	<div style="color:red; text-align: center;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
	    </c:if>
	    <c:if test="${message == 'logout'}">
	    	<div style="color:red; text-align: center;"> 로그아웃되었습니다.</div>
	    </c:if>
	    <button class="w-100 btn btn-lg btn-primary mb-3" id="btnLogin" type="submit">로그인</button>
	    <button class="w-100 btn btn-lg btn-primary mb-3" type="button" onclick="location.href='signUpPage'">회원 가입
	    </button>
	    <div style="margin-bottom: 10px; text-align: center;">
		    <button type="button" class="btn btn-link btn-block" onclick="location.href='userSearch'">아이디/비밀번호 찾기</button>
	    </div>
	  	</form>	
		</div>
	</div>
	

    <!-- 여기 위로오 ============================================================ -->   
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript"  src="js/js/loginPage.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>