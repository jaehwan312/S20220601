function recDel(e, text){
	if(confirm("추천검색어 "+text+"를 삭제하시겠습니까?")){
		$('#keywordDelId').val(e);
		$('#keywordDelForm').submit();
	}
}