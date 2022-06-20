
// 로딩되면 맛집, 숙소에 대한 검색결과 리스트로 보여줌
$(function(){
	ajaxList();
	
});



// 상세검색 조건 누르면 ajax로 리스트 리턴
function ajaxList(){
	
	var value = $('#orderAjax').serialize()+'&'+$('#storeTypeAjax').serialize()+'&'+$('#stayTypeAjax').serialize();
	var section = $('#selectionId').val();
	
	// 기본 css 초기화
	$('.host-item').remove();
	$('#stayEmpty').css('display','none');
	$('#storeEmpty').css('display','none');
	$('#totalEmpty').css('display','none');
	$('#storeSection').attr('class','col-md-6');
	
	switch(section) {
		// 검색결과 숙소+맛집 포함
		case "0" :
			
			$('#storeSection').show();
			$('#staySection').show();
			$('#emptySection').hide();
			$('#storeSection').attr('class','col-md-6 border-end');
			
			
			
			$.ajax({
			url: "/ajaxStoreList",
			data: value,
			type: 'post',
			async: false,
			dataType: 'json',
			success: function(data){
				
				var store = "";
				$.each(data, function(index, item){
					
					//맛집 검색결과 리스트
					store = 
					"<div class='host-item'><div class='row'><div class='col-5'><div class='img-wrapper' onclick='storecontent("+item.host_num+")' style='cursor: pointer;'>"
	                 +"<img src='images/jj/"+item.host_photo+"' class='img-responsive'></div></div>"
	                 +"<div class='col-7'><h3 id='storename"+index+"' onclick='storecontent("+item.host_num+")' style='cursor: pointer;'>"+item.host_name+"</h3>"
	                 +"<div class='limitbox'>"
	                 +"<div class='star-inner'>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                     +"<span class='ratingnumber'>"+item.host_avg+" / 5</span>"
                     +"</div>"
                     +"<div class='star-outer' style='width: "+Math.floor(item.host_avg)*20+"%'>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                     +"</div>"
                     +"<div class='star-outer-half' id='store-star-half"+index+"'><i class='fa fa-star-half'></i></div>"
                     +"</div>"
				     +"<div class='mapButton'><button class='btn btn-secondary' onclick='storemap("+index+")'>지도</button></div>"
	                 +"<p id='storeaddr"+index+"'>"+item.host_addr+"</p><p>가격대 : "+item.min_price+"~"+item.max_price+"</p>"
	                 +"<span class='information'>"+item.type_name+"</span>"
	                 +"<i class='fa fa-heart fa-md heartLike' id='storeLike"+index+"' onclick=\'storeLikeAction("+index+","+item.host_num+",\""+item.host_name+"\")\'></i>"
	                 +"<span class='information' id='storeLikes"+index+"'>"+item.like_count+"</span>"
	                 +"<i class='fa fa-file-pen fa-md reviewCount'></i><span class='information'>"+item.rev_count+"</span>"
	                 +"</div><div class='row'><div class='col-12'><div class='maps' id='storemap"+index+"' style='width:100%;height:350px;'>"
	                 +"</div></div></div></div>";
	                 $('#storeSection').append(store);
	                 // 별점 소숫점 반영
	                 if(item.host_avg-(Math.floor(item.host_avg))>0){
	                 	$('#store-star-half'+index).css('display','inline-block');
	                 }
	                 // 본인 찜하기 유무 반영
	                 if(item.my_like==1){
	                 	$('#storeLike'+index).css('color','red');
	                 }
	                  
	                  
				});
				
				// 맛집 건수 갱신
				var storelength = $('#storeSection').find('.host-item').length;
				$('#storeSection').find('h2:first-child').text('맛집 검색결과 '+storelength+'건');
				
				// 검색결과 없음 활성화
				if(storelength == 0){
					$('#storeEmpty').css('display','block');
				}
				
				
			}
		});
		
		
		$.ajax({
			url: "/ajaxStayList",
			data: value,
			type: 'post',
			async: false,
			dataType: 'json',
			success: function(data){
				
				var stay = "";
				$.each(data, function(index, item){
					
					//숙소 검색결과 리스트
					stay = 
					"<div class='host-item'><div class='row'><div class='col-5'><div class='img-wrapper' onclick='staycontent("+item.host_num+")' style='cursor: pointer;'>"
	                 +"<img src='images/jj/"+item.host_photo+"' class='img-responsive'></div></div>"
	                 +"<div class='col-7'><h3 id='stayname"+index+"' onclick='staycontent("+item.host_num+")' style='cursor: pointer;'>"+item.host_name+"</h3>"
	                 +"<div class='limitbox'>"
	                 +"<div class='star-inner'>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                     +"<span class='ratingnumber'>"+item.host_avg+" / 5</span>"
                     +"</div>"
                     +"<div class='star-outer' style='width: "+Math.floor(item.host_avg)*20+"%'>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                     +"</div>"
                     +"<div class='star-outer-half' id='stay-star-half"+index+"'><i class='fa fa-star-half'></i></div>"
                     +"</div>"
				     +"<div class='mapButton'><button class='btn btn-secondary' onclick='staymap("+index+")'>지도</button></div>"
					 +"<p id='stayaddr"+index+"'>"+item.host_addr+"</p>"
					 +"<p>평일비용 : "+item.min_dayfee+"~"+item.max_dayfee+"</p>"
					 +"<p>주말비용 : "+item.min_weekfee+"~"+item.max_weekfee+"</p>"
	                 +"<span class='information'>"+item.type_name+"</span>"
	                 +"<i class='fa fa-heart fa-md heartLike' id='stayLike"+index+"' onclick=\'stayLikeAction("+index+","+item.host_num+",\""+item.host_name+"\")\'></i>"
	                 +"<span class='information' id='stayLikes"+index+"'>"+item.like_count+"</span>"
	                 +"<i class='fa fa-file-pen fa-md reviewCount'></i><span class='information'>"+item.rev_count+"</span>"
	                 +"</div><div class='row'><div class='col-12'><div class='maps' id='staymap"+index+"' style='width:100%;height:350px;'>"
	                 +"</div></div></div></div>";
	                 $('#staySection').append(stay); 
	                 //별점 소숫점 반영
	                 if(item.host_avg-(Math.floor(item.host_avg))>0){
	                 	$('#stay-star-half'+index).css('display','inline-block');
	                 }
	                 // 본인 찜하기 유무 반영
	                 if(item.my_like==1){
	                 	$('#stayLike'+index).css('color','red');
	                 }
	                 
				});
				
				// 숙소 건수 갱신
				var staylength = $('#staySection').find('.host-item').length;
				$('#staySection').find('h2:first-child').text('숙소 검색결과 '+staylength+'건');
				
				// 검색결과 없음 활성화
				if(staylength == 0){
					$('#stayEmpty').css('display','block');
				}
				
				
			}
		});
		
		var staylength = $('#staySection').find('.host-item').length;
		var storelength = $('#storeSection').find('.host-item').length;
		// 검색결과 없음 활성화
		if(staylength == 0 && storelength == 0){
			$('#stayEmpty').css('display','none');
			$('#storeEmpty').css('display','none');
			$('#totalEmpty').css('display','block');
		}
		
		break;
	
	//검색 결과 숙소만 포함
	case "1":
		
		// section 헤더 이름 변경
		$('#storeSection').hide();
		$('#staySection').show();
		$('#emptySection').hide();
		
		
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
					"<div class='host-item'><div class='row'><div class='col-5'><div class='img-wrapper' onclick='staycontent("+item.host_num+")' style='cursor: pointer;'>"
	                 +"<img src='images/jj/"+item.host_photo+"' class='img-responsive'></div></div>"
	                 +"<div class='col-7'><h3 id='stayname"+index+"' onclick='staycontent("+item.host_num+")' style='cursor: pointer;'>"+item.host_name+"</h3>"
	                 +"<div class='limitbox'>"
	                 +"<div class='star-inner'>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                     +"<span class='ratingnumber'>"+item.host_avg+" / 5</span>"
                     +"</div>"
                     +"<div class='star-outer' style='width: "+Math.floor(item.host_avg)*20+"%'>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                     +"</div>"
                     +"<div class='star-outer-half' id='stay-star-half"+index+"'><i class='fa fa-star-half'></i></div>"
                     +"</div>"
				     +"<div class='mapButton'><button class='btn btn-secondary' onclick='staymap("+index+")'>지도</button></div>"
					 +"<p id='stayaddr"+index+"'>"+item.host_addr+"</p>"
					 +"<p>평일비용 : "+item.min_dayfee+"~"+item.max_dayfee+"</p>"
					 +"<p>주말비용 : "+item.min_weekfee+"~"+item.max_weekfee+"</p>"
	                 +"<span class='information'>"+item.type_name+"</span>"
	                 +"<i class='fa fa-heart fa-md heartLike' id='stayLike"+index+"' onclick=\'stayLikeAction("+index+","+item.host_num+",\""+item.host_name+"\")\'></i>"
	                 +"<span class='information' id='stayLikes"+index+"'>"+item.like_count+"</span>"
	                 +"<i class='fa fa-file-pen fa-md reviewCount'></i><span class='information'>"+item.rev_count+"</span>"
	                 +"</div><div class='row'><div class='col-12'><div class='maps' id='staymap"+index+"' style='width:100%;height:350px;'>"
	                 +"</div></div></div></div>";
	                 $('#staySection').append(stay); 
	                 //별점 소숫점 반영
	                 if(item.host_avg-(Math.floor(item.host_avg))>0){
	                 	$('#stay-star-half'+index).css('display','inline-block');
	                 }
	                 // 본인 찜하기 유무 반영
	                 if(item.my_like==1){
	                 	$('#stayLike'+index).css('color','red');
	                 }
	                  
				});
				
				// 숙소 건수 갱신
				var staylength = $('#staySection').find('.host-item:visible').length;
				$('#staySection').find('h2:first-child').text('숙소 검색결과 '+staylength+'건');
				
				
				// 검색결과 없음 활성화
				if(staylength == 0){
					$('#stayEmpty').css('display','block');
				}
				
			}
		});
		
		
		break;
	
	// 검색 결과 맛집만 포함
	case "2":
		
		$('#staySection').hide();
		$('#storeSection').show();
		$('#emptySection').hide();
			
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
					"<div class='host-item'><div class='row'><div class='col-5'><div class='img-wrapper' onclick='storecontent("+item.host_num+")' style='cursor: pointer;'>"
	                 +"<img src='images/jj/"+item.host_photo+"' class='img-responsive'></div></div>"
	                 +"<div class='col-7'><h3 id='storename"+index+"' onclick='storecontent("+item.host_num+")' style='cursor: pointer;'>"+item.host_name+"</h3>"
	                 +"<div class='limitbox'>"
	                 +"<div class='star-inner'>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                     +"<span class='ratingnumber'>"+item.host_avg+" / 5</span>"
                     +"</div>"
                     +"<div class='star-outer' style='width: "+Math.floor(item.host_avg)*20+"%'>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                        +"<i class='fa fa-star'></i>"
                     +"</div>"
                     +"<div class='star-outer-half' id='store-star-half"+index+"'><i class='fa fa-star-half'></i></div>"
                     +"</div>"
				     +"<div class='mapButton'><button class='btn btn-secondary' onclick='storemap("+index+")'>지도</button></div>"
	                 +"<p id='storeaddr"+index+"'>"+item.host_addr+"</p><p>가격대 : "+item.min_price+"~"+item.max_price+"</p>"
	                 +"<span class='information'>"+item.type_name+"</span>"
	                 +"<i class='fa fa-heart fa-md heartLike' id='storeLike"+index+"' onclick=\'storeLikeAction("+index+","+item.host_num+",\""+item.host_name+"\")\'></i>"
	                 +"<span class='information' id='storeLikes"+index+"'>"+item.like_count+"</span>"
	                 +"<i class='fa fa-file-pen fa-md reviewCount'></i><span class='information'>"+item.rev_count+"</span>"
	                 +"</div><div class='row'><div class='col-12'><div class='maps' id='storemap"+index+"' style='width:100%;height:350px;'>"
	                 +"</div></div></div></div>";
	                 $('#storeSection').append(store);
	                  // 별점 소숫점 반영
	                 if(item.host_avg-(Math.floor(item.host_avg))>0){
	                 	$('#store-star-half'+index).css('display','inline-block');
	                 }
	                 // 본인 찜하기 유무 반영
	                 if(item.my_like==1){
	                 	$('#storeLike'+index).css('color','red');
	                 }
	                  
	                  
				});
				
				// 맛집 건수 갱신
				var storelength = $('#storeSection').find('.host-item:visible').length;
				$('#storeSection').find('h2:first-child').text('맛집 검색결과 '+storelength+'건');
				
				// 검색결과 없음 활성화
				if(storelength == 0){
					$('#storeEmpty').css('display','block');
				}
				
			}
		});

		break;
		
	}
	
	
}

