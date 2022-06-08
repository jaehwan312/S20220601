
// fullpage 준비
$(document).ready(function() {
			$('#fullpage').fullpage({
				onLeave: function(origin, destination, direction){
					var leavingSection = this;

					//구역 1를 떠난 후
					if(origin.index == 0 && direction =='down'){
						alert("이벤트발생");
					}
				}
			});
		});

// 메인화면 숫자 카운팅효과
 $('.counter').counterUp({
    delay: 10,
    time: 2000
});		

// 메인페이지에서 검색바 헤더에서 숨기기
$(function(){
	if(location.pathname == '/main'){
		$('.navbar_search').hide();
		$('.navbar_search_alter').show();
	}else{
		$('.navbar_search').show();
		$('.navbar_search_alter').hide();
	}
});



// 추천, 인기검색어 관련 함수(메인)
function keyword_rel_main(e){
	for(var i=0; i<keywords.length; i++){
		keywords_main.item(i).style.color="black";
		keywords_main.item(i).style.borderBottom="none";
	}
	keywords_main.item(e).style.color = "#B2CCFF";
	keywords_main.item(e).style.borderBottom = "2px solid #B2CCFF";
	switch(e) {
	 case 0 : 
	 	$('#autoMaker_main').children().remove();
	 	var r_result="";
	 	var rec="";
	 	var rec2="";
	 	$.ajax({
	 		url:"/getRecList",
	 		dataType:'json',
	 		success:function(data){
				$(data).each(function(){
					rec2 = "<div class='item_main' onclick='selectSearch(this)'>"
				          +"<i class='fa-solid fa-magnifying-glass fa-sm'></i>"
				          +"<span class='name'>"+this+"</span>"
				          +"</div>";
				    rec += rec2;
				});
				$('#autoMaker_main').append(rec);	
	 		}
	 	});
	 	break;
	 case 1 : 
	 	$('#autoMaker_main').children().remove();
	 	var p_result="";
	 	var pop="";
	 	var pop2="";
	 	$.ajax({
	 		url:"/getPopList",
	 		dataType:'json',
	 		success:function(data){
				$(data).each(function(){
					pop2 = "<div class='item_main' onclick='selectSearch(this)'>"
				          +"<i class='fa-solid fa-magnifying-glass fa-sm'></i>"
				          +"<span class='name'>"+this+"</span>"
				          +"</div>";
				    pop += pop2;
				});
				$('#autoMaker_main').append(pop);	
	 		}
	 	});
	 	break;
	 }
}



//검색바 클릭할 경우(메인)
$("#main_search").click(function(e){
	$("#search_result_main").css("display","block");
	$(".main_background").css("display", "block");
	$.ajax({
 		url:"/getSearchList",
 		dataType:'json',
 		success:function(data){
			s_result = data;
 		}
 	});
 	// 메인 검색창클릭할경우 스크롤 fullpage 얼림
	// $('body').addClass('fixed');
	$('body').on('scroll touchmove mousewheel', function(event) {
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
});



//그림자배경 클릭할 경우(메인)
$(".main_background").click(function(e){
	$("#search_result_main").css("display","none");
	$(".main_background").css("display", "none");
	
	// 배경 클릭할 경우 fullpage 얼림 해제
	// $('body').removeClass('fixed');
	$('body').off('scroll touchmove mousewheel');
});



var isComplete = false;  //autoMaker 자식이 선택 되었는지 여부
var s_result="";
 	
// 검색어를 입력하면 추천,인기검색어 삭제 후 연관검색어 활성화 (메인)
$('#searchBar').keyup(function(){
    var txt = $(this).val();
    if(txt != ''){  // 내용이 있으면
        $('#autoMaker_main').children().remove();
        $('.keyword_main').css("display","none");
		var str="";
        s_result.forEach(function(arg){
            if(arg.indexOf(txt) > -1 ){
            	str = "<div class='item_main' onclick='selectSearch(this)'>"
			          +"<i class='fa-solid fa-magnifying-glass fa-sm'></i>"
			          +"<span class='name'>"+arg+"</span>"
			          +"</div>";
                $('#autoMaker_main').append(str);		
            }
        });
        $('#autoMaker_main').children().each(function(){
            $(this).click(function(){
            	$(".header_background").css("display", "none");
                $('#searchBar').val($(this).text());
              //  $('#insert_target').val("key : "+$(this).attr('key')+ ", data : " + $(this).text());
                $('#autoMaker_main').children().remove();
                isComplete = true;
            });
        });			
    } else {
    	$(".main_background").css("display", "block");
        $('#autoMaker_main').children().remove();
        $('.keyword_main').css("display","flex");
    }  
});



//검색결과 클릭하면 글자가져오고 리셋(메인)
$('#searchBar').keydown(function(event){
    if(isComplete) {  
   //     $('#insert_target').val('')	
   		$("#search_result_main").css("display","block");	
		   $.ajax({
		 		url:"/getSearchList",
		 		dataType:'json',
		 		success:function(data){
					s_result = data;
		 		}
		 	});
		 
    }
});


// 메인 검색창 placeholder 입력 애니메이션

var typingBool = false; 
var typingIdx=0; 
var liIndex = 0;
var liLength = $(".typing-txt>ul>li").length;

// 타이핑될 텍스트를 가져온다 
var typingTxt = $(".typing-txt>ul>li").eq(liIndex).text(); 
typingTxt=typingTxt.split(""); // 한글자씩 자른다. 
if(typingBool==false){ // 타이핑이 진행되지 않았다면 
    typingBool=true; 
    var tyInt = setInterval(typing,200); // 반복동작 
} 
     
var str="";
function typing(){ 
  if(typingIdx<typingTxt.length){ // 타이핑될 텍스트 길이만큼 반복 
     str += typingTxt[typingIdx]; // 한글자씩 이어준다. 
     $("#searchBar").attr('placeholder',str);
     typingIdx++; 
   } else{ //한문장이끝나면
     //다음문장으로.. 마지막문장이면 다시 첫번째 문장으로 
     if(liIndex>=liLength-1){
       liIndex=0;
     }else{
       liIndex++; 
     }
     
     //다음문장을 타이핑하기위한 셋팅
        typingIdx=0;
        typingBool = false; 
        typingTxt = $(".typing-txt>ul>li").eq(liIndex).text(); 
       
     //다음문장 타이핑전 1.5초 쉰다
         clearInterval(tyInt);
         setTimeout(function(){
         	str="";
         	$("#searchBar").attr('placeholder',str);
           tyInt = setInterval(typing,200);
         },1500);
    } 
}  


// 배경이미지 랜덤 출력
 var images = ['jj1.jpg', 'jj2.jpg', 'jj3.jpg', 'jj4.jpg', 'jj5.jpg', 'jj6.jpg', 'jj7.jpg', 'jj8.jpg', 'jj9.jpg'];
 $('.bg_img').css({'background-image': 'url(../images/' + images[Math.floor(Math.random() * images.length)] + ')'});
 
 

// 메인검색바 엔터키로 이벤트발생
function mainEnter(){
	if(window.event.keyCode == 13){
		inputSearch();
	}
}