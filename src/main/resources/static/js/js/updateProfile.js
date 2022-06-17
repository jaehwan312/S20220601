// 이미지 미리보기
		function readURL(input) {
			
//			alert('input.files[0]->'+input.files[0]);
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					// preview 라는 이미지의 값 세팅
					document.getElementById('preview').src = e.target.result;
				};
				// 실질적으로 파일을 화면에 보여주는 역할
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preview').src = "";
			}
		}
		
		function auth_btn(){
			 var email  = $('#email').val();
			 
	    	 if(email == ''){
	    	 	alert("이메일을 등록해주세요.");
	    	 	return false;
	    	 }
	    	 
			    		$.ajax({
						type : "POST",
						url : "/profileAuth",
						data : {email : email},
						success: function(data){
							alert("인증번호가 발송되었습니다.");
							email_auth_cd = data;
						},
						error: function(data){
							alert("메일 발송에 실패했습니다.");
						}
					}); 
		}; 	
		

		 	
		 	var email_auth_cd = '';
		 			
				  function join() {
			
					
					if($('#pw').val() == ""){
						alert("비밀번호를 입력해주세요.");
						return false;
					}
					
					if($('#pw').val() != $('#pwCheck').val()){
						alert("비밀번호가 일치하지 않습니다.");
						return false;
					}
					
					if($('#name').val() == ""){
						alert("이름을 입력해주세요.");
						return false;
					}
					
					if($('#gender').val() == ""){
						alert("성별을 선택해주세요.");
						return false;
					}
					
					if($('#birth').val() == ""){
						alert("생년월일을 입력해주세요.");
						return false;
					}
					
					if($('#phone').val() == ""){
						alert("전화번호를 입력해주세요.");
						return false;
					}
					
					if($('#email').val() == ""){
						alert("이메일을 입력해주세요.");
						return false;
					}
					
					if($('#email_auth_key').val() == ""){
						alert("이메일 인증을 하셔야 수정이 가능합니다.");
						return false;
					}
					
					if($('#email_auth_key').val() != email_auth_cd){
						alert("인증번호가 일치하지 않습니다.");
						return false;
					} 

					
				}; 