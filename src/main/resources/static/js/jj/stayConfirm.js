function stayApprove(e){
	if(confirm("해당 숙소에 대한 승인을 진행하시겠습니까?")){
		$.ajax({
			url: "approveStay",
			type: 'post',
			data:{host_num:e},
			dataType:'json',
			success:function(data){
				if(parseInt(data)>0){
					alert("승인 완료");
					$('#stayConfirm').submit();
				}
			}
		});
	}
}

function stayReject(e){
	if(confirm("해당 숙소에 대한 승인을 거절하시겠습니까?")){
		$.ajax({
			url: "approveStay",
			type: 'post',
			data:{host_num:e},
			dataType:'json',
			success:function(data){
				if(parseInt(data)>0){
					alert("승인 완료");
					$('#stayConfirm').submit();
				}
			}
		});
	}
}