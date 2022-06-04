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
	<script type="text/javascript">
		function chatOpen() {
			$(".chat_window").css("display","block");
		}
		function chatHide() {
			$(".chat_window").css("display","none");
		}
		function chatOut() {
			$(".chat_window").css("display","none");
		}
		
		var ws;

		function chatName(){
			var userName = $("#userName").val();
			console.log("chatName  userName: " + userName);
			if(userName == null || userName.trim() == ""){
				alert("사용자 이름을 입력해주세요.");
				$("#userName").focus();
			}else{
				wsOpen();
				$("#meName").append(userName); 
				$("#yourName").hide();
			}
		}
		
		function wsOpen(){
			console.log("wsOpen  location.host: " + location.host);
	        var wsUri  = "ws://" + location.host + "${pageContext.request.contextPath}/chating";
	        // WebSocket 프로토콜을 사용하여 통신하기 위해서는 WebSocket객체를 생성. 
	        // 객체는 자동으로 서버로의 연결
	 		ws = new WebSocket(wsUri);
			wsEvt();
		}
			
		function wsEvt() {
			console.log("wsEvt  start... ");
			
			//소켓이 열리면 동작
			ws.onopen = function(data){
				console.log("wsEvt  소켓이 열리면 초기화 세팅하기..");
				}
			
			//메시지를 받으면 동작
			ws.onmessage = function(data) {
				
				var msg = data.data;
				var memberSave = false;
				if(msg != null && msg.trim() != ''){
					memberSave = false;
					// JSON 오브젝트를 자바스크립트 오브젝트로 변환
				    var jsonMsg = JSON.parse(msg);
					// msg가 배열이고, 2개이상의 Count이면 , member 등록 대상 
	                if (Array.isArray(jsonMsg)) {
	                	if (Object.keys(jsonMsg).length > 1) {
	                    	memberSave = true;
	                       	alert("JSONArray jsonMsg Count->"+ Object.keys(jsonMsg).length);
	                	}
	                }
					// 파싱한 객체의 type값을 확인하여 getId값이면 초기 설정된 값이므로 채팅창에 값을 입력하는게 아니라
					// 추가한 태그 sessionId에 값을 세팅
					if(jsonMsg.type == "getId"){
						var sid = jsonMsg.sessionId != null ? jsonMsg.sessionId : "";
						if(sid != ''){
							$("#sessionId").val(sid); 
							// session User 등록 수행
							sendUser('Create');
						}
					}else if(jsonMsg.type == "message"){
						// type이 message인 경우엔 채팅이 발생한 경우.
		                // 상대방과 자신을 구분하기 위해 여기서 sessionId값을 사용
		                // 최초 이름을 입력하고 연결되었을때, 발급받은 sessionId값을 비교하여 같다면 자기 자신이 발신한
		                // 메시지이므로 오른쪽으로 정렬하는 클래스를 처리하고 메시지를 출력.     
		                // 비교하여 같지 않다면 타인이 발신한 메시지이므로 왼쪽으로 정렬하는 클래스를 처리하고 메시지를 출력
						if(jsonMsg.sessionId == $("#sessionId").val()){
							$("#chating").append("<p class='me'>나 :" + jsonMsg.msg + "</p>");	
						}else{
							$("#chating").append("<p class='others'>" + jsonMsg.userName + " :" + jsonMsg.msg + "</p>");
						}
					}else if(memberSave == true){
						alert("userSave");
						$('#member_sub').remove();
						//  memberSave = true 면  -->	User 등록/삭제 일경우
						// div로 감싸주면 재정의시 삭제(Refresh)후 다시 생성 
						//var str = " <div id='member_sub' class='member_sub'> ";
						var str = " ";
						str  += " <select name='member' id='member_sub' class='member_sub'> ";
						str  += " <option value='ALL'>전체 </option> "; 
						$(jsonMsg).each(
							function(){
								var str2 = "";
					            // User를 선택하여 message전송 가능토록 member에 등록 
								if(jsonMsg.sessionId == $("#sessionId").val()){
									alert("내꺼임"+ $("#sessionId").val())
								} else {  // 타인 session일 경우 추가 등록 
									str2 += " <option value='"+this.sessionId + "'> "+this.userName  + "</option> "; 
									str  += str2 ;
								}
							}
						);
						str += " </select>"
						str += " </div><p>"
						$('#member').append(str);	
						memberSave = false;
						
					}else{
							console.warn("unknown type!");
					}
				}
			}

			document.addEventListener("keypress", function(e){
				if(e.keyCode == 13){ //enter press
					send();
				}
			});
		}
		// User 등록  Message 전송       saveStatus --> Create / Delete
		function sendUser(saveStatus) {
			
			var userOption ={
					type       : "userSave",
					sessionId  : $("#sessionId").val(),
					userName   : $("#userName").val(),
					saveStatus : saveStatus
				}
			// 자바스크립트의 값을 JSON 문자열로 변환
			ws.send(JSON.stringify(userOption));
		}
		// 전체 Message 전송 
		function send() {
			var option ={
				type: "message",
				sessionId : $("#sessionId").val(),
				userName : $("#userName").val(),
				yourName : $("#member_sub").val(),
				msg : $("#chatting").val()
			}
			// 자바스크립트의 값을 JSON 문자열로 변환
			ws.send(JSON.stringify(option));
			$('#chatting').val("");
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