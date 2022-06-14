$(document).ready(function () {
		parking_val   = $('select.parking').attr('data-parking');    //주차 가능여부 코드
		food_type_val = $('select.food_type').attr('data-food_type');//음식 코드
	  	$('select.parking option[value=' + parking_val + ']').attr('selected', 'selected');    //불러온 주차 코드를 초기값으로 지정
	  	$('select.food_type option[value=' + food_type_val + ']').attr('selected', 'selected');//불러온 음식 코드를 초기값으로 지정
	  	console.log(parking_val);
	  	console.log(food_type_val);
	});
