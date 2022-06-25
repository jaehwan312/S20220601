function storeApprove(e){
	if(confirm("해당 식당에 대한 승인을 진행하시겠습니까?")){
		$.ajax({
			url: "approveStore",
			type: 'post',
			data:{host_num:e},
			dataType:'json',
			success:function(data){
				if(parseInt(data)>0){
					alert("승인 완료");
					$('#storeConfirm').submit();
				}
			}
		});
	}
}

function storeReject(e){
	if(confirm("해당 식당에 대한 승인을 거절하시겠습니까?")){
		$.ajax({
			url: "rejectStore",
			type: 'post',
			data:{host_num:e},
			dataType:'json',
			success:function(data){
				if(parseInt(data)>0){
					alert("거절 완료");
					$('#storeConfirm').submit();
				}
			}
		});
	}
}