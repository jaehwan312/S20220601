function stay(){
	var host_num = 9;
	console.log(host_num);
	$("#stayinfo").load("stayinfo", {"host_num" : host_num});
}