

function userRevUpdate(e){
	console.log('userRevUpdate' + e);
}

function userRevDelete(e){
	
	var userRevNum    = e;
	var HostNum       = document.getElementById('HostNum').value;
	var userRevMemNum = $('#userRevMemNum'+e).val();
	
	console.log('userRevDelete' + e);
	console.log("userRevNum --> " + userRevNum);
	console.log("HostNum --> " + HostNum);
	console.log("userRevMemNum --> " + userRevMemNum);
	/*
	$.ajax({
		url : "/storeUserRevDel",
		type : 'post',
		success: function(data){
			alert(data);
			if(data == 1) $('#storeRevList' + e).remove();
			}
		});
	*/

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