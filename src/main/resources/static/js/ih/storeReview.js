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
					alert(data);
					$('#storeRevList' + e).remove();
					
				}	
					
			}
		});		
	
	//StoreAvgUpdate();
	//StoreRevCount();	
}

/*
function StoreAvgUpdate(){
	var StoreAvg = document.getElementById('StoreAvg').innerText;
	console.log(StoreAvg);
	//StoreAvg.textContent  = "<b id='StoreRevCount'>1개</b>";
	

}

function StoreRevCount(){
	var count = document.getElementById('StoreRevCount').innerText;
	console.log(StoreRevCount);
	
	$.ajax({
		url : "/StoreRevCount",
		type : 'post',
		data : count
		dataType : 'text',
		success: function(data){
				if(data == 1) {
					$('#storeRevList' + e).remove();
					
				}	
					
			}
		});	
	
	
	$("#StoreRevCount").text(2);
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
	
}*/