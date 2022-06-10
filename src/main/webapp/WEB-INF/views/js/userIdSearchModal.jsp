<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		// 1. 모달창 히든 불러오기
		$('#searchBtn').click(function() {
			$('#background_modal').show();
		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			$('#background_modal').hide();
		});
		// 3. 모달창 위도우 클릭 시 닫기
		$(window).on('click', function() {
			if (event.target == $('#background_modal').get(0)) {
	            $('#background_modal').hide();
	         }
		});
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="background_modal" class="background_modal">
		<div class="modal_contents">
			<h4>
				<b>손님 아이디는?</b><span class="close">&times;</span>
			</h4><br>
				<h2 id="id_value"></h2>
			<br>
			<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
			<i class="fa fa-envelope"></i>비밀번호 찾기</button>
		</div>
	</div>	
</body>
</html>