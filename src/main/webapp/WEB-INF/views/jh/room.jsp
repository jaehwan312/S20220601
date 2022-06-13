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
<title>제주 감수광</title>
</head>
<body>
	<%-- <%@ include file="../header.jsp" %> --%>
    <div class="container" onload="connect()">
    <!-- 여기 밑으로 ============================================================ -->
	    
	    <input type="hidden" id="nickname" value="${room.mem_num }">
		<label id="roomId" class="form-inline">${room.roomId }</label>
		<br>
		<label for="roomName" class="label label-default">방 이름</label>
		<label id="roomName" class="form-inline">${room.mem_num }</label>
		<div id = "chatroom" style = "overflow:auto; width:400px;  height: 600px; border:1px solid; background-color : gray"></div>
		<input type = "text" id = "message" style = "height : 30px; width : 340px" placeholder="내용을 입력하세요" autofocus>
		<button class = "btn btn-primary" id = "send">전송</button>
		<button class = "btn btn-primary" id = "close" onclick="onClose()">나가기</button>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%-- <%@ include file="../footer.jsp" %> --%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	    
	
	    var webSocket;
	    var nickname;
	    var roomId = $('#roomId').text();
	    /* <![CDATA[*/
	    
	    /* ]]> */
	    $(function(){
	    	connect();
	    });
	    
	    function connect(){
	    	nickname = document.getElementById("nickname").value;
	        webSocket = new WebSocket("ws://localhost:8908/chat");
	        webSocket.onopen = onOpen;
	        webSocket.onclose = onClose;
	        webSocket.onmessage = onMessage;
	    }
	    
	    function onOpen(){
	        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:nickname}));
	    }
	    
	    document.getElementById("send").addEventListener("click",function(){
	        send();
	    })
	    
	    function send(){
	        msg = document.getElementById("message").value;
	        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'CHAT',writer:nickname,message : msg}));
	        document.getElementById("message").value = "";
	    }

	    function onMessage(e){
	        data = e.data;
	        chatroom = document.getElementById("chatroom");
	        chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
	    }
	    function onClose(){
	        disconnect();
	    }
	    
	    function disconnect(){
	        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:nickname}));
	        webSocket.close();
	    }
	
	</script>
</body>
</html>