window.raterJs({
   element: document.querySelector("#step"), 
    starSize: 32,
    rateCallback:function rateCallback(rating, done) {
        this.setRating(rating); 
        done(); 
    }
})



function starrating(){
	var point = $('#step').data('rating');
	var pointnum = parseInt(point); 
	if( $('#step').data('rating') != null){
		$('#revpoint').val(pointnum); 
	}else{
		$('#revpoint').val(0); 
	}
	
	
	
	$('#reviewForm').submit();
}