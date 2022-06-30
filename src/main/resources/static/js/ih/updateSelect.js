//음식 및 주차 가능 여부 코드 가져오기
$(document).ready(function () {
		parking_val   = $('select.parking').attr('data-parking');    //주차 가능여부 코드
		food_type_val = $('select.food_type').attr('data-food_type');//음식 코드
	  	$('select.parking option[value=' + parking_val + ']').attr('selected', 'selected');    //불러온 주차 코드를 초기값으로 지정
	  	$('select.food_type option[value=' + food_type_val + ']').attr('selected', 'selected');//불러온 음식 코드를 초기값으로 지정
	  	console.log(parking_val);
	  	console.log(food_type_val);
});

//메뉴 리스트
$(document).ready(function () {
	var menuEndIndex = document.getElementById('menuEndIndex').value;
	console.log(menuEndIndex);
	
	for(var i = 0; i < menuEndIndex; i++){
			$('.button'+ i).hide();
	}
});

$(document).ready(function () {

	var preview1 = document.querySelector("#preview");
	
	var photoEndIndex = document.getElementById('photoEndIndex').value;
	
	for(var i = 0; i < photoEndIndex; i++){
		$('#labelInfo' + i).hide();
		$('#labelInfo' + (i+1)).show();
	}
	
});