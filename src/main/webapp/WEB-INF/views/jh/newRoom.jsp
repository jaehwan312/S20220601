<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/jh/chat.css">
<title>제주 감수광</title>
</head>
<body>
    <div class="icon_frame" id="chatNew">
    	<img id="msg_icon" alt="msg_icon" src="images/jh/msg_icon.png" onclick="chatOpen(${mem_num})">
    </div>
    <div class="icon_frame" id="chatIng">
    	<img id="msg_icon" alt="msg_icon" src="images/jh/msg_icon.png" onclick="chatActive()">
    </div>
    <div class="chat_window">
    
    </div>
	<script type="text/javascript" src="js/jh/chat.js" defer></script>
</body>
</html>