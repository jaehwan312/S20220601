<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/jh/chat.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
	<div id="page-wrapper">
			<%@ include file="../sideBar.jsp"%>
			<!-- 본문 -->
		<div id="content-wrapper">
			<h2 class="csc_chat">1:1 채팅 문의 내역</h2>
    		<hr class="horizontal_rule">
		    <table class="table table-striped table-hover">
		        <thead>
		        <tr class="table-primary">
		            <th>이름</th>
		            <th>메시지</th>
		            <th>등록시간</th>
		            <th>답변</th>
		        </tr>
		        </thead>
		        <tbody>
		        <c:forEach var="room" items="${rooms }">
		        <tr>
		        	<td>${room.name }</td>
		            <td>${room.msg}</td>
		            <td>${room.msg_time}</td>
		            <td>
		            	<form action="chatEnter">
		            		<input type="hidden" name="id" value="${room.roomId}">
		            		<button class = "btn btn-primary pull-right" type="submit">답변하기</button>
		            	</form>
		            </td>
		        </tr>
		        </c:forEach>
		        </tbody>
		    </table>
		 </div>
		 </div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/jh/chat.js" defer></script>
</body>
</html>