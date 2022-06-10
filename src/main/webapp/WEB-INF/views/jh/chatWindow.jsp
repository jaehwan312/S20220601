<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="css/template.css">
	<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
	<!-- <script src="https://kit.fontawesome.com/a42e829aa0.js" crossorigin="anonymous"></script> -->
	<script src="js/jh/chat.js" defer></script>
	<script type="text/javascript">
		var ws;
		
		function wsOpen(){
	        var wsUri  = "ws://" + location.host + "${pageContext.request.contextPath}/chating";
	        // WebSocket 프로토콜을 사용하여 통신하기 위해서는 WebSocket객체를 생성. 
	        // 객체는 자동으로 서버로의 연결
	 		ws = new WebSocket(wsUri);
			wsEvt();
		}
	</script>
	<title>제주 감수광</title>
</head>
<body>
    <div class="icon_frame">
    	<img id="msg_icon" alt="msg_icon" src="images/jh/msg_icon.png" onclick="chatOpen(${mem_num})">
    </div>
    <div class="chat_window">
    	<div class="chat_header">
    		<input type="hidden" id="sessionId" value="">
    		<i class="fa-solid fa-chevron-down" id="chat_hide" onclick="chatHide()"></i>
    		<div id="meName"></div>
    		<div id="member" class="member" style="display:none;"></div>
			<i class="fa-solid fa-xmark" id="chat_out" onclick="chatOut(${mem_num})"></i>
    	</div>
    	<div id="chatting" class="chatting">
    	</div>
    	<div class="chat_input">
    		<input class="chat_msg" id="chat_msg" placeholder="메시지를 입력하세요.">
    		<button onclick="send(${mem_num}, ${grade})" id="sendBtn">
    			<i class="fa-solid fa-paper-plane"></i>
    		</button>
    	</div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
</body>
</html>