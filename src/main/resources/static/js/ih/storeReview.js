//답글 삭제
function hostRevDelete(e){
	
	//현재 host_num 값
	var host_num        = document.getElementById('HostNum').value;
	//삭제할 답변의 rev_num
	var rev_num         = e;
	//삭제하는 답변 내용   
	var rev_content = document.getElementById('step_rev.rev_content' + rev_num).innerText;
	
	
	
	//삭제하는 답변의 회원번호										
	var mem_num         = document.getElementById('Mem_mem').value;
	//삭제하는 답변이 달린 리뷰번호
	var user_rev_num    = document.getElementById('user_rev.rev_num').value;
	
	
	//답변 관련 div
	var host_rev        = document.getElementById('host_rev' + user_rev_num);
	
	//답변 내용이 적힌 div
	var host_rev_select = document.getElementById('host_rev_select');
	
	//답변을 inset 하는 div
	var host_rev_insert = "<div id='host_rev'>"
						+ "<c:if test='${mem_num == store.mem_num }'>"
						+		"<div  id='host_rev_insert"+rev_num+"'>"
						+			"<c:if test='${count == 0 }'>"
						+				"<label>"
						+					"<textarea rows='4px;' cols='155px;' style='float: right;' id='host_rev_content"+user_rev_num+"' name='host_rev_content'></textarea>"
						+				"</label>"
						+				"<button onclick='hostRevInsert("+user_rev_num+")' style='float: right;' class='btn btn-primary'>답변등록</button>"
						+ "</c:if></div></c:if>></div>"
	
	//삭제를 위해 넘겨줄 정보
	var del = {"rev_num" : rev_num, "host_num": host_num,"mem_num":mem_num,"rev_content":rev_content};
	
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
					
					$('#host_rev_select' + user_rev_num).remove();
					//삭제된 부분을 inset하는 코드로 변경
					host_rev.innerHTML = host_rev_insert;
				}	
					
			}
		});
}


//답글작성
function hostRevInsert(e){
	
	//현재 업체번호
	var host_num        = document.getElementById('HostNum').value;
	//답글을 단 리뷰 변호
	var rev_num         = e;
	//답글 내용
	var rev_content     = document.getElementById('host_rev_content' + rev_num).value;
	//답글자 회원번호
	var mem_num         = document.getElementById('Mem_mem').value;
	
	//답변 관련 코드
	var host_rev        = document.getElementById('host_rev' + rev_num);
	
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
					console.log(step_rev);
					//리뷰에 작성된 답글 
					var host_rev_select = "<div id='host_rev_select"+rev_num+"'>" 
						+ "<h6 hidden='' id='count'>${count = 1}</h6>"
						+ "<br/>"
						+ "	<div style='margin-top: 50px;'>"
						+ "<label style='float: right;'><b id='step_rev.rev_content"+ step_rev +"'>"+ rev_content +"</b></label>"
						+ "		<br/>"
						+ "		<button onclick='hostRevUpdate("+step_rev+")' style='float: right;' class='btn btn-primary' id='hostRevUpdate"+step_rev+"'>답변수정</button>"
						+ "		<button onclick='hostRevDelete("+step_rev+")' style='float: right;' class='btn btn-primary' id='hostRevDelete"+step_rev+"'>답변삭제</button>"
						+ "     <input type='hidden' value='"+step_rev+"' id='step_rev.rev_num'>"	
						+ "  	<input type='hidden' value='"+rev_num+"' id='user_rev.rev_num'>"
						+ "	</div></div>";
					
					//답글을 view 딴에 보여줌 
					host_rev.innerHTML 	= host_rev_select;  
			      
					
			}
		});
		

		
}


//고객 리뷰 작성
function storeReviewInsert(e){

	
	
	if(chakDate() == 1){
		//리뷰 다는 업체 번호
		var host_num     = document.getElementById('HostNum').value;
		//리뷰 작성자 회원 번호
		var mem_num		 = e;
		//리뷰 내용
		var rev_content  = document.getElementById('rev_content').value;
		//사진등 리뷰작성 정보를 jons으로 넘기기 위한 FormData 생성
		var formData 	 = new FormData();
		
		//평점(평점 입력이 없으면  null 조건처리)
		if( $('#step').data('rating') == null){
			alert("평점을 입력해 주세요.")
			
		}else{
			var rev_point     = $('#step').data('rating');
			//사진 및 리뷰 정보 담기
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
					
					//리뷰 내용 초기화
					$('#rev_content').val("");
					//$('div').removeData('rating');
					//사진 preview 초기화
					$('#preview').empty();
					//사진 insert 초기화
					$('#labelInfo0').show();
					$('#labelInfo1').hide();
					$('#labelInfo2').hide();
					$('#labelInfo3').hide();
					$('#labelInfo4').hide();
					//FormData 초기화
					elFileForm.value ='';
					
					//console.log("data --> " + data);
					//$.each(data, function (k, v) {
		             //           $('<option></option>').val(k).text(v).appendTo($('#review'));
		            //        });
		            
					StoreRevCount(host_num);
					StoreAvgUpdate(host_num);
					location.reload();
				}
			});
			
		}
	}

}

