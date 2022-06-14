
// List 검색결과 로딩되면 맛집, 숙소에 대한 검색결과 리스트로 보여줌
$(function(){
	//const url = new URL(window.location.href);
	//const urlParams = url.searchParams;
	//var value = urlParams.get('keyword'); 
	var value = $('#orderAjax').serialize();
	var section = $('#selectionId').val();
	
	switch(section) {
		// 검색결과 숙소+맛집 포함
		case "0" :
			$.ajax({
			url: "/ajaxStoreList",
			data: value,
			type: 'post',
			dataType: 'json',
			success: function(data){
				
				var store = "";
				$.each(data, function(index, item){
					
					//맛집 검색결과 리스트
					store = 
					"<div class='host-item'><div class='row'><div class='col-5'><div class='img-wrapper'>"
	                 +"<img src='images/jj/"+item.host_photo+"' class='img-responsive'></div></div>"
	                 +"<div class='col-7'><h3>"+item.host_name+"</h3>"
	                 +"<div class='product__details__rating'>"
				                            +"<i class='fa fa-star'></i>"
				                            +"<i class='fa fa-star'></i>"
				                            +"<i class='fa fa-star'></i>"
				                            +"<i class='fa fa-star'></i>"
				                            +"<i class='fa fa-star-half-o'></i>"
				                           +"<span>"+item.host_avg+"</span>"
				                       +"</div>"
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
				
				// 맛집 건수 갱신
				let storelength_first = $('#storeSection').find('.host-item:visible').length;
				$('#storeSection').find('h2').text('맛집 '+storelength_first+'건');
					
				if(storelength_first==0){
					$('#storeSection').hide();
				}
				
				// section 헤더 이름 변경
				$('#section_heading').text("숙박 & 맛집");
				$('#section_heading_sub').show();
				
				
			}
		});
		
		
		$.ajax({
			url: "/ajaxStayList",
			data: value,
			type: 'post',
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
	                 +"<br>주말비용 : "+item.min_weekfee+" ~ "+item.max_weekfee
	                 +"<br>"+item.type_name+"&ensp;찜한수 : "+item.like_count+"&ensp;리뷰 : "+item.rev_count
	                 +"</p></div><div class='row'><div class='col-12'><div id='staymap"+index+"' style='width:100%;height:350px;'>"
	                 +"</div></div></div></div>";
	                 $('#staySection').append(stay);
	                  
	                  // 카카오 map API
					   var mapContainer = document.getElementById('staymap'+index), // 지도를 표시할 div 
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
				
				// 숙소 건수 갱신
				let staylength_first = $('#staySection').find('.host-item:visible').length;
				$('#staySection').find('h2').text('숙소 '+staylength_first+'건');
				
				if(staylength_first==0){
					$('#staySection').hide();
				}
				
				
			}
		});
		break;
	
	//검색 결과 숙소만 포함
	case "1":
		
		$.ajax({
			url: "/ajaxStayList",
			data: value,
			type: 'post',
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
	                 +"<br>주말비용 : "+item.min_weekfee+" ~ "+item.max_weekfee
	                 +"<br>"+item.type_name+"&ensp;찜한수 : "+item.like_count+"&ensp;리뷰 : "+item.rev_count
	                 +"</p></div><div class='row'><div class='col-12'><div id='staymap"+index+"' style='width:100%;height:350px;'>"
	                 +"</div></div></div></div>";
	                 $('#staySection').append(stay);
	                  
	                  // 카카오 map API
					   var mapContainer = document.getElementById('staymap'+index), // 지도를 표시할 div 
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
				
				// 숙소 건수 갱신
				let staylength_first = $('#staySection').find('.host-item:visible').length;
				$('#staySection').find('h2').text('숙소 '+staylength_first+'건');
				
				if(staylength_first==0){
					$('#staySection').hide();
				}
				
				// 맛집 건수 갱신
				let storelength_first = $('#storeSection').find('.host-item:visible').length;
				$('#storeSection').find('h2').text('맛집 '+storelength_first+'건');
					
				if(storelength_first==0){
					$('#storeSection').hide();
				}
				
				$('#section_heading').text("숙박");
				$('#section_heading_sub').hide();
				
				
			}
		});
		break;
	
	// 검색 결과 맛집만 포함
	case "2":
			
		$.ajax({
			url: "/ajaxStoreList",
			data: value,
			type: 'post',
			dataType: 'json',
			success: function(data){
				
				var store = "";
				$.each(data, function(index, item){
					
					//맛집 검색결과 리스트
					store = 
					"<div class='host-item'><div class='row'><div class='col-5'><div class='img-wrapper'>"
	                 +"<img src='images/jj/"+item.host_photo+"' class='img-responsive'></div></div>"
	                 +"<div class='col-7'><h3>"+item.host_name+"</h3>"
	                 +"<div class='product__details__rating'>"
				                            +"<i class='fa fa-star'></i>"
				                            +"<i class='fa fa-star'></i>"
				                            +"<i class='fa fa-star'></i>"
				                            +"<i class='fa fa-star'></i>"
				                            +"<i class='fa fa-star-half-o'></i>"
				                           +"<span>"+item.host_avg+"</span>"
				                       +"</div>"
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
				
				// 숙소 건수 갱신
				let staylength_first = $('#staySection').find('.host-item:visible').length;
				$('#staySection').find('h2').text('숙소 '+staylength_first+'건');
				
				if(staylength_first==0){
					$('#staySection').hide();
				}
				
				// 맛집 건수 갱신
				let storelength_first = $('#storeSection').find('.host-item:visible').length;
				$('#storeSection').find('h2').text('맛집 '+storelength_first+'건');
					
				if(storelength_first==0){
					$('#storeSection').hide();
				}
				
				$('#section_heading').text("맛집");
				$('#section_heading_sub').hide();
				
			}
		});
		break;
		
	}
		
	
	
});


// 상세검색 체크박스로 검색조건 필터링
function regioncheck(){
	$('#storeSection').show();
	$('#staySection').show();
	$('.host-item').show();
	
	if(!document.getElementById('region0').checked){
		$('.host-item').each(function(index, item){
			if($(item).find('p').text().includes('모슬포')||$(item).find('p').text().includes('화순')){
				$(item).hide();
			}
		});
		
	}
	if(!document.getElementById('region1').checked){
		$('.host-item').each(function(index, item){
			if($(item).find('p').text().includes('서귀포')){
				$(item).hide();
			}
		});
		
	}
	if(!document.getElementById('region2').checked){
		$('.host-item').each(function(index, item){
			if($(item).find('p').text().includes('성산')||$(item).find('p').text().includes('우도')){
				$(item).hide();
			}
		});
		
	}
	
	// 맛집 건수 갱신
	var storelength = $('#storeSection').find('.host-item:visible').length;
	$('#storeSection').find('h2').text('맛집 '+storelength+'건');
	
	// 숙소 건수 갱신
	var staylength = $('#staySection').find('.host-item:visible').length;
	$('#staySection').find('h2').text('숙소 '+staylength+'건');
	
	if(storelength==0){
		$('#storeSection').hide();
	}
	
	if(staylength==0){
		$('#staySection').hide();
	}
}






 