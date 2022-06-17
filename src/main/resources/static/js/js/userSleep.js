function join() {
		
		
		if($('#pw').val() == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		if($('#pw').val() != $('#pwCheck').val()){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/pwCheck?pw="+$('#pw').val(),
			success: function(data){
				if(data==0){
					alert("비밀번호를 확인해주세요.");
					return;
				}else{
					if(confirm("탈퇴하시겠습니까?")){
						$("#userSleep").submit();
					}
					
				}
			}
		})
	}