// 상세검색 조건 활성화
function collapse(){
	if($('.detail').css('display')=="block"){
		$('.detail').css('display','none');
	}else{
		$('.detail').css('display','block');
	}
}


// 맛집 지도 버튼으로 활성화
function storemap(e){
	if($('#storemap'+e).css('display')=="block"){
		$('#storemap'+e).css('display','none');
	}else {
		$('#storemap'+e).css('display','block');
		
		// 카카오 map API
	   var mapContainer = document.getElementById('storemap'+e), // 지도를 표시할 div 
	   	       mapOption = {
	           center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	           level: 3 // 지도의 확대 레벨
	       };
	   var host_addr = document.getElementById('storeaddr'+e).innerHTML;
	   var host_name = document.getElementById('storename'+e).innerHTML;  
	
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
		
	}
}
 
// 숙소 지도 버튼으로 활성화
function staymap(e){
	if($('#staymap'+e).css('display')=="block"){
		$('#staymap'+e).css('display','none');
	}else {
		$('#staymap'+e).css('display','block');
		
		// 카카오 map API
	   var mapContainer = document.getElementById('staymap'+e), // 지도를 표시할 div 
	       mapOption = {
	           center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	           level: 3 // 지도의 확대 레벨
	       };  
	   var host_addr = document.getElementById('stayaddr'+e).innerHTML;
	   var host_name = document.getElementById('stayname'+e).innerHTML; 
	
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
	}
}

