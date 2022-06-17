//답글 삭제
function hostRevDelete(e){
	
	var host_num     = document.getElementById('HostNum').value;
	var rev_num      = e;
	var mem_num      = document.getElementById('Mem_mem').value;
	var host_rev_insert      = document.getElementById('host_rev_insert').innerHTML;
	
	
	console.log("rev_num --> " + rev_num);
	console.log("host_num --> " + host_num);
	console.log("mem_num --> " + mem_num);
	console.log(host_rev_insert);
	var del = {"rev_num" : rev_num, "host_num": host_num,"mem_num":mem_num}
	
	console.log(del);
	
	$.ajax({
		url : "/hostRevDelete",
		type : 'post',
		data : JSON.stringify(del),
		contentType : 'application/json; charset=UTF-8',
		dataType : 'json',
		success: function(data){
				if(data > 0) {
					$('#host_rev_select').remove();
					$('#host_rev').html(host_rev_insert);
					StoreRevCount(host_num);
					StoreAvgUpdate(host_num);
				}	
					
			}
		});
}


//답글작성
function hostRevInsert(e){
	var host_num     = document.getElementById('HostNum').value;
	var rev_num      = e;
	var rev_content  = document.getElementById('host_rev_content').value;
	var mem_num      = document.getElementById('Mem_mem').value;
	
	console.log("======리뷰 답글 등록==========");
	console.log("업체번호         --> " + host_num);
	console.log("답글을 달 리뷰번호 --> " + rev_num);
	console.log("답글자 회원번호  --> " + mem_num);
	console.log("답글내용         --> " + rev_content);
	
	var insert = {"host_num" : host_num, "mem_num": mem_num, "rev_content" : rev_content,"rev_num" : rev_num}
	
	console.log(insert);
	
	$.ajax({
		url : "/hostRevInsert",
		type : 'post',
		data : JSON.stringify(insert),
		contentType : 'application/json; charset=UTF-8',
		dataType : 'json',
		success: function(data){
				if(data > 0) {
					$('#host_rev_select').remove();
					//$('#host_rev').load(#host_rev_insert);
					StoreRevCount(host_num);
					StoreAvgUpdate(host_num);
				}	
					
			}
		});	
}


//고객 리뷰 작성
function storeReviewInsert(e){
	
	var host_num     = document.getElementById('HostNum').value;
	var mem_num		 = e;
	var rev_content  = document.getElementById('rev_content').value;
	var formData 	 = new FormData();
	
	for(var i = 0; i < 5; i++){
		formData.append("inputinfo" + i,document.querySelector('input[type=file]#inputInfo' + i).files[0]);
	}
	
	formData.append("host_num",host_num);
	formData.append("mem_num",mem_num);
	formData.append("rev_content",rev_content);
	
	console.log("======리뷰 등록==========");
	console.log("등록정보 --> " + formData);
	
	$.ajax({
		type:'post',                    //전송방식 POST
		url: "/storeRevInsert",         //storeRevInsert로 이동
		data : formData,				//전송 data formData
		processData: false,				
		contentType: false,
	//	dataType   : 'json',			//데이터 리턴 방식 json
		success: function(data){		//연결 성공시 실행
			$('#rev_content').val("");
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

/*
function userRevUpdate(e){
	console.log('userRevUpdate' + e);
}

function hostRevUpdate(e){
	console.log('hostRevUpdate' + e);
}

*/


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
