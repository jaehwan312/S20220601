const toggleBtn = document.querySelector('.hamburger');
const menu = document.querySelector('.navbar_menu');
const user = document.querySelector('.navbar_user');

const inputBox = document.querySelector("input");
const recommendBox = document.querySelector("#recommend");
const texts = document.querySelectorAll(".text");

toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    user.classList.toggle('active');
});



inputBox.addEventListener("keyup", (e) => {
	if (e.target.value.length > 0) {
		recommendBox.classList.remove('word_box');
		texts.forEach((textEl) => {
			textEl.textContent = e.target.value;
		})
	} else {
		recommendBox.classList.add('word_box');
	}
})

var searchBar = false;

inputBox.addEventListener("click", (e) => {
	recommendBox.classList.remove('word_box');
	texts.forEach((textEl) => {
		textEl.textContent = e.target.value;
	})
	return searchBar = true;
})

document.addEventListener("click", (e) => {
	alert("document실행");
	if(searchBar == true) {
		recommendBox.classList.remove('word_box');
		return searchBar = false;
	}
})
