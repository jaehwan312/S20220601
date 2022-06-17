//ajax 아이디 체크
		function checkId(){
		    var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
		  
		    $.ajax({
		        url:'idCheck', //Controller에서 인식할 주소
		        type:'post', //POST 방식으로 전달
		        data:{id:id},
		        success:function(cnt){	// 컨트롤러에서 넘어온 cnt 값 받음
		        if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
		            $('.id_ok').css("display","inline-block"); 
		            $('.id_already').css("display", "none");
		        } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
		            $('.id_already').css("display","inline-block");
		            $('.id_ok').css("display", "none");
		        }
		        },
		        error:function(){
		            alert("에러입니다");
		        }
		    });
		};
		
		// 아이디 특수문자 및 한글 입력 방지
		function characterCheck(obj){
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
		var regExp1 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		// 허용할 특수문자 및 한글은 여기서 삭제
		// 띄어쓰기도 특수문자 처리됨
		if( regExp.test(obj.value) ){
			alert("특수문자 및 띄워쓰기는 입력하실수 없습니다.");
			obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
			}
		else if( regExp1.test(obj.value) ){
			alert("한글은 입력하실수 없습니다.");
			obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 한글,띄어쓰기 한자리 지움
			}
		}
		
	
		
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
			 var email = $('#email').val();
	    	 
	    	 if(email == ''){
	    	 	alert("이메일을 입력해주세요.");
	    	 	return false;
	    	 }
	    		$.ajax({
				type : "POST",
				url : "/emailAuth",
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
			
					
					if($('#id').val() == ""){
						alert("아이디를 입력해주세요.");
						return false;
					}
					
					
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
						alert("인증번호를 넣어주세요.");
						return false;
					}
					
					if($('#email_auth_key').val() != email_auth_cd){
						alert("인증번호가 일치하지 않습니다.");
						return false;
					} 

					if(!$("input:checked[id='agree']").is(":checked")){
						alert("개인정보 수집 이용 및 약관에 동의하셔야 가입이 가능합니다.");
						 document.getElementById("agree").focus();
						return false;
					}
					
					alert("회원가입에 성공했습니다!")	
				};