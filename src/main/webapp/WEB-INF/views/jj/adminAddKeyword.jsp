<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/jj/keywordPage.css">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
	<div class="col-8 mx-auto">
	<h2 class="adminTitle">추천검색어 관리</h2>
	
	<form action="" id="keywordInsert">
		<div class="input-group mb-3">
		    <input id="keywordInsert" type="text" class="form-control" placeholder="추천검색어를 입력하세요" style="width: 50%;">
			<select class="form-select" aria-label="Default select example">
			  <option selected>우선순위</option>
			  <option value="1">1순위</option>
			  <option value="2">2순위</option>
			  <option value="3">3순위</option>
			</select>
			<button class="btn btn-primary" type="button">입력 완료</button>
	    </div>
    </form>
	
	<table class="table table-striped table-hover" style="vertical-align: middle;">
        <thead>
        <tr class="table-primary">
            <th>우선순위</th>
            <th>키워드</th>
            <th>등록일자</th>
            <th>변경</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        	<td>1</td>
        	<td>브라운스위트</td>
        	<td>2022-06-27</td>
        	<td>
        		<button class="btn btn-primary btn-sm" type="button">수정</button>
            	<button class="btn btn-primary btn-sm" type="button">삭제</button>
        	</td>
        </tr>
        </tbody>
    </table>
    </div>

	<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>