function chakDate(e){
	let today = new Date();
	var maxReviewDate = document.getElementById('maxReviewDate').value;
	maxReviewDate = new Date(maxReviewDate);
	
	if ((today - maxReviewDate)/(60*60*1000) <= 24) {
          alert("해당 업체에 리뷰를 작성한지 1일 경과 되어야 작성 가능 합니다.");
          return 0;
          
    }
    else {
          return 1;
    }

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

//리뷰 수정
function userRevUpdate(e){

	console.log('userRevUpdate' + e);
	var rev_content = document.getElementById('user_rev.rev_content' + e).innerText;
	$('#userRevUpdate' + e).hide();
	$('#userRevDelete' + e).hide();
	$('#host_user_rev' + e).empty();
	$('#host_user_rev' + e).append("<label>"
							   +"	<textarea rows='4px;' cols='135px;' style='float: right;' id='rev_content_update"+e+"' name='rev_content'>"+rev_content+"</textarea>"
							   +"</label>"
							   +"<button onclick='userRevUpdateInsert("+e+")'"
							   +					"style='float: right;' class='btn btn-primary' id='userRevUpdateInsert"+e+"'>수정완료</button>");

}

function userRevUpdateInsert(e){


	console.log('userRevUpdateInsert' + e);
	var rev_content_update = document.getElementById('rev_content_update'+e).value;
	var rev_num = e;
	console.log(rev_content_update);
	
	var update = {"rev_num" : rev_num, "rev_content" : rev_content_update}
	console.log(update);
	$.ajax({
		url: 'RevUpdateInsert',
		type: 'post',
		data : JSON.stringify(update),
		contentType: 'application/json; charset=UTF-8',
		dataType : 'text',
		success: function(data){
			$('#rev_content_update' +e).remove();
			$('#host_user_rev' + e).append("<b id='user_rev.rev_content"+e+"'>"+data+"</b>");
			$('#userRevUpdate' + e).show();
			$('#userRevDelete' + e).show();
			$('#userRevUpdateInsert' + e).remove();
		}
			
	})
	
}

//답글 수정
function hostRevUpdate(e){
	console.log('hostRevUpdate' + e);
	var rev_content = document.getElementById('step_rev.rev_content' + e).innerText;
	$('#hostRevUpdate' + e).hide();
	$('#hostRevDelete' + e).hide();
	$('#host_host_rev' + e).empty();
	$('#host_host_rev' + e).append("<label>"
							   +"	<textarea rows='4px;' cols='135px;' style='float: right;' id='rev_content_update"+e+"' name='rev_content'>"+rev_content+"</textarea>"
							   +"</label>"
							   +"<button onclick='hostRevUpdateInsert("+e+")'"
							   +					"style='float: right;' class='btn btn-primary' id='hostRevUpdateInsert"+e+"'>수정완료</button>");
}

function hostRevUpdateInsert(e){
	console.log('hostRevUpdateInsert' + e);
	var rev_content_update = document.getElementById('rev_content_update'+e).value;
	var rev_num = e;
	console.log(rev_content_update);
	
	var update = {"rev_num" : rev_num, "rev_content" : rev_content_update}
	console.log(update);
	$.ajax({
		url: 'RevUpdateInsert',
		type: 'post',
		data : JSON.stringify(update),
		contentType: 'application/json; charset=UTF-8',
		dataType : 'text',
		success: function(data){
			$('#rev_content_update' +e).remove();
			$('#host_host_rev' + e).append("<b id='step_rev.rev_content"+e+"' style='float:right;'>[답변]"+data+"</b>");
			$('#hostRevUpdate' + e).show();
			$('#hostRevDelete' + e).show();
			$('#hostRevUpdateInsert' + e).remove();
		}
			
	})
	
}