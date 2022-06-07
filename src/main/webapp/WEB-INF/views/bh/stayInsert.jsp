<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<div style="text-align: center; margin-top: 100px;">
    	<form action="" method="post" style="text-align: center;" enctype="multipart/form-data">
			<div>
				<div>
					<div id="preview"></div>
				</div>
				
				<div>
					<div class="insertPhoto">
						<c:forEach begin="0" end="4" varStatus="i">
		                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}">
		                       	 👉 CLICK HERE!👈 
								<input type="file" class="host_photo" id="inputInfo${i.index }" name="host_photo${i.index}" 
									onchange="previewFiles(${i.index })" accept="images/ih/*">
		                    </label>
		                </c:forEach>
      				</div>
				</div>
			</div>
			<input type="submit" value="등록요청">
    	</form>
    	</div>
    	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>