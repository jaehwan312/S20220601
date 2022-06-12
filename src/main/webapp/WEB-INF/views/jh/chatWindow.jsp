<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
</body>
</html>