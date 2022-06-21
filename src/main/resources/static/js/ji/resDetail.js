function chakDate(e){
	let today = new Date();
	var maxReviewDate = document.getElementById('maxReviewDate').value;
	maxReviewDate = new Date(maxReviewDate);
	
	if ((today - maxReviewDate)/(60*60*1000) <= 24) {
          alert("해당 업체에 리뷰를 작성한지 1일 경과 되어야 작성 가능 합니다.");
          return 0;
          
    }
    else {
          return 1;
    }

}
$(document).ready(function () {
		parking_val   = $('select.parking').attr('data-parking');    //주차 가능여부 코드
		food_type_val = $('select.food_type').attr('data-food_type');//음식 코드
	  	$('select.parking option[value=' + parking_val + ']').attr('selected', 'selected');    //불러온 주차 코드를 초기값으로 지정
	  	$('select.food_type option[value=' + food_type_val + ']').attr('selected', 'selected');//불러온 음식 코드를 초기값으로 지정
	  	console.log(parking_val);
	  	console.log(food_type_val);
});