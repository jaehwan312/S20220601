const toggleBtn = document.querySelector('.hamburger');
const menu = document.querySelector('.navbar_menu');
const user = document.querySelector('.navbar_user');
const inputBox = document.querySelector("input");
const texts = document.querySelectorAll(".text");
const search = document.querySelector(".navbar_search");
const result = document.querySelector(".search_result");

toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    user.classList.toggle('active');
});


function filter(){

	var value, name, item, i;

	value = document.getElementById("s_value").value.toUpperCase();
	item = document.getElementsByClassName("item");

	for(i=0;i<item.length;i++){
		name = item[i].getElementsByClassName("name");
		if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
			item[i].style.display = "flex";
		}else {
			item[i].style.display = "none";
		}
	}
}

$(document).click(function(e){
		if(!$(e.target).parents('.navbar_search').length < 1){
		   $(".search_result").css("display","block");		
	    }else{
	       $(".search_result").css("display","none");
	    }
});


function keyword_rel(e){
	var keywords = document.getElementsByClassName('keyword_child');
	for(var i=0; i<keywords.length; i++){
		keywords.item(i).style.color="black";
		keywords.item(i).style.borderBottom="none";
	}
	keywords.item(e).style.color = "#B2CCFF";
	keywords.item(e).style.borderBottom = "2px solid #B2CCFF";
	switch(e) {
	 case 0 : 
	 	var str="";
	 	var str2="";
	 	$.ajax({
	 		url:"/getSearchList",
	 		dataType:'json',
	 		success:function(data){
	 			$('.item').remove();
	 			$(data).each(function(){
	 				str2 = "<div class='item' onclick='searchTarget("+this.table_name+","+this.column_name+","+this.content+")'>"
			          +"<i class='fa-solid fa-magnifying-glass fa-sm'></i>"
			          +"<span class='name'>"+this.content+"</span>"
			          +"</div>";
			        str += str2;
	 			});
	 			$('.search_result').append(str);
	 		}
	 	});
	 	break;
	 case 1 : 
	 	$.ajax({
	 		
	 	});
	 	break;
	 case 2 : 
	 	break;
	 }
}

function searchTarget(a, b, c){
	alert(a);
	alert(b);
	alert(c);
}

