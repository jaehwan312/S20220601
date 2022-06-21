$(document).ready(function () {
	$('.reviewList').slice(0,5).show();
	$('#load').click(function(e){
		e.preventDefault();
		$('.reviewList:hidden').slice(0,5).show();
		if($('.reviewList:hidden').length == 0){
			$('#load').css('display','none');
		}
	});
});
