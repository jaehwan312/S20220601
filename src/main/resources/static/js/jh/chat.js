function chatOpen(mem_num) {
	$(".chat_window").css("display","block");
	$("#chatNew").hide();
	$.ajax(
			{
				url:"/room/new",
				type:'post',
				data:{mem_num : mem_num},
				dataType:'html',
				success:function(data){
					$('.chat_window').html(data);
					
				}
	
			});
}

function chatActive(){
	$(".chat_window").css("display","block");
	$("#chatIng").hide();
}