// 맛집 컨텐츠 이동
function storecontent(e){
	location.href="storeRead?host_num="+e;
}

// 숙소 컨텐츠 이동
function staycontent(e){
	location.href="stayRead?host_num="+e;
}

// 맛집, 숙소, 맛집+숙소 선택
function selectSection(e){
	$('#selectionId').val(e);
	ajaxList();
}

// 맛집 찜하기 ajax in/out
function storeLikeAction(index, host_num, host_name){
	var mem_num = $('#login_check').val();
	var color = $('#storeLike'+index).css('color');
	var msg = "";
	if(color=='rgb(128, 128, 128)'){
		msg += " 찜하러 갑숴?";
	}else if(color=='rgb(255, 0, 0)'){
		msg += " 찜하기를 해제하시겠습니까?";
	}
	if(confirm(host_name+msg)){
		if(mem_num!=0){
			$.ajax({
				type: 'POST',
				url: 'ajaxLikeInOut',
				data: {host_num:host_num},
				dataType: 'JSON',
				success: function(data){
					$('#storeLikes'+index).text(data.like_count);
					if(data.my_like==0){
						$('#storeLike'+index).css('color','gray');
					}else if(data.my_like==1){
						$('#storeLike'+index).css('color','red');
					}
				}
			});
		} else {
			alert("찜하기는 로그인을 해야 가능합니다");
			return;
		}
	} else{
		return;
	}
}

// 숙소 찜하기 ajax in/out
function stayLikeAction(index, host_num, host_name){
	var mem_num = $('#login_check').val();
	var color = $('#stayLike'+index).css('color');
	var msg = "";
	if(color=='rgb(128, 128, 128)'){
		msg += " 찜하러 갑숴?";
	}else if(color=='rgb(255, 0, 0)'){
		msg += " 찜하기를 해제하시겠습니까?";
	}
	
	if(confirm(host_name+msg)){
		if(mem_num!=0){
			$.ajax({
				type: 'POST',
				url: 'ajaxLikeInOut',
				data: {host_num:host_num},
				dataType: 'JSON',
				success: function(data){
					$('#stayLikes'+index).text(data.like_count);
					if(data.my_like==0){
						$('#stayLike'+index).css('color','gray');
					}else if(data.my_like==1){
						$('#stayLike'+index).css('color','red');
					}
				}
			});
		}else {
			alert("찜하기는 로그인을 해야 가능합니다");
			return;
		}
	} else{
		return;
	}
}
