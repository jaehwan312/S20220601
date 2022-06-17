$(function(){
	$('#onRoom0').show();
	$('#onRoom1').hide();
	$('#onRoom2').hide();
});

function review(){
	var host_num = 9;
	console.log(host_num);
	$("#review").load("reviewList", {"host_num" : host_num});
}

function menushow(e){
	$('#onRoom0').hide();
	$('#onRoom1').hide();
	$('#onRoom2').hide();
	$('#onRoom'+e).show();
}