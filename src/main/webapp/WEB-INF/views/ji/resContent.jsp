<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/ji/resContent.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>제주 감수광</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cbx_chkAll").click(function() {
			if ($("#cbx_chkAll").is(":checked"))
				$("input[name=chk]").prop("checked", true);
			else
				$("input[name=chk]").prop("checked", false);
		});

		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;

			if (total != checked)
				$("#cbx_chkAll").prop("checked", false);
			else
				$("#cbx_chkAll").prop("checked", true);
		});
	});
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
		<br> <br>
		
		
		
		

		<div class="cbx_agree">

			<div class="form-check">
				<input class="form-check-input" type="checkbox" value=""
					id="cbx_chkAll"> <label class="form-check-label"
					for="flexCheckDefault" id = chkAll>전체 동의 </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value=""
					id="flexCheckDefault" name="chk"> <label
					class="form-check-label" for="flexCheckDefault"> 숙소이용규칙 및
					취소/환불규정 동의 (필수) </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value=""
					id="flexCheckChecked" name="chk"> <label
					class="form-check-label" for="flexCheckChecked">개인정보 수집 및
					이용 동의 (필수) </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value=""
					id="flexCheckChecked" name="chk"> <label
					class="form-check-label" for="flexCheckChecked"> 개인정보 제 3자
					제공 동의 (필수) </label>
			</div>
		</div>


		<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>