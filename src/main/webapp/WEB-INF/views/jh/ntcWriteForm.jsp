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
    
    <div class="contents">
    	<form action="ntcWrite" method="post" enctype="multipart/form-data">
    		<input type="hidden" name="mem_num" value="${mem_num}">
   	    	<div class="input-group mb-3">
	    		<div class="input-group-text title" id="inputGroup-sizing-default">제목</div>
				<input type="text" name="n_title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
	    	</div>
	   		<div class="input-group mb-3 content">
				<div class="input-group-text title">글내용</div>
				<textarea class="form-control" name="n_content" aria-label="With textarea"></textarea>
			</div>
		    
			<div class="content_btn_div">
		    	<button type="button" class="btn btn-outline-primary" onclick="location.href='ntcList'">목록</button>
		    	<div>
		    		<c:if test="${grade=='1'}">
		    			<button type="submit" class="btn btn-outline-primary">확인</button>
		    		</c:if>
		    	</div>
		    </div>
    	</form>
    </div>

    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript">
		function chk(){
			let check = confirm("정말로 삭제하시겠습니까?");
			if(check==true){
				location.href="ntcDelete?n_num=${ntc.n_num }";
			}
		}
	</script>
</body>
</html>