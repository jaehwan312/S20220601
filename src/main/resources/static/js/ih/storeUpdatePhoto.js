function previewFiles(e){

	var preview1 = document.querySelector("#preview1");
	var files   = document.querySelector('input[type=file]#inputInfo'+e).files;
	console.log(files);
    
	function readAndPreview(file) {
		if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
			
			var reader = new FileReader();
			
			reader.addEventListener("load", function () {
				var image = new Image();
				image.width = 200;
		        image.height = 100;
		        image.title = file.name;
		        image.src = this.result;
		        preview1.appendChild( image );
			}, false);
			
			reader.readAsDataURL(file);
		}
	   
	}
	
	if(files){
			[].forEach.call(files, readAndPreview);
	}
	
	$('#labelInfo' + e).hide();
	$('#labelInfo' + (e+1)).show();
}