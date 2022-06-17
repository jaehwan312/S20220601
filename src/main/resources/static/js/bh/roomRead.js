function room(){
	var host_num = 9;
	console.log(host_num);
	$("#roomread").load("stayRead", {"host_num" : host_num});
}