$.ajax({
    url : "/stayInfo",
    dataType : "text",
    type : "get"
    data : sendData,  
    success : function(data){
        $("#stay").html(data);
    }
});