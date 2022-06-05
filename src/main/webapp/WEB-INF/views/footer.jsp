<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="css/main.css">
	<title>제주 감수광</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
<body class="main_container">
	<div class="icon_frame">
    	<img id="msg_icon" alt="msg_icon" src="images/jh/msg_icon.png" onclick="chatOpen()">
    </div>
    <div class="chat_window">
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
	<footer>
        <div>
		    <h1>(주)제주감수광</h1>
		    <h2>대표 : 황재환 이재준 하병헌 김정수 권재인 김인헌</h2>
		    <h2>주소 : 서울 마포구 신촌로 176 중앙빌딩 5층 (우)04104</h2>
		</div>
        <div>
		    <h2>고객센터</h2> 
            <ul>
		        <li>공지사항</li>
		        <li>이용약관</li>
                <li>자주 묻는 질문(FAQ)</li>
		    </ul>
		</div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>