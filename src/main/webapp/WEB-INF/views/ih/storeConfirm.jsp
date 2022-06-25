	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/ih/confirm.css">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
	<div class="col-8 mx-auto">
	<form action="storeConfirm" id="storeConfirm">
	</form>
	<h2 class="adminTitle">식당 등록 관리</h2>
	
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
        <c:forEach var="store" items="${storeList }" varStatus="i">
        <tr class="listRow" id="listRow${i.index }">
        	<td onclick="location.href='storeRead?host_num=${store.host_num}'">${num }</td>
        	<td onclick="location.href='storeRead?host_num=${store.host_num}'">${store.host_name }</td>
        	<td onclick="location.href='storeRead?host_num=${store.host_num}'">${store.host_addr }</td>
        	<td onclick="location.href='storeRead?host_num=${store.host_num}'">${store.food_type }</td>
        	<td>
        		<div class="row col-12">
        		<div class="col-6">
        			<button class="btn btn-primary btn-sm col-12" type="button" onclick="storeApprove(${store.host_num })">승인</button>
        		</div>
        		<div class="col-6">
            		<button class="btn btn-primary btn-sm col-12" type="button" onclick="storeReject(${store.host_num })">거절</button>
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
		      <a class="page-link" href="storeConfirm?currentPage=${pg.startPage-pg.pageBlock}">이전</a>
		    </li>
		</c:if>
		<c:if test="${pg.startPage <= pg.pageBlock }">
	  		<li class="page-item disabled">
		      <a class="page-link" href="storeConfirm?currentPage=${pg.startPage-pg.pageBlock}">이전</a>
		    </li>
		</c:if>
	    <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			<c:if test="${currentPage==i }">
				<li class="page-item active" aria-current="page">
			      <a class="page-link" href="storeConfirm?currentPage=${i}">${i }</a>
			    </li>
		    </c:if>
		    <c:if test="${currentPage!=i }">
				<li class="page-item">
			      <a class="page-link" href="storeConfirm?currentPage=${i}">${i }</a>
			    </li>
		    </c:if>
		</c:forEach>
	    <c:if test="${pg.endPage < pg.totalPage }">
	    	<li class="page-item">
		      <a class="page-link" href="storeConfirm?currentPage=${pg.startPage+pg.pageBlock}">다음</a>
		    </li>
	    </c:if>
	    <c:if test="${pg.endPage >= pg.totalPage }">
	    	<li class="page-item disabled">
		      <a class="page-link" href="storeConfirm?currentPage=${pg.startPage+pg.pageBlock}">다음</a>
		    </li>
	    </c:if>
	  </ul>
	</nav>
    
    </div>

	<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="js/ih/storeConfirm.js"></script>
</body>
</html>