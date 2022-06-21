<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/template.css">
<link rel="stylesheet" href="css/js/loginPage.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<title>제주 감수광</title>
</head>
<script type="text/javascript">
	function message() {
		var value2 = "${msg}";
		if(value2 != ""){
			alert(value2);
		}
	}
	
	function updateUser(num, index) {
			var mem_num  = num;	
			var gradeStr = "";
			var buttonStr = "";
			$.ajax({
				type : "POST",
				url : "/updateUser1",
				data : {mem_num : mem_num},
				dataType : 'json',
				success: function(data){
					if(data != null){
						alert("등급변경에 성공했습니다.");
					} else {
						alert("등급변경에 실패했습니다.")
					}
					
					$('#grade'+index).empty();
					$('#button'+index).empty();
					if(data.grade=='1'){
						gradeStr = '관리자';
						buttonStr = '<button onclick="updateUser('+data.mem_num+')" class="btn btn-sm btn-primary">일반회원으로변경</button>';
					}else if(data.grade=='2') {
						gradeStr = '일반회원';
						buttonStr = '<button onclick="updateAdmin()" class="btn btn-sm btn-primary">관리자로변경</button>';
					}
					
					$('#grade'+index).append(gradeStr);
					$('#button'+index).append(buttonStr);
					
				}
			});
	};
	
	function updateAdmin(num, index) {
		var mem_num  = num;	
		var gradeStr = "";
		var buttonStr = "";
		$.ajax({
			type : "POST",
			url : "/updateAdmin1",
			data : {mem_num : mem_num},
			dataType : 'json',
			success: function(data){
				if(data != null){
					alert("등급변경에 성공했습니다.");
				} else {
					alert("등급변경에 실패했습니다.")
				}
				
				$('#grade'+index).empty();
				$('#button'+index).empty();
				if(data.grade=='1'){
					gradeStr = '관리자';
					buttonStr = '<button onclick="updateUser('+data.mem_num+')" class="btn btn-sm btn-primary">일반회원으로변경</button>';
				}else if(data.grade=='2') {
					gradeStr = '일반회원';
					buttonStr = '<button onclick="updateAdmin()" class="btn btn-sm btn-primary">관리자로변경</button>';
				}
				
				$('#grade'+index).append(gradeStr);
				$('#button'+index).append(buttonStr);
				
			}
		});
};
</script>
<body onload="message()">
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
			<form action="userListKeyword">
		        <input type="hidden" name="currentPage" value="${pg.currentPage }">
		   		<select name="search">
						<option value="s_all">전체조회</option>
						<option value="s_id">아이디조회</option>
						<option value="s_name">이름조회</option>
				</select> 
		   
		        <input type="text" name="keyword"   placeholder="keyword을 입력하세요">
		        <button type="submit">회원검색 </button><p>
		    </form>
		    
			<div class="table-responsive">
				<table class="table table-striped table-sm"> 
					<tr><th>회원번호</th><th>아이디</th><th>이름</th><th>전화번호</th><th>이메일</th><th>회원등급</th><th>등급변경</th></tr>
					<c:forEach var="profile" items="${profileList}" varStatus="i">
						<tr><td>${profile.mem_num }</td>
						    <td><a href="detail?id=${profile.id}">${profile.id}</a></td>
						    <td>${profile.name }</td><td>${profile.phone }</td><td>${profile.email }</td>
						    <td id="grade${i.index }"><c:if test="${profile.grade == 1}">관리자</c:if><c:if test="${profile.grade == 2 }">일반회원</c:if></td>
						    <td id="button${i.index }"><c:if test="${profile.grade == 1}">
						    		<button onclick="updateUser(${profile.mem_num}, ${i.index })" class="btn btn-sm btn-primary">일반회원으로변경</button>
						    	</c:if>
						    	<c:if test="${profile.grade == 2}">
						    		<button onclick="updateAdmin(${profile.mem_num}, ${i.index })" class="btn btn-sm btn-primary">관리자로변경</button>
						    	</c:if>
						    </td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="userList?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="userList?currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="userList?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
				</c:if>
			</div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript"  src="js/js/loginPage.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>