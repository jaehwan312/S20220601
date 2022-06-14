$(document).ready(function () {
		parking_val   = $('select.parking').attr('data-parking');    //주차 가능여부 코드
		food_type_val = $('select.food_type').attr('data-food_type');//음식 코드
	  	$('select.parking option[value=' + parking_val + ']').attr('selected', 'selected');    //불러온 주차 코드를 초기값으로 지정
	  	$('select.food_type option[value=' + food_type_val + ']').attr('selected', 'selected');//불러온 음식 코드를 초기값으로 지정
	  	console.log(parking_val);
	  	console.log(food_type_val);
});
$(document).ready(function () {
	var menuEndIndex = document.getElementById('menuEndIndex').value;
	console.log(menuEndIndex);
	
	for(var i = 0; i < menuEndIndex; i++){
			$('#menuInfoInsert'+ i).hide();
			$('#menuInfoDel'+ i).hide();
	}
});

$(document).ready(function () {

	var photoEndIndex = document.getElementById('photoEndIndex').value;
	console.log(photoEndIndex);
	var preview = document.querySelector("#preview");
	for(var i = 0; i < photoEndIndex; i++){
		var files   = document.querySelector('input[type=file]#inputInfo'+i).files[0];
	}
	
	console.log(files);
    
	function readAndPreview(file) {
		if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
			
			var reader = new FileReader();
			
			reader.addEventListener("load", function () {
				var image = new Image();
				image.width = 200;
		        image.height = 100;
		        image.title = file.name;
		        image.src = this.result;
		        preview.appendChild( image );
			}, false);
			
			reader.readAsDataURL(file);
		}
	   
	}
	
	if(files){
			[].forEach.call(files, readAndPreview);
	}
	
	for(var i = 0; i < photoEndIndex; i++){
		$('#labelInfo' + i).hide();
		$('#labelInfo' + (i+1)).show();
	}
	
});