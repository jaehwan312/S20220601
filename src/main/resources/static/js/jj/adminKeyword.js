// 삭제 확인
function recDel(e, text){
	if(confirm("추천검색어 "+text+"를 삭제하시겠습니까?")){
		$('#keywordDelId').val(e);
		$('#keywordDelForm').submit();
	}
}

// 수정버튼 눌렀을때 수정 활성화
function recUpdate(e, num){
	var str="";
	var option = "";
	$.ajax({
		url: "/keywordSearch",
		type: 'GET',
		data: {search_num:num},
		dataType: 'json',
		success: function(data){
			$('#listRow'+e).empty();
			if(data.search_count==1){
				option =  '<option value="1" selected>1순위</option>'
						  +'<option value="2">2순위</option>'
						  +'<option value="3">3순위</option>';
			}else if(data.search_count==2){
				option =  '<option value="1">1순위</option>'
						  +'<option value="2" selected>2순위</option>'
						  +'<option value="3">3순위</option>';
			}else if(data.search_count==3){
				option =  '<option value="1">1순위</option>'
						  +'<option value="2">2순위</option>'
						  +'<option value="3" selected>3순위</option>';
			}
			str = '<td id="listRow'+e+'">'
        		+'<select id="" class="form-select" aria-label="Default select example" name="search_count">'
				  +option
				+'</select>'
        	+'</td>'
        	+'<td>'
        		+'<input type="text" name="keyword" class="form-control" value="'+data.keyword+'">'
        	+'</td>'
        	+'<td>'
        		+'20220601'
        	+'</td>'
        	+'<td>'
        		+'<div class="row col-12">'
        			+'<div class="col-12">'
						+'<button class="btn btn-primary btn-sm col-12" type="button" onclick="updateDone('+e+','+data.search_num+')">수정완료</button>'
					+'</div>'
				+'</div>'
        	+'</td>'
        	
        	$('#listRow'+e).append(str);
		}
	});
}

// 수정완료 버튼 눌렀을때 바뀐값으로 리스트목록 변경
function updateDone(e, num){
	var count = $('#listRow'+e).find('select').val();
	var keyword = $('#listRow'+e).find('input').val();
	var str = "";
	$.ajax({
		url: "/keywordUpdate",
		type: "get",
		data: {search_num:num, search_count:count, keyword:keyword},
		dataType: 'json',
		success: function(data){
			$('#listRow'+e).empty();
			str += '<td>'+data.search_count+'</td>'
		        	+'<td>'+data.keyword+'</td>'
		        	+'<td>'+data.search_day+'</td>'
		        	+'<td>'
		        		+'<div class="row col-12">'
		        		+'<div class="col-6">'
		        			+'<button class="btn btn-primary btn-sm col-12" type="button" onclick="recUpdate('+e+', '+data.search_num+')">수정</button>'
		        		+'</div>'
		        		+'<div class="col-6">'
		            		+'<button class="btn btn-primary btn-sm col-12" type="button" onclick="recDel('+data.search_num+', \''+data.keyword+'\')">삭제</button>'
		            	+'</div>'
		            	+'</div>'
		        	+'</td>'
			 $('#listRow'+e).append(str);
		}
		
	});
}