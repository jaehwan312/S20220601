$(function(){
	const url = new URL(window.location.href);
	const urlParams = url.searchParams;
	var value = urlParams.get('keyword'); 
	
	$.ajax({
		url: "/ajaxStoreList",
		data: {'keyword': value},
		dataType: 'json',
		success: function(data){
			
			var store = "";
			$.each(data, function(index, item){
				
				//맛집 검색결과 리스트
				store = 
				"<div class='host-item'><div class='row'><div class='col-5'><div class='img-wrapper'>"
                 +"<img src='images/jj/"+item.host_photo+"' class='img-responsive'></div></div>"
                 +"<div class='col-7'><h3>"+item.host_name+" <span class='theme-accent-color'> "
                 +item.host_avg+"</span><button>지도</button></h3>"
                 +"<p>"+item.host_addr+"<br>가격대 : "+item.min_price+"~"+item.max_price
                 +"<br>"+item.type_name+"&ensp;찜한수 : "+item.like_count+"&ensp;리뷰 : "+item.rev_count
                 +"</p></div><div class='row'><div class='col-12'><div id='storemap"+index+"' style='width:100%;height:350px;'>"
                 +"</div></div></div></div>";
                 $('#storeSection').append(store);
                  
                  // 카카오 map API
				   var mapContainer = document.getElementById('storemap'+index), // 지도를 표시할 div 
				       mapOption = {
				           center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				           level: 3 // 지도의 확대 레벨
				       };  
				
				   // 지도를 생성합니다    
				   var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				   // 주소-좌표 변환 객체를 생성합니다
				   var geocoder = new kakao.maps.services.Geocoder();
				
				   // 주소로 좌표를 검색합니다
				   geocoder.addressSearch(item.host_addr, function(result, status) {
				
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
				               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+item.host_name+'</div>'
				           });
				           infowindow.open(map, marker);
				
				           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				           map.setCenter(coords);
				       } 
				   });   
                  
			});
			
			
		}
	});
	
	
	$.ajax({
		url: "/ajaxStayList",
		data: {'keyword': value},
		dataType: 'json',
		success: function(data){
			
			var stay = "";
			$.each(data, function(index, item){
				
				//숙소 검색결과 리스트
				stay = 
				"<div class='host-item'><div class='row'><div class='col-5'><div class='img-wrapper'>"
                 +"<img src='images/jj/"+item.host_photo+"' class='img-responsive'></div></div>"
                 +"<div class='col-7'><h3>"+item.host_name+" <span class='theme-accent-color'> "
                 +item.host_avg+"</span><button>지도</button></h3>"
                 +"<p>"+item.host_addr+"<br>평일비용 : "+item.min_dayfee+" ~ "+item.max_dayfee
                 +"<br>주말비용 : "+item.min_weekfee+" ~ "+stay.max_weekfee
                 +"<br>"+item.type_name+"&ensp;찜한수 : "+item.like_count+"&ensp;리뷰 : "+item.rev_count
                 +"</p></div><div class='row'><div class='col-12'><div id='staymap"+index+"' style='width:100%;height:350px;'>"
                 +"</div></div></div></div>";
       --부터          $('#storeSection').append(store);
                  
                  // 카카오 map API
				   var mapContainer = document.getElementById('storemap'+index), // 지도를 표시할 div 
				       mapOption = {
				           center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				           level: 3 // 지도의 확대 레벨
				       };  
				
				   // 지도를 생성합니다    
				   var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				   // 주소-좌표 변환 객체를 생성합니다
				   var geocoder = new kakao.maps.services.Geocoder();
				
				   // 주소로 좌표를 검색합니다
				   geocoder.addressSearch(item.host_addr, function(result, status) {
				
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
				               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+item.host_name+'</div>'
				           });
				           infowindow.open(map, marker);
				
				           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				           map.setCenter(coords);
				       } 
				   });   
                  
			});
			
			
		}
	});
});









 