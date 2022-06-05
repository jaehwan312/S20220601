<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="css/main.css">
	<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
	<title>제주 감수광</title>
	<script src="js/jh/chat.js" defer></script>
	<script type="text/javascript">
		function wsOpen(){
			console.log("wsOpen  location.host: " + location.host);
	        var wsUri  = "ws://" + location.host + "${pageContext.request.contextPath}/chating";
	        // WebSocket 프로토콜을 사용하여 통신하기 위해서는 WebSocket객체를 생성. 
	        // 객체는 자동으로 서버로의 연결
	 		ws = new WebSocket(wsUri);
			wsEvt();
		}
	</script>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
	<br>
	<br>
	<br>
	<div class="chatAd_window">
    	<div class="chat_header">
    		<input type="hidden" id="sessionId" value="">
    		<i class="fa-solid fa-chevron-down" id="chat_hide" onclick="chatHide()"></i>
    		<div id="meName"></div>
    		<div id="member" class="member"></div>
    		<div id="yourName">
    			<input type="text" name="userName" id="userName">
	    		<button onclick="chatName()" id="startBtn">
	    			<i class="fa-solid fa-user"></i>
	    		</button>
    		</div>
			<i class="fa-solid fa-xmark" id="chat_out" onclick="chatOut()"></i>
    	</div>
    	<div id="chating" class="chating">
    	</div>
    	<div class="chat_input">
    		<input class="chat_msg" id="chatting" placeholder="메시지를 입력하세요.">
    		<button onclick="send()" id="sendBtn">
    			<i class="fa-solid fa-paper-plane"></i>
    		</button>
    	</div>
    </div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>