//메뉴 등록 추가
function menuPlus(e){
	
	console.log(e);
	
	/*
	var plus = "<div class='labelmenuInfo' id='labelmenuInfo"+ (e+1) +"' for='menuinputInfo"+(e+1)+"'> " +
		      "메뉴명 : <input type='text' name='menu_list["+(e+1)+"].menu_name' id='menuinputInfo"+(e+1)+"'> " +
			  "가격 : <input type='number' name='menu_list["+(e+1)+"].menu_price' id='menuinputInfo"+(e+1)+"'> " +
			  "<input type='button' onclick='menuPlus("+(e+1)+")' id='menuInfoInsert"+(e+1)+"' value='+' class='btn btn-primary'> " +
			  "<input type='button' onclick='menuDel("+(e+1)+")' id='menuInfoDel"+(e+1)+"' value='-' class='btn btn-primary'></div	>";
	*/
	
	var plus =  " <div class='divmenuInfo' id='divmenuInfo"+(e+1)+"' style='display: flex;'>"
		        + "  <div class='col-md-4' id='menu"+(e+1)+"'>"
		        + "  	<label for='menuinputInfo"+(e+1)+"' class='form-label'>메뉴이름</label>"
		        + "     <input type='text' class='form-control' name='menu_list["+(e+1)+"].menu_name' id='menuinputInfo"+(e+1)+"' required=''>"
		        + "  </div>"
		        + "  <div class='col-md-4' id='price"+(e+1)+"'>"
		        + "     <label for='menuinputInfo"+(e+1)+"' class='form-label'>가격</label>"
		        + "     <input type='number' class='form-control' name='menu_list["+(e+1)+"].menu_price' id='menuinputInfo"+(e+1)+"' required=''>"
		        + "  </div>"
		        + "   <div class='col-md-2'>"
		        + "      <label for='menuInfoInsert"+(e+1)+"' class='form-label'>&nbsp;</label>"
		      	+ "  	 <input class='form-control btn btn-primary' type='button' id='menuInfoInsert"+(e+1)+"' value='추가' onclick='menuPlus("+(e+1)+")'>"
		        + "	 </div>" 
		        + "  <div class='col-md-2'>"
		        + "      <label for='menuInfoDel"+(e+1)+"' class='form-label'>&nbsp;</label>"
		        + "    <input type='button' onclick='menuDel("+(e+1)+")' id='menuInfoDel"+(e+1)+"' value='삭제' class='form-control btn btn-primary'>	"
		        + "  </div>"
	            + "</div>"
	
	console.log(plus);
	console.log('#menuInfoInsert' + e);
	document.getElementById('menu' + e).className="col-md-6";
	document.getElementById('price' + e).className="col-md-6";
	$('#menubox').append(plus);
	
	
	$('#menuInfoInsert'+ e).hide();
	$('#menuInfoDel'+ e).hide();
	
}
//메뉴등록 삭제
function menuDel(e){
	
	console.log(e);
	document.getElementById('menu' + (e -1)).className="col-md-4";
	document.getElementById('price' + (e -1)).className="col-md-4";
	$('#divmenuInfo' + e).remove();
	$('#menuInfoInsert'+ (e - 1)).show();
	$('#menuInfoDel'+ (e - 1)).show();
}
