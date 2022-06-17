

// 휴면계정 로그인 체크	
	function logCheck(){
			var id  = $('#id').val();	
			var a = true;
			/* var progress = false; */
			$.ajax({
				type : "POST",
				url : "/gradeCheck",
				data : {id : id},
				dataType : 'json',
				async: false,
				success: function(data){
					if(data=='3'){
						alert("휴면계정은 로그인하실수 없습니다.");
						/* valueCheck(data); */
						a = false;
					}
				}
			});
			return a;
	};
	