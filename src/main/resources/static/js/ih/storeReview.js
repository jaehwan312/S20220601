function storeReviewInsert(e){
	console.log(e)
	
	var HostNum       	 = document.getElementById('HostNum').value;
	var userRevMemNum	 = e;
	
	console.log("userRevNum --> " + userRevNum);
	console.log("HostNum --> " + HostNum);
	console.log("userRevMemNum --> " + userRevMemNum);
	
	var del = {"rev_num" : userRevNum, "host_num": HostNum, "mem_num" : userRevMemNum}
	
	console.log(del);
	
	/*
	$.ajax({
		type:'post',
		url: "/storeRevInsert",
		data : JSON.stringify(insert),
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
	*/
}
/*
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
*/
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