//답글 삭제
function hostRevDelete(e){
	
	//현재 host_num 값
	var host_num        = document.getElementById('HostNum').value;
	//삭제할 답변의 rev_num
	var rev_num         = e;
	//삭제하는 답변의 회원번호										
	var mem_num         = document.getElementById('Mem_mem').value;
	//삭제하는 답변이 달린 리뷰번호
	var user_rev_num    = document.getElementById('user_rev.rev_num').value;
	
	//답변 관련 코드
	var host_rev        = document.getElementById('host_rev');
	
	var host_rev_select = document.getElementById('host_rev_select');
	//답변을 inset 하는 코드
	var host_rev_insert = "<div id='host_rev'>"
						+ "<c:if test='${mem_num == store.mem_num }'>"
						+		"<div  id='host_rev_insert'>"
						+			"<c:if test='${count == 0 }'>"
						+				"<label>"
						+					"<textarea rows='4px;' cols='155px;' style='float: right;' id='host_rev_content' name='host_rev_content'></textarea>"
						+				"</label>"
						+				"<button onclick='hostRevInsert("+user_rev_num+")' style='float: right;' class='btn btn-primary'>답변등록</button>"
						+ "</c:if></div></c:if>></div>"
	
	//삭제를 위해 넘겨줄 정보
	var del = {"rev_num" : rev_num, "host_num": host_num,"mem_num":mem_num};
	
	console.log(host_rev_insert);
	$.ajax({
		url : "/hostRevDelete",
		type : 'post',
		data : JSON.stringify(del),
		contentType : 'application/json; charset=UTF-8',
		dataType : 'json',
		success: function(data){
				if(data > 0) {
					//답변 내용 삭제
					
					$('#host_rev_select').remove();
					//삭제된 부분을 inset하는 코드로 변경
					host_rev.outerHTML = host_rev_insert;
				}	
					
			}
		});
}


//답글작성
function hostRevInsert(e){

	var host_num        = document.getElementById('HostNum').value;
	var rev_num         = e;
	var rev_content     = document.getElementById('host_rev_content').value;
	var mem_num         = document.getElementById('Mem_mem').value;
	
	//답변 관련 코드
	var host_rev        = document.getElementById('host_rev');
	
	var insert = {"host_num" : host_num, "mem_num": mem_num, "rev_content" : rev_content,"rev_num" : rev_num}
	
	
	$.ajax({
		url : "/hostRevInsert",
		type : 'post',
		data : JSON.stringify(insert),
		contentType : 'application/json; charset=UTF-8',
		dataType : 'json',
		success: function(data){
					//insert 코드 삭제
					$('#host_rev_insert').remove();
					//답글 리뷰 번호 확인
					var step_rev = data;
					
					//리뷰에 작성된 답글 
					var host_rev_select = "<div id='host_rev_select'>" 
						+ "<c:forEach items='${revList }' var='step_rev' varStatus='h'>"
						+ "<c:if test='${user_rev.rev_num == step_rev.ref && step_rev.re_step == 1}'>"
						+ "<h6 hidden='' id='count'>${count = 1}</h6>"
						+ "<br/>"
						+ "	<div style='margin-top: 50px;'>"
						+ "		<label style='float: right;'>[답변] : "+ rev_content +"</label>"
						+ "		<br/>"
						+ "		<button onclick='hostRevUpdate("+step_rev+")' style='float: right;' class='btn btn-primary'>답변수정</button>"
						+ "		<button onclick='hostRevDelete("+step_rev+")' style='float: right;' class='btn btn-primary'>답변삭제</button>"
						+ "     <input type='hidden' value='"+step_rev+"' id='step_rev.rev_num'>"	
						+ "  	<input type='hidden' value='"+rev_num+"' id='user_rev.rev_num'>"
						+ "	</div></c:if></c:forEach>";
					
					//답글을 view 딴에 보여줌 
					host_rev.innerHTML 	= host_rev_select;  
			      
					
			}
		});
		

		
}


//고객 리뷰 작성
function storeReviewInsert(e){
	
	var host_num     = document.getElementById('HostNum').value;
	var mem_num		 = e;
	var rev_content  = document.getElementById('rev_content').value;
	var formData 	 = new FormData();
	
	if( $('#step').data('rating') != null){
		var rev_point     = $('#step').data('rating');
	}else{
		var rev_point     = 0
	}
	
	elFileForm = document.querySelector('input[type=file]#inputInfo0')
	for(var i = 0; i < 5; i++){
		formData.append("inputinfo" + i,document.querySelector('input[type=file]#inputInfo' + i).files[0]);
	}
	
	formData.append("host_num",host_num);
	formData.append("mem_num",mem_num);
	formData.append("rev_content",rev_content);
	formData.append("rev_point", rev_point);
	
	$.ajax({
		type:'post',                    //전송방식 POST
		url: "/storeRevInsert",         //storeRevInsert로 이동
		data : formData,				//전송 data formData
		processData: false,				
		contentType: false,
		dataType   : 'json',			//데이터 리턴 방식 json
		success: function(data){		//연결 성공시 실행
			$('#rev_content').val("");
			//$('.insertPhoto').remove();
			//$('#preview').remove();
			//$('.section').remove();
			elFileForm.value ='';
			console.log(data);
			StoreRevCount(host_num);
			StoreAvgUpdate(host_num);
		}
	});
	
}

//식당 평점 업데이트
function StoreAvgUpdate(e){
	var StoreAvg = document.getElementById('StoreAvg').innerText;
	var host_num = e;
	
	console.log("변경전 평점 --> " + StoreAvg);
	console.log("host_num --> " + host_num);
	
	$.ajax({
		url : "/storeRevPointAvg",
		type : 'post',
		data : {host_num : host_num},
		dataType : 'json',
		success: function(data){
				console.log("변경된 평점 --> " + data);
				$("#StoreAvg").text(data);
			}
		});	

}

//리뷰 갯수 업데이트
function StoreRevCount(e){
	var count    = document.getElementById('StoreRevCount').innerText;
	var host_num = e;
	
	console.log("변경전 리뷰갯수" + count);
	console.log("host_num --> " + host_num);
	
	$.ajax({
		url : "/StoreRevCount",
		type : 'post',
		data : {host_num : host_num},
		dataType : 'json',
		success: function(data){
				console.log("변경된 리뷰갯수 --> " + data);
				$("#StoreRevCount").text(data);
			}
		});	
}


//리뷰삭제
function userRevDelete(e){
	
	var userRevNum    = $('#userRevNum'+e).val();
	var host_num      = document.getElementById('HostNum').value;
	var userRevMemNum = $('#userRevMemNum'+e).val();
	
	console.log('userRevDelete' + e);
	console.log("userRevNum --> " + userRevNum);
	console.log("host_num --> " + host_num);
	console.log("userRevMemNum --> " + userRevMemNum);
	
	var del = {"rev_num" : userRevNum, "host_num": host_num, "mem_num" : userRevMemNum}
	
	console.log(del);
	

	$.ajax({
		url : "/storeUserRevDel",
		type : 'post',
		data : JSON.stringify(del),
		contentType : 'application/json; charset=UTF-8',
		dataType : 'json',
		success: function(data){
				if(data > 0) {
					$('#storeRevList' + e).remove();
					StoreRevCount(host_num);
					StoreAvgUpdate(host_num);
				}	
					
			}
		});		

	
}



/*
function userRevUpdate(e){
	console.log('userRevUpdate' + e);
}

function hostRevUpdate(e){
	console.log('hostRevUpdate' + e);
}

*/