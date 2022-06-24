function deletePick(name, num){
	if(confirm(name+" 찜목록에서 삭제하시겠습니까?")){
		$.ajax({
			url: "/myPickDel",
			data: 'post',
			data: {host_num:num},
			type: 'post',
			dataType: 'json',
			success: function(data){
				if(parseInt(data)>0){
					alert("해당 찜목록이 삭제되었습니다");
					$('#reset').submit();
				}
			}
		});
	}
}