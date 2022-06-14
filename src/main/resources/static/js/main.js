const toggleBtn = document.querySelector('.hamburger');
const menu = document.querySelector('.navbar_menu');
const user = document.querySelector('.navbar_user');
const inputBox = document.querySelector("input");
const texts = document.querySelectorAll(".text");
const search = document.querySelector(".navbar_search");
const result = document.querySelector(".search_result");
const keywords = document.getElementsByClassName('keyword_child');
const keywords_main = document.getElementsByClassName('keyword_child_main');



toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    user.classList.toggle('active');
});



// 추천, 인기검색어 관련 함수(헤더)
function keyword_rel(e){
	for(var i=0; i<keywords.length; i++){
		keywords.item(i).style.color="black";
		keywords.item(i).style.borderBottom="none";
	}
	keywords.item(e).style.color = "#B2CCFF";
	keywords.item(e).style.borderBottom = "2px solid #B2CCFF";
	switch(e) {
	 case 0 : 
	 	$('#autoMaker').children().remove();
	 	var r_result="";
	 	var rec="";
	 	var rec2="";
	 	$.ajax({
	 		url:"/getRecList",
	 		dataType:'json',
	 		success:function(data){
				$(data).each(function(){
					rec2 = "<div class='item' onclick='selectSearch(this)'>"
				          +"<i class='fa-solid fa-magnifying-glass fa-sm'></i>"
				          +"<span class='name'>"+this+"</span>"
				          +"</div>";
				    rec += rec2;
				});
				$('#autoMaker').append(rec);	
	 		}
	 	});
	 	break;
	 case 1 : 
	 	$('#autoMaker').children().remove();
	 	var p_result="";
	 	var pop="";
	 	var pop2="";
	 	$.ajax({
	 		url:"/getPopList",
	 		dataType:'json',
	 		success:function(data){
				$(data).each(function(){
					pop2 = "<div class='item' onclick='selectSearch(this)'>"
				          +"<i class='fa-solid fa-magnifying-glass fa-sm'></i>"
				          +"<span class='name'>"+this+"</span>"
				          +"</div>";
				    pop += pop2;
				});
				$('#autoMaker').append(pop);	
	 		}
	 	});
	 	break;
	 }
}


//검색바 클릭할 경우(헤더)
$(".navbar_search").click(function(e){
	$(".search_result").css("display","block");
	$(".header_background").css("display", "block");
	$.ajax({
 		url:"/getSearchList",
 		dataType:'json',
 		success:function(data){
			s_result = data;
 		}
 	});
});

//그림자배경 클릭할 경우(헤더)
$(".header_background").click(function(e){
	$(".search_result").css("display","none");
	$(".header_background").css("display", "none");
});



var isComplete = false;  //autoMaker 자식이 선택 되었는지 여부
var s_result="";
// 검색어를 입력하면 추천,인기검색어 삭제 후 연관검색어 활성화 (헤더)
$('#search_area').keyup(function(){
    var txt = $(this).val();
    if(txt != ''){  // 내용이 있으면
        $('#autoMaker').children().remove();
        $('.keyword').css("display","none");
		var str="";
        s_result.forEach(function(arg){
            if(arg.indexOf(txt) > -1 ){
            	str = "<div class='item' onclick='selectSearch(this)'>"
			          +"<i class='fa-solid fa-magnifying-glass fa-sm'></i>"
			          +"<span class='name'>"+arg+"</span>"
			          +"</div>";
                $('#autoMaker').append(str);		
            }
        });
        $('#autoMaker').children().each(function(){
            $(this).click(function(){
            	$(".header_background").css("display", "none");
                $('#search_area').val($(this).text());
              //  $('#insert_target').val("key : "+$(this).attr('key')+ ", data : " + $(this).text());
                $('#autoMaker').children().remove();
                isComplete = true;
            });
        });			
    } else {
    	$(".header_background").css("display", "block");
        $('#autoMaker').children().remove();
        $('.keyword').css("display","flex");
    }  
});


//검색결과 클릭하면 글자가져오고 리셋(헤더)
$('#search_area').keydown(function(event){
    if(isComplete) {  
   //     $('#insert_target').val('')	
   		$(".search_result").css("display","block");	
		   $.ajax({
		 		url:"/getSearchList",
		 		dataType:'json',
		 		success:function(data){
					s_result = data;
		 		}
		 	});
		 
    }
});



// 추천,인기검색어 클릭할 경우 해당 값으로 검색 실행(메인)
function selectSearch(id){
	var selectedKeyword = $(id).children('span').text();
	$('#search_area').val(selectedKeyword);
	document.getElementById('search_form').submit();
}


// 헤더검색바 엔터키로 이벤트발생
function headerEnter(){
	if(window.event.keyCode == 13){
		document.getElementById('search_area').submit();
	}
}


