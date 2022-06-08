//리뷰삭제
function userRevDelete(e){
	
	var userRevNum    	 = $('#userRevNum'+e).val();
	var HostNum       	 = document.getElementById('HostNum').value;
	var userRevMemNum	 = $('#userRevMemNum'+e).val();
	
	console.log('userRevDelete' + e);
	console.log("userRevNum --> " + userRevNum);
	console.log("HostNum --> " + HostNum);
	console.log("userRevMemNum --> " + userRevMemNum);
	StoreAvgUpdate();
	StoreRevCount();
	var del = {"rev_num" : userRevNum, "host_num": HostNum, "mem_num" : userRevMemNum}
	
	console.log(del);
	/*
	$.ajax({
		url : "/storeUserRevDel",
		type : 'post',
		data : JSON.stringify(del),
		contentType : 'application/json; charset=UTF-8',
		dataType : 'json',
		success: function(data){
				if(data == 1) {
					$('#storeRevList' + e).remove();
					
				}			
			}
		});		
	*/
	
}

function StoreAvgUpdate(){
	var StoreAvg = document.getElementById('StoreAvg').innerText;
	console.log(StoreAvg);
	StoreAvg = 3.5;
	

}

function StoreRevCount(){
	var StoreRevCount = document.getElementById('StoreRevCount').innerText;
	console.log(StoreRevCount);
}

function userRevUpdate(e){
	console.log('userRevUpdate' + e);
}

function hostRevUpdate(e){
	console.log('hostRevUpdate' + e);
}

function hostRevDelete(e){
	console.log('hostRevDelete' + e);
}

function storeReviewInsert(){

	$.ajax({
		type:'post',
		url: "/storeRevInsert",
		data: $('#storeRevInsert').serialize(),
		
		success : function(data){
			 if(data=="success")
            {
                storeRevList();
                $("#content").val("");
            }
		}
	});
	
}