function updateUser(num, index) {
			var mem_num  = num;	
			var gradeStr = "";
			var buttonStr = "";
			$.ajax({
				type : "POST",
				url : "/updateUser1",
				data : {mem_num : mem_num},
				dataType : 'json',
				success: function(data){
					if(data != null){
						alert("등급변경에 성공했습니다.");
					} else {
						alert("등급변경에 실패했습니다.")
					}
					
					$('#grade'+index).empty();
					$('#button'+index).empty();
					if(data.grade=='1'){
						gradeStr = '관리자';
						buttonStr = '<button onclick="updateUser('+data.mem_num+')" class="btn btn-sm btn-primary">일반회원으로변경</button>';
					}else if(data.grade=='2') {
						gradeStr = '일반회원';
						buttonStr = '<button onclick="updateAdmin()" class="btn btn-sm btn-primary">관리자로변경</button>';
					}
					
					$('#grade'+index).append(gradeStr);
					$('#button'+index).append(buttonStr);
					
				}
			});
	};
	
	function updateAdmin(num, index) {
		var mem_num  = num;	
		var gradeStr = "";
		var buttonStr = "";
		$.ajax({
			type : "POST",
			url : "/updateAdmin1",
			data : {mem_num : mem_num},
			dataType : 'json',
			success: function(data){
				if(data != null){
					alert("등급변경에 성공했습니다.");
				} else {
					alert("등급변경에 실패했습니다.")
				}
				
				$('#grade'+index).empty();
				$('#button'+index).empty();
				if(data.grade=='1'){
					gradeStr = '관리자';
					buttonStr = '<button onclick="updateUser('+data.mem_num+')" class="btn btn-sm btn-primary">일반회원으로변경</button>';
				}else if(data.grade=='2') {
					gradeStr = '일반회원';
					buttonStr = '<button onclick="updateAdmin()" class="btn btn-sm btn-primary">관리자로변경</button>';
				}
				
				$('#grade'+index).append(gradeStr);
				$('#button'+index).append(buttonStr);
				
			}
		});
};

.loginTitle {
	font-family: 'Gugi', cursive;
    display: flex;
    justify-content: space-around;
    align-items: center;
    /* position: fixed; */
    /* z-index: 80; */
    background-color: white;
    /* width: 100vw;
    top: 0px; */
    font-size: 17px;
    margin: 20px;
}
