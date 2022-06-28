		//ajax 핸드폰 번호 체크
		function checkPhonek(){
		    var phone = $('#phone').val(); //phone값이 "phone"인 입력란의 값을 저장
		     
		    if( phone.length == 11){ 
			$.ajax({
			    url:'phoneCheck',   //Controller에서 인식할 주소
			    type:'post', 		//POST 방식으로 전달
			    data:{phone: phone},
			    success:function(cnt){	// 컨트롤러에서 넘어온 cnt 값 받음
				    if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 핸드폰 
				        $('.phone_ok').css("display","inline-block"); 
				        $('.phone_already').css("display", "none");
				    } else { // cnt가 1일 경우 -> 이미 존재하는 핸드폰
				    	alert("중복된 핸드폰번호 입니다.")
				        $('.phone_already').css("display","inline-block");
				        $('.phone_ok').css("display", "none");
				    }
				    },
				    error:function(){
				        alert("에러입니다");
				    }
			});
			} else if(phone.length > 0 && phone.length != 11){
				$('.phone_already').css("display","inline-block");
				$('.phone_ok').css("display", "none");
				return false;
			}
		
		};
	
		//핸드폰 영어 특수문자 및 한글 입력 방지
		function phoneCheck(obj){
			var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
			var regExp1 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			var regExp2 = /[A-za-z]/g; 
			// 허용할 특수문자 및 한글은 여기서 삭제
			// 띄어쓰기도 특수문자 처리됨
				if( regExp.test(obj.value) ){
					alert("특수문자 및 띄워쓰기는 입력하실수 없습니다.");
					obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
					checkPhonek();
					}
				else if( regExp1.test(obj.value) ){
					alert("한글은 입력하실수 없습니다.");
					obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 한글,띄어쓰기 한자리 지움
					checkPhonek();
					}
				else if( regExp2.test(obj.value) ){
					alert("영어는 입력하실수 없습니다.");
					obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 영어 한자리 지움
					checkPhonek();
				}	
				else if(obj.value.length > 11  ){
					alert("전화번호는 11자리 이하로 입력해주세요.");
					obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 영어 한자리 지움
					checkPhonek();
				}
				
		};

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
				checkId();
				}
			else if( regExp1.test(obj.value) ){
				alert("한글은 입력하실수 없습니다.");
				obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 한글,띄어쓰기 한자리 지움
				checkId();
			}
		}
		
		// 회원가입 이름 한글만 입력 가능하도록
		function nameCheck(obj){
			var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
			var regExp1 = /^[0-9]+$/;
			var regExp2 = /[A-za-z]/g; 
				if( regExp.test(obj.value) ){
					alert("특수문자 및 띄워쓰기는 입력하실수 없습니다.");
					obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
					}
				else if( regExp1.test(obj.value) ){
					alert("숫자는 입력하실수 없습니다.");
					obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 한글,띄어쓰기 한자리 지움
					}
				else if( regExp2.test(obj.value) ){
					alert("영어는 입력하실수 없습니다.");
					obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 영어 한자리 지움
					}
			    else if( obj.value.length > 6){
			    	alert("이름은 6글자를 넘을수 없습니다");
			    	obj.value = obj.value.substring( 0 , obj.value.length - 1 );
			    	}
		}
		
		// 회원가입 생년월일 숫자만 입력 가능하도록
		function birthCheck(obj){
			var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
			var regExp1 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			var regExp2 = /[A-za-z]/g; 
			
				if( regExp.test(obj.value) ){
					alert("특수문자 및 띄워쓰기는 입력하실수 없습니다.");
					obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
					}
				else if( regExp1.test(obj.value) ){
					alert("한글은 입력하실수 없습니다.");
					obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 한글,띄어쓰기 한자리 지움
					}
				else if( regExp2.test(obj.value) ){
					alert("영어는 입력하실수 없습니다.");
					obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 영어 한자리 지움
					}
			    else if( obj.value.length > 8){
			    	alert("생년월일은 8자리에 맞춰 입력해주세요.");
			    	obj.value = obj.value.substring( 0 , obj.value.length - 1 );
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
		
		
		// 이메일 전송 및 이메일 유효성 검사
		function auth_btn(){
			 var email = $('#email').val();
	    	 
	    	 if(email == ''){
	    	 	alert("이메일을 입력해주세요.");
	    	 	return false;
	    	 }	else {
				
				  var regExp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				  // 검증에 사용할 정규식 변수 regExp에 저장
				
				  if (email.match(regExp) != null) {
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
				  } else {
				    alert("이메일을 정확히 입력해주세요");
				    return false;
	              }
	        }	
	    	 
		}; 	
		
		
		 	
	 	var email_auth_cd = '';
	 			
		function join() {
				var regExp  = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
				var regExp1 = /^[a-zA-Z0-9]{6,10}$/;
				if($('#id').val() == ""){
					alert("아이디를 입력해주세요.");
					return false;
				}
				if($('#pw').val() == ""){
					alert("비밀번호를 입력해주세요.");
					return false;
				} else if($('#pw').val().match(regExp1) != null){
					
				} else {
					alert("비밀번호는 6~10자의 영문 대소문자와 숫자로만 입력해주세요.");
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
				} else if ($('#birth').val().match(regExp) != null){
				
				
				} else {
					alert("생년월일을 정확히 입력해주세요.");
					return false;
				}
				
				if($('#phone').val() == "" || $('#phone').val().length != 11){
					alert("전화번호를 정확히 입력해주세요");
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
				
				
				alert("회원가입에 성공했습니다!");	
		};
		
	