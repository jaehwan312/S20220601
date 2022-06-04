function menuPlus(e){

	var menus   = document.querySelector('input[type=button]#menuInfo'+e);
	console.log(menus);
    
	
	
	$('#menuInfo' + e).hide();
	$('#menuInfo' + (e+1)).show();
}