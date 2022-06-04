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