$(function(){
	$('#onRoom0').show();
	$('#onRoom1').hide();
	$('#onRoom2').hide();
});

function review(){
	var host_num = 9;
	console.log(host_num);
	$("#review").load("reviewList", {"host_num" : host_num});
}

function menushow(e){
	$('#onRoom0').hide();
	$('#onRoom1').hide();
	$('#onRoom2').hide();
	$('#onRoom'+e).show();
	
	
	if($('#onRoom1').css("display")=='block'){
		// 카카오 map API

	   var mapContainer = document.getElementById('staymap'), // 지도를 표시할 div 
	       mapOption = {
	           center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	           level: 3 // 지도의 확대 레벨
	       };  
	   var host_addr = document.getElementById('stayaddr').innerHTML;
	   var host_name = document.getElementById('stayname').innerHTML; 
	
	   // 지도를 생성합니다    
	   var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	   // 주소-좌표 변환 객체를 생성합니다
	   var geocoder = new kakao.maps.services.Geocoder();
	
	   // 주소로 좌표를 검색합니다
	   geocoder.addressSearch(host_addr, function(result, status) {
	
	       // 정상적으로 검색이 완료됐으면 
	        if (status === kakao.maps.services.Status.OK) {
	
	           var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	           // 결과값으로 받은 위치를 마커로 표시합니다
	           var marker = new kakao.maps.Marker({
	               map: map,
	               position: coords
	           });
	
	           // 인포윈도우로 장소에 대한 설명을 표시합니다
	           var infowindow = new kakao.maps.InfoWindow({
	               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+host_name+'</div>'
	           });
	           infowindow.open(map, marker);
	
	           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	           map.setCenter(coords);
	       	} 
	  	 }); 
	  	 
	  	window.setTimeout(function(){
	  		map.relayout();
	  	}, 0);
	}
}