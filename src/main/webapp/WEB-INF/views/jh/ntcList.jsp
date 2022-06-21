<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/jh/csCenter.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    <h2 class="notice">공지사항</h2>
    <hr class="horizontal_rule">
    <c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
    <table 	class="table table-striped table-hover">
    	<thead class="table-primary">
    		<tr>
    			<td>No.</td>
    			<td>제목</td>
    			<td>작성일</td>
    			<td>조회수</td>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="ntcList" items="${ntcList}">
    		<tr>
    			<td>${num}</td>
    			<td>${ntcList.n_title}</td>
    			<td>${ntcList.n_date}</td>
    			<td>${ntcList.n_view}</td>
    		</tr>
    		<c:set var="num" value="${num -1 }"></c:set>
    		</c:forEach>
    	</tbody>
    </table>
    <div class="pg_div">
    	<c:if test="${pg.startPage > pg.pageBlock }">
			<a href="list?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
			<a href="list?currentPage=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${pg.endPage < pg.totalPage }">
			<a href="list?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
		</c:if>
    </div>
   	<div class="btn_div">
        <c:if test="${grade=='1'}">
	    	<button type="button" class="btn btn-outline-primary" id="csc_write_btn" onclick="location.href=''">글쓰기</button>
			<!-- <button type="button" class="btn btn-outline-secondary" onclick="location.href='cscInsert.do" style="margin-bottom: 10px;">글쓰기</button> -->
		</c:if>
    </div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
</body>
</html>