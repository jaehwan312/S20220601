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
	
function revDeleteCheck() {
 if (confirm("리뷰를 정말 삭제하시겠습니까??") == true){    
     $('#reviewDeleteForm').submit();
 }else{   
     return false;
 }
}

function revRefCheck() {
 if (confirm("리뷰에 답글을 쓰시겠습니까??") == true){    
     $('#reviewRef').submit();
 }else{   
     return false;
 }
}


//권재인
function chkDate(e) {
         var result = true;
         var startdate = $('#frm'+e).children('input:eq(2)').val();
         var enddate = $('#frm'+e).children('input:eq(3)').val();
         

         if (startdate==""||startdate==null||enddate==""||enddate==null) {
            alert("날짜를 선택해주세요");
            result = false;
         }else {
            document.getElementById('frm'+e).submit();
         }

      };