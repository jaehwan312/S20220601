<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("nbsp", " "); %>
<% pageContext.setAttribute("enter", "\n"); %>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<%int count = 0; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/ih/storeReview.css">
<link rel="stylesheet" href="css/ih/storePhoto.css">
<script type="text/javascript" src="js/ih/storePhoto.js"></script>
<script type="text/javascript" src="js/ih/storeReview.js"></script>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
	    <div  style="margin-top: 100px;">
	    	<input type="hidden" value="${store.host_num}" id="HostNum">
	    	<input type="hidden" value="${store.host_code}">
	    	<input type="hidden" value="${store.mem_num}">
	    	<div>
				<input type="checkbox" style="float: right;" id="checkbox">
	    	</div><br/><br/>
	
	
	    	
	    	
	<!-- 사진 테스트  스타트-->  
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
			  <div class="carousel-indicators">
			   		<c:forEach items="${storePhoto }" var="photo" varStatus="i">
				      <c:if test="${i.index == 0 }">
				      	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${i.index }" class="active" aria-current="true" aria-label="Slide ${i.index +1}"></button>
				      </c:if>
				      <c:if test="${i.index != 0 }">
				      	 <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${i.index }" aria-label="Slide ${i.index+1 }"></button>
				      </c:if>
			    	</c:forEach>
			  </div>
			  <div class="carousel-inner">
			     <c:forEach items="${storePhoto }" var="photo" varStatus="i">
				      <c:if test="${i.index == 0 }">
				      	<div class="carousel-item active">
							<img alt="업체사진" src="images/ih/${photo.host_photo}" class="d-block w-100" height="500px;">
			    		</div>	
				      </c:if>
				      <c:if test="${i.index != 0 }">
				      	<div class="carousel-item">
							<img alt="업체사진" src="images/ih/${photo.host_photo}" class="d-block w-100" height="500px;">
			    		</div>	
				      </c:if>
			     </c:forEach>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
			 
	<!-- 사진 테스트  끝-->   	
	    	<div>
	    		<label style="font-size: 40px;">
	    			<b>${store.host_name}</b>
	    		</label>
	    		<label style="font-size: 25px; color: orange;">
	    			<b id="StoreAvg">${store.host_avg}</b>
	    		</label><p/>
				<br/><hr/><br/>
					<!-- <div style="float: right; width: 100px; height: 100px;"> 지도 </div> -->
					<div>
						<img alt="업체사진" src="images/ih/스시호시카이.jpg" 
							 style="float: right;" width="200px;" height="200px;">
					</div>
					<div>
			    		<label style="float: left;  margin-right: 25px; width: 100px;">
			    			<b>주소</b>
			    		</label>
			    		<label>
			    			<b>${store.host_addr}</b>
			    		</label><p/>
			    		<label style="float: left;  margin-right: 25px; width: 100px;">
			    			<b>주차가능여부</b>
			    		</label>
				    	<label>
				    		<b>${store.parking}</b>
				    	</label><p/>
				    </div>
	    	</div>
	    	<br/><hr/><br/>
	    	<div>
	    		<label style="float: left;  margin-right: 25px; width: 100px;">
	    			<b>영업시간</b>
	    		</label>
	    		<label>
	    			<b>${store.open_time}</b>
	    		</label><p/>
	    		<label style="float: left;  margin-right: 25px; width: 100px;">
	    			<b>브레이크타임</b>
	    		</label>
		    	<label>
		    		<b>${store.break_time}</b>
		    	</label><p/>
	    	</div>
	 		<br/><hr/><br/>
	    	<div>
	    		<label style="float: left;  margin-right: 25px; width: 100px;">
	    			<b>음식종류</b>
	    		</label>
	    		<b>${foodcode.name}</b><p/>
	    		<label style="float: left;  margin-right: 25px; width: 100px;">
	    			<b>메뉴</b>
	    		</label>
		    	<label>
			    	<c:forEach items="${menuList }" var="menu">
			    		<b style="float: left;  margin-right: 50px; width: 100px;">${menu.menu_name}</b>
			    		<b style="float: left;  margin-right: 50px; margin-left: 50px; width: 100px;">${menu.menu_price}</b>
			    		<br/>
			    	</c:forEach>
		    	</label>
	    	</div>
	    	<br/><hr/><br/>
	    	<div>
	    		<label style="float: left;  margin-right: 25px; width: 100px;">
	    			<b>업체소개</b>
	    		</label>
	    		<label>
	    			<b>
	    				${fn:replace(fn:replace(store.host_info, nbsp, '&nbsp;'), enter , '<br/>')}
	<%--     			${fn:replace(fn:replace(fn:replace(fn:replace(store.host_info, nbsp, '&nbsp;'), enter , '<br/>'), left,'&lt;'), right, '&gt	;')}--%>    			</b>
	    		</label>
	    	</div>
	    	<br/><hr/><br/>
	    	<!-- 리뷰 시작  -->
	    	<div>
	    		<!-- 리뷰 등록 시작 -->
	    		<form id="storeRevInsert" name="storeRevInsert" method="POST">
			   		<label>
							<img alt="업체사진" src="images/ih/스시호시카이.jpg"
								 style="float: right;" width="100px;" height="100px;"><br/>
							<b>홍길동</b>
			   		</label>
			   		<label>
			   			<textarea rows="4px;" cols="155px;" style="float: right;" id="content" name="content"></textarea>
			   		</label>
					<div>
						<div class="" id="preview"></div>
					</div>
					<!-- 사진  시작-->
					<div>
						<div class="insertPhoto" >
							<c:forEach begin="0" end="4" varStatus="i">
			                    <label class="labelInfo" id="labelInfo${i.index }" for="inputInfo${i.index}" >
			                       	 👉 CLICK HERE!👈 
									<input type="file" class="host_photo" id="inputInfo${i.index }" name="host_photo${i.index}" 
										onchange="previewFiles(${i.index })" accept="images/ih/*">
			                    </label>
			                </c:forEach>
	      				</div>
					</div>
					<!-- 사진 끝 -->
					<button onclick="storeReviewInsert()" style="float: right;" class="btn btn-primary">리뷰등록</button>
					<!-- 리뷰등록 끝 -->
				</form><br/><br/><br/>
				<div>현재 리뷰<b  id="StoreRevCount">${store.rev_count }</b>개</div>
				<c:forEach items="${revList }" var="user_rev" varStatus="u">
				<h6 hidden=""><%=count = 0 %></h6>
					<c:if test="${user_rev.re_step == 0 }">
						<div id="storeRevList${user_rev.rev_num}">
							<hr/>
							<br/>
							<div>
								<div style="float: left;">
									<img alt="업체사진" src="images/ih/스시호시카이.jpg"
										 style="float: right; border-radius: 50%;" width="100px;" height="100px;" ><br/>
									<b>작성자: ${user_rev.mem_num }</b>
								</div>
								<div>
									<div>
										<label ><b>${user_rev.rev_content }</b></label><br/>
									</div>
									<div>
										<c:forEach items="${revPhotos }" var="photo">
											<c:if test="${user_rev.rev_num == photo.rev_num }">
											<label><img alt="" src="images/ih/${photo.rev_photo }" 
													 style="float: left; margin-top: 80px;" width="100px;" height="100px;"></label>
													<input type="image" value="images/ih/${photo.rev_photo }" hidden="" id="storeRevPhotoNum">
											</c:if>
										</c:forEach>
									</div>
								</div>
								<br/>
								<div>
									<input type="hidden"  value="${user_rev.mem_num }" 
										   id="userRevMemNum${user_rev.rev_num }"></input>
									<input type="hidden"  value="${user_rev.rev_num }"
										   id="userRevNum${user_rev.rev_num }"></input>
									<button onclick="userRevPhotoUpdate(${user_rev.rev_num});" 
											style="float: right;  " class="btn btn-primary" >리뷰사진수정</button>
									<button onclick="userRevDelete(${user_rev.rev_num});" 
											style="float: right;" class="btn btn-primary">리뷰사진삭제</button>
									<button onclick="userRevUpdate(${user_rev.rev_num});" 
											style="float: right; " class="btn btn-primary" >리뷰수정</button>
									<button onclick="userRevDelete(${user_rev.rev_num});" 
											style="float: right;" class="btn btn-primary">리뷰삭제</button>
								</div>
								<br/>
			   				</div>
			   				<div>
								<c:forEach items="${revList }" var="step_rev" varStatus="h">
										<c:if test="${user_rev.rev_num == step_rev.ref && step_rev.re_step == 1}">
											<h6 hidden=""><%=count = 1 %></h6>
											<br/>
											<div style="margin-top: 50px;">
												<label style="float: right; ">[답변] : ${step_rev.rev_content }</label>
												<br/>
												<button onclick="hostRevUpdate(${step_rev.rev_num});" style="float: right;" class="btn btn-primary">답변수정</button>
												<button onclick="hostRevDelete(${step_rev.rev_num});" style="float: right;" class="btn btn-primary">답변삭제</button>
											</div>
										</c:if>
								</c:forEach>
								<c:if test="<%=count == 0 %>">
									<br/>
									<label>
										<textarea rows="4px;" cols="155px;" style="float: right;"></textarea>
									</label>
									<button onclick="" style="float: right;" class="btn btn-primary">답변등록</button>
								</c:if>
							</div>
						</div>
						<br/>
					</c:if>
				</c:forEach>
	   		</div><!-- 리뷰 끝  -->
    </div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>