function storeReviewInsert(e){
	console.log(e)
	
	var host_num     = document.getElementById('HostNum').value;
	var mem_num		 = e;
	var rev_content  = document.getElementById('rev_content').value;
	var formData 	 = new FormData();
	
	//for(var i = 0; i < 5; i++){
	//	formData.append("inputinfo" + i,('#inputInfo' + i)[0].files[0]);
	//}
	formData.append("inputinfo0",document.querySelector('input[type=file]#inputInfo0').files[0]);
	formData.append("inputinfo1",document.querySelector('input[type=file]#inputInfo1').files[0]);
	formData.append("inputinfo2",document.querySelector('input[type=file]#inputInfo2').files[0]);
	formData.append("inputinfo3",document.querySelector('input[type=file]#inputInfo3').files[0]);
	formData.append("inputinfo4",document.querySelector('input[type=file]#inputInfo4').files[0]);
	
	formData.append("host_num",host_num);
	formData.append("mem_num",mem_num);
	formData.append("rev_content",rev_content);
	
	
	
	
	console.log("mem_num 	 --> " + mem_num);
	console.log("host_num	 --> " + host_num);
	console.log("rev_content --> " + rev_content);
	console.log("formData --> " + formData);
	var insert = {"host_num": host_num,
				  "mem_num" : mem_num, 
				  "rev_content" : rev_content, 
				  "formData":formData}
	console.log(insert);
	
	/*
	console.log(formData.getAll('rev_content'));
	console.log(formData.getAll('mem_num'));
	console.log(formData.getAll('host_num'));
	console.log(formData.getAll('inputinfo0'));
	console.log(formData.getAll('inputinfo1'));
	console.log(formData.getAll('inputinfo2'));
	console.log(formData.getAll('inputinfo3'));
	console.log(formData.getAll('inputinfo4'));
	*/
	$.ajax({
		type:'post',
		url: "/storeRevInsert",
		data : formData,
		processData: false,
		contentType: false,
		success: function(data){
				if(data > 0) {
				//	$('#storeRevList' + e).add();
					StoreRevCount(host_num);
					StoreAvgUpdate(host_num);
				}	
					
		}
	});
	
}

//식당 평점 업데이트
function StoreAvgUpdate(e){
	var StoreAvg = document.getElementById('StoreAvg').innerText;
	console.log(StoreAvg);
	var host_num = e;
	console.log("host_num --> " + host_num);
	
	$.ajax({
		url : "/storeRevPointAvg",
		type : 'post',
		data : {host_num : host_num},
		dataType : 'json',
		success: function(data){
				console.log("data --> " + data);
				$("#StoreAvg").text(data);
			}
		});	

}

//리뷰 갯수 업데이트
function StoreRevCount(e){
	var count = document.getElementById('StoreRevCount').innerText;
	console.log(count);
	var host_num = e;
	console.log("host_num --> " + host_num);
	
	$.ajax({
		url : "/StoreRevCount",
		type : 'post',
		data : {host_num : host_num},
		dataType : 'json',
		success: function(data){
				console.log("data --> " + data);
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

function hostRevDelete(e){
	console.log('hostRevDelete' + e);
}
*/

/*
//리뷰삭제
function userRevDelete(e){
	
	var userRevNum    	 = $('#userRevNum'+e).val();
	var HostNum       	 = document.getElementById('HostNum').value;
	var userRevMemNum	 = $('#userRevMemNum'+e).val();
	
	console.log('userRevDelete' + e);
	console.log("userRevNum --> " + userRevNum);
	console.log("HostNum --> " + HostNum);
	console.log("userRevMemNum --> " + userRevMemNum);
	
	var del = {"rev_num" : userRevNum, "host_num": HostNum, "mem_num" : userRevMemNum}
	
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
					StoreRevCount(HostNum);
					StoreAvgUpdate(HostNum);
				}	
					
			}
		});		

	
}
*/