<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/template.css">
<title>제주 감수광</title>
</head>
<body>
    <!-- 여기 밑으로 ============================================================ -->
	    <div id="userName"></div>
	    <input type="hidden" id="nickname" value="${room.mem_num }">
		<label id="roomId" class="form-inline">${room.roomId }</label>
		<label for="roomName" class="label label-default">방 이름</label>
		<label id="roomName" class="form-inline">${room.mem_num }</label>
		<div id = "chatroom" style = "overflow:auto; width:400px;  height: 600px; border:1px solid; background-color : gray"></div>
		<input type = "text" id = "message" style = "height : 30px; width : 340px" placeholder="내용을 입력하세요" autofocus>
		<button class = "btn btn-primary" onclick="send(${mem_num},${grade })">전송</button>
		<button class = "btn btn-primary" onclick="chatOut(${mem_num})">나가기</button>
    <!-- 여기 위로오 ============================================================ -->   
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
	    
	    function send(mem_num, grade){
	        msg = document.getElementById("message").value;
	        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'CHAT',writer:nickname,message : msg}));
 	        $.ajax(
					{
						url:"/insertChat",
						type:'post',
						data:{mem_num : mem_num, grade : grade, msg : $("#message").val()}
					}
			);
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
	    
	    function chatOut(mem_num) {
			if (confirm("채팅창을 나가시면 채팅 내용이 전부 삭제됩니다. 채팅창을 나가시겠습니까?")){
				$.ajax(
						{
							url:"/deleteChat",
							data:{mem_num : mem_num},
							
							success:function(){
								$(".chat_window").css("display","none");
							}
						}
				);
			} else {
				return false;
			}
		}
	</script>
</body>
</html>