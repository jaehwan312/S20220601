//메뉴 등록 추가
function menuPlus(e){
	
	console.log(e);
	var plus = "<p><label class='labelmenuInfo' id='labelmenuInfo"+ (e+1) +"' for='menuinputInfo"+(e+1)+"'> " +
		      "메뉴명 : <input type='text' name='menu_list["+(e+1)+"].menu_name' id='menuinputInfo"+(e+1)+"'> " +
			  "가격 : <input type='number' name='menu_list["+(e+1)+"].menu_price' id='menuinputInfo"+(e+1)+"'> " +
			  "<input type='button' onclick='menuPlus("+(e+1)+")' id='menuInfoInsert"+(e+1)+"' value='+' class='btn btn-primary'> " +
			  "<input type='button' onclick='menuDel("+(e+1)+")' id='menuInfoDel"+(e+1)+"' value='-' class='btn btn-primary'></label>";
	console.log(plus);
	console.log('#menuInfoInsert' + e);
	$('#labelmenuInfo' + e).append(plus);
	
	
	$('#menuInfoInsert'+ e).hide();
	$('#menuInfoDel'+ e).hide();
	
}
//메뉴등록 삭제
function menuDel(e){
	
	console.log(e);
	
	$('#labelmenuInfo' + e).remove();
	$('#menuInfoInsert'+ (e - 1)).show();
	$('#menuInfoDel'+ (e - 1)).show();
}
