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
<link rel="stylesheet" href="css/jj/confirm.css">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
	<div id="page-wrapper">
			<%@ include file="../sideBar.jsp"%>
			<!-- 본문 -->
			<div id="content-wrapper">
	
	
	<div class="col-12 mx-auto">
	<form action="stayConfirm" id="stayConfirm">
	</form>
	<h2 class="adminTitle">숙소 등록 관리</h2>
	
	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
	
	<table class="table table-striped table-hover" id="tableSet">
        <thead>
        <tr class="table-primary">
            <th>번호</th>
            <th style="width: 20%;">업체명</th>
            <th style="width: 30%;">주소</th>
            <th style="width: 15%;">숙소 분류</th>
            <th>승인관리</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="stay" items="${stayList }" varStatus="i">
        <tr class="listRow" id="listRow${i.index }">
        	<td onclick="location.href='stayRead?host_num=${stay.host_num}'">${num }</td>
        	<td onclick="location.href='stayRead?host_num=${stay.host_num}'">${stay.host_name }</td>
        	<td onclick="location.href='stayRead?host_num=${stay.host_num}'">${stay.host_addr }</td>
        	<td onclick="location.href='stayRead?host_num=${stay.host_num}'">${stay.type_name }</td>
        	<td>
        		<div class="row col-12">
        		<div class="col-6">
        			<button class="btn btn-primary btn-sm col-12" type="button" onclick="stayApprove(${stay.host_num })">승인</button>
        		</div>
        		<div class="col-6">
            		<button class="btn btn-primary btn-sm col-12" type="button" onclick="stayReject(${stay.host_num })">거절</button>
            	</div>
            	</div>
        	</td>
        </tr>
        <c:set var="num" value="${num - 1 }"></c:set>
        </c:forEach>
        </tbody>
    </table>
    
    <nav id="paging">
	  <ul class="pagination">
	  	<c:if test="${pg.startPage > pg.pageBlock }">
	  		<li class="page-item">
		      <a class="page-link" href="stayConfirm?currentPage=${pg.startPage-pg.pageBlock}">이전</a>
		    </li>
		</c:if>
		<c:if test="${pg.startPage <= pg.pageBlock }">
	  		<li class="page-item disabled">
		      <a class="page-link" href="stayConfirm?currentPage=${pg.startPage-pg.pageBlock}">이전</a>
		    </li>
		</c:if>
	    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			<c:if test="${currentPage==i }">
				<li class="page-item active" aria-current="page">
			      <a class="page-link" href="stayConfirm?currentPage=${i}">${i }</a>
			    </li>
		    </c:if>
		    <c:if test="${currentPage!=i }">
				<li class="page-item">
			      <a class="page-link" href="stayConfirm?currentPage=${i}">${i }</a>
			    </li>
		    </c:if>
		</c:forEach>
	    <c:if test="${pg.endPage < pg.totalPage }">
	    	<li class="page-item">
		      <a class="page-link" href="stayConfirm?currentPage=${pg.startPage+pg.pageBlock}">다음</a>
		    </li>
	    </c:if>
	    <c:if test="${pg.endPage >= pg.totalPage }">
	    	<li class="page-item disabled">
		      <a class="page-link" href="stayConfirm?currentPage=${pg.startPage+pg.pageBlock}">다음</a>
		    </li>
	    </c:if>
	  </ul>
	</nav>
    
    </div>
    </div>
    </div>

	<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/jj/stayConfirm.js"></script>
</body>
</html>