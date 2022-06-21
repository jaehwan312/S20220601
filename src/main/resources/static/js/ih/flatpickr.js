function storeLikeAction(index, host_num, host_name){
	var mem_num = $('#login_check').val();
	var color = $('#storeLike'+index).css('color');
	var msg = "";
	if(color=='rgb(128, 128, 128)'){
		msg += " 찜하러 갑숴?";
	}else if(color=='rgb(255, 0, 0)'){
		msg += " 찜하기를 해제하시겠습니까?";
	}
	if(confirm(host_name+msg)){
		if(mem_num!=0){
			$.ajax({
				type: 'POST',
				url: 'ajaxLikeInOut',
				data: {host_num:host_num},
				dataType: 'JSON',
				success: function(data){
					$('#storeLikes'+index).text(data.like_count);
					if(data.my_like==0){
						$('#storeLike'+index).css('color','gray');
					}else if(data.my_like==1){
						$('#storeLike'+index).css('color','red');
					}
				}
			});
		} else {
			alert("찜하기는 로그인을 해야 가능합니다");
			return;
		}
	} else{
		return;
	}
}