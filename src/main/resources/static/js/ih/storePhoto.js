function previewFiles(e){

	var preview = document.querySelector("#preview");
	var files   = document.querySelector('input[type=file]#inputInfo'+e).files;
	console.log(files);
    
	function readAndPreview(file) {
		if ( /\.(jpe?g|png|gif|webp|svg)$/i.test(file.name) ) {
			
			var reader = new FileReader();
			
			reader.addEventListener("load", function () {
				var image = new Image();
				image.width = 100;
		        image.height = 100;
		        image.title = file.name;
		        image.src = this.result;
		        preview.appendChild( image );
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