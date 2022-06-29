<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<!-- 여기 밑으로 ============================================================ -->
		<div id="page-wrapper">
			<%@ include file="../sideBar.jsp"%>

			<!-- 본문 -->
			<div id="content-wrapper">
				<div class="container-fluid">
					<div id="profileInfo" role="tabpanel" aria-labelledby="profile-tab" class="tab-pane fade show active">
						<table class="table table-hover table-sm table-properties">
							<div class="box" style="background: #BDBDBD;">
								<img class="profile" src="${pageContext.request.contextPath}/images/js/${profile.photo}" style="width: 200px; height: 200px;">
						    </div>
							<tbody>
								<tr>
									<th>아이디</th>
									<td>${profile.id}</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${profile.name }</td>
								</tr>
								<tr>
									<th>성별</th>
									<td>${profile.gender }</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${profile.email }</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${profile.phone}</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>${profile.birth }</td>
								</tr>
								<tr>
									<th>가입날짜</th>
									<td>${profile.join_date}</td>
								</tr>
								
							</tbody>
						</table>
						<div style="text-align: right;">
							<button type="button" class="btn btn-primary" style="margin-top: 10px;"
		          					  onclick="location.href='updateProfile'">수정하기</button>
		          			<button type="button" class="btn btn-primary" style="margin-top: 10px;"
		          					  onclick="location.href='userSleep'">회원탈퇴</button>
		          		</div>
					</div>
					<!-- /본문 -->
				</div>
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
