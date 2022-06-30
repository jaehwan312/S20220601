<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<link href="css/ih/myStoreList.css" rel="stylesheet" type="text/css">
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
				<div>
					<c:if test="${size == 0 }">등록한 업체가 없습니다.</c:if>
				</div>
				<div style="width: 100%;" class="row row-cols-1 row-cols-md-3 g-4">
					<c:if test="${size != 0 }">
						<c:forEach items="${myStoreList }" var="list">
							<div class="col">
								<div class="card">
									<a href="storeRead?host_num=${list.host_num }" style="width: 100%; height: 250px;">
										<img alt="업체사진"
										src="images/store/${list.photoList[0].host_photo}"
										class="card-img-top">
									</a>
									<div class="card-body">
										<i class="fa-solid fa-utensils icons" style="color: #d33d38;"></i>
										<h4 class="card-title">
											<a href="storeRead?host_num=${list.host_num }">
												${list.host_name } </a>
										</h4>
										<p class="card-text" id="addr">${list.host_addr }</p>
									</div>
									<div class="card-read-more">
										<a href="storeUpdateForm?host_num=${list.host_num }">수정하기</a>
									</div>
									<div class="card-read-more">
										<a href="storeDeleteRequest?host_num=${list.host_num }&mem_num=${mem_num}">삭제하기</a>
									</div>
								</div>
							</div>

						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		${list.host_name }
	<br>

	<!-- 여기 위로오 ============================================================ -->
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>