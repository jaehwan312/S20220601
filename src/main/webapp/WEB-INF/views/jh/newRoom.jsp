<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/template.css">
<title>제주 감수광</title>
</head>
<body>
    <div class="icon_frame">
    	<img id="msg_icon" alt="msg_icon" src="images/jh/msg_icon.png" onclick="chatOpen(${mem_num})">
    </div>
    <div class="chat_window">
    
    </div>
	<script type="text/javascript">
		function chatOpen(mem_num) {
			$(".chat_window").css("display","block");
			$.ajax(
					{
						url:"/room/new",
						type:'post',
						data:{mem_num : mem_num},
						
						dataType:'html',
						success:function(data){
							$('.chat_window').html(data);
						}

					});
			$.ajax(
					{
						url:"/getUserName",
						data:{mem_num : mem_num},
						
						dataType:'text',
						success:function(data){
							$('#userName').html(data);
						}
					}
			);
		}
	</script>
</body>
</html>