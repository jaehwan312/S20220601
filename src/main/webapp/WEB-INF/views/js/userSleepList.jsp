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
    	 <div class="loginTitle">
            <h1>휴면회원 조회</h1>
         </div>
			<div class="table-responsive">
				<table class="table table-striped table-sm"> 
					<tr><th>회원번호</th><th>아이디</th><th>이름</th><th>전화번호</th><th>이메일</th><th>회원등급</th></tr>
					<c:forEach var="profile" items="${profileList}">
						<tr><td>${profile.mem_num }</td>
						    <td>${profile.id}</td>
						    <td>${profile.name }</td><td>${profile.phone }</td><td>${profile.email }</td>
						    <td><c:if test="${profile.grade == 3}">휴면회원</c:if></td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="userSleepList?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="userSleepList?currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="userSleepList?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
				</c:if>
			</div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript"  src="js/js/loginPage.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>