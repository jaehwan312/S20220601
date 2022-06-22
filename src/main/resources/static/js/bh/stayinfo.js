function stay(){
	var host_num = 9;
	console.log(host_num);
	$("#stayinfo").load("stayinfo", {"host_num" : host_num});
}

function stayremoveCheck() {
 if (confirm("삭제요청을 하시겠습니까??") == true){    
     $('#stayDeleteForm').submit();
 }else{   
     return false;
 }
}

function roomremoveCheck() {
 if (confirm("객실을 정말 삭제하시겠습니까??") == true){    
     $('#roomDeleteForm').submit();
 }else{   
     return false;
 }
}
	
	
function roomInsertCheck() {
 if (confirm("객실을 추가 하시겠습니까??") == true){    
     $('#roomInsertForm').submit();
 }else{   
     return false;
 }
}	