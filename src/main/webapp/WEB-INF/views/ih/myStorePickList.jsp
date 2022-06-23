<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	픽미픽미 
	    <c:if test="${size != 0 }">
	        <c:forEach items="${myStorePickList }" var="list">
	    	
	    	${list.host_name }
	    	
	    	</c:forEach>
    	</c:if>
    	<c:if test="${size == 0 }">
			등록한 업체가 없습니다.
    	</c:if>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
</body>
</html>