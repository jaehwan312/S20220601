function readURL(event){
	
	for(var host_photo of event.target.files){
		var reader = new FileReader();
	}
	
	reader.onload = function(event) {
		var img = document.createElement("img");
		console.log(img);
		img.setAttribute("src", event.target.result);
		document.querySelector("div#preview").appendChild(img);	
	};
	
	console.log(host_photo);
	reader.readAsDataURL(host_photo);
}