<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/jh/chat.css">
<title>제주 감수광</title>
</head>
<body>
    <!-- 여기 밑으로 ============================================================ -->
	    <div class="chat_header">
	    	<i class="fa-solid fa-chevron-down" id="chat_hide" onclick="chatHide()"></i>
	    	<div class="header_info">
				<label id="roomId">${room.roomId }</label>
				<input type="hidden" id="roomName" value="${room.mem_num }">
				<div id="userName"></div>
	    	</div>
	    	<%-- <button onclick="chatOut(${mem_num})">나가기</button> --%>
	    	<i class="fa-solid fa-xmark" id="chat_out" onclick="chatOut(${mem_num})"></i>
	    </div>
		<div id="chatroom" class="container"> 
		
		</div>
		<div class="chat_input">
			<label class="send_box">	
				<input type = "text" class="msg" id="message" placeholder="내용을 입력하세요">
				<button onclick="send(${mem_num},${grade })" id="sendBtn">
					<i class="fa-solid fa-arrow-up"></i>
				</button>
			</label>
		</div>
    <!-- 여기 위로오 ============================================================ -->   
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	    var webSocket;
	    var nickname;
	    var roomId = $('#roomId').text();
	    /* <![CDATA[*/
	    
	    /* ]]> */
	    
	    $(function(){
	    	var mem_num = ${mem_num};
	    	$.ajax(
	    			{
	    				url:"/getUserName",
	    				data:{mem_num : mem_num},
	    				
	    				dataType:'text',
	    				success:function(data){
	    					nickname = data;
	    					$('#userName').text(data);
	    				}
	    			}
	    	);
	    	connect();
	    });
	    
	    function connect(){
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
	        var data = e.data.toString();
	        data = data.substring(1, data.length-1);
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
	    
		function chatHide() {
			$(".chat_window").css("display","none");
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