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
		}else{
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


