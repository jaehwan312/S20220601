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
<link rel="stylesheet" href="css/ih/style.css"><!--평점 css -->
<link rel="stylesheet" href="css/ih/storePhoto.css">
<link rel="stylesheet" href="css/ih/storeMapApi.css">
<script type="text/javascript" src="js/ih/storePhoto.js"></script>
<script type="text/javascript" src="js/ih/storeReview.js"></script>
<script type="text/javascript" src="js/ih/flatpickr.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b9390203495c8fcf026665d50778bc99&libraries=services,clusterer,drawing"></script>
<style type="text/css">
	hr {
		margin-bottom: 10px;
		margin-top: 10px;
}
</style>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
	    <div  style="margin-top: 100px;">
	    	<input type="hidden" value="${store.host_num}" id="HostNum">
	    	<input type="hidden" value="${store.host_code}">
	    	<input type="hidden" value="${store.mem_num}"  id="Mem_mem">
	    	<input type="hidden" value="${maxReviewDate}"  id="maxReviewDate">
	    	<c:if test="${mem_num != 0}">
		    	<c:if test="${index == 0}">
		    		<label style="margin-bottom: 20px;">
					<i class="fa fa-heart fa-md heartLike" id="storeLike${index }" onclick="storeLikeAction(${index},${store.host_num},'${store.host_name}')" aria-hidden="true" style="color: gray;"></i>
					<span class="information" id="storeLikes${index}">${store.like_count}</span>
		    		</label>	
		    	</c:if>
		    	<c:if test="${index == 1 }">
		    		<label style="margin-bottom: 20px;">
					<i class="fa fa-heart fa-md heartLike" id="storeLike${index }" onclick="storeLikeAction(${index},${store.host_num},'${store.host_name}')" aria-hidden="true" style="color: red;"></i>
					<span class="information" id="storeLikes${index}">${store.like_count}</span>
		    		</label>	
		    	</c:if>
			</c:if>
	
	    	
	    	
	<!-- 사진 슬라이드  스타트-->  
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
							<img alt="업체사진" src="images/ih/${photo.host_photo}" class="d-block w-100" style="height:500px;">
			    		</div>	
				      </c:if>
				      <c:if test="${i.index != 0 }">
				      	<div class="carousel-item">
							<img alt="업체사진" src="images/ih/${photo.host_photo}" class="d-block w-100" style="height:500px;">
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
			 
	<!-- 사진 슬라이드  끝-->   	
	    	<div>
	    		<label style="font-size: 40px;">
	    			<input type="hidden" value="${store.host_name }" id="host_name">
	    			<b>${store.host_name}</b>
	    		</label>
	    		<label style="font-size: 25px; color: orange;">
	    			<b id="StoreAvg">${store.host_avg}</b>
	    		</label><p/>
				<br/><hr/><br/>
					<!--지도 start  -->
					<div>
						<div id="map" style="width:300px;height:300px; float: right;" ></div>
					</div>
					<!-- 지도 END  -->
					<div>
			    		<label style="float: left;  margin-right: 25px; width: 100px;">
			    			<b>주소</b>
			    		</label>
			    		<label>
			    			<input type="hidden" value="${store.host_addr }" id="host_addr">
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
	    	<hr/>
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
	 		<hr/>
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
	    	<hr/>
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
	    	<hr/>
	    	<!-- 리뷰 시작  -->
	    	<div id="user_rev_insert">
	    		<!-- 리뷰 등록 시작 -->
	    		<c:if test="${mem_num != 0}">
	    			<c:if test="${mem_num != store.mem_num }">
				   		<label>
								<img alt="${userphoto }" src="images/ih/${userphoto }"
									 style="float: right; border-radius: 50%;" width="100px;" height="100px;"><br/>
							    <input hidden="" value="${userphoto }" id="userphoto">
							    <input hidden="" value="${name }"      id="name">
								<b>작성자:${name }</b>
				   		</label>
					   		<label>
					   			<textarea rows="4px;" cols="135px;" style="float: right;" id="rev_content" name="rev_content" required="required"></textarea>
					   		</label>
					   	<div id="photo_point">	
							<div>
								<div class="" id="preview"></div>
							</div>
							<section class="section"  >
		                              <div class="card-body" >
		                                  <div id="step" class="star-rating" style="width: 160px; height: 32px; background-size: 32px;" title="1/5" ></div>
			                    	  </div>
		               		</section>	
							<!-- 사진  시작-->
							<div>
								<div class="insertPhoto">
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
							<button type="submit" onclick="storeReviewInsert(${mem_num})" style="float: right;" class="btn btn-primary">리뷰등록</button>
							<!-- 리뷰등록 끝 -->
						</div>
					</c:if>
				</c:if>
				</div>
				<div>현재 리뷰<b  id="StoreRevCount">${store.rev_count }</b>개</div>
				<div id="review" class="review">
					<c:forEach items="${revList }" var="user_rev" varStatus="u">
					<c:if test="${user_rev.re_step == 0 }">
					<div class="reviewList" style="display: none;">
						<h6 hidden="" id="count">${count = 0}</h6>
							
								<div id="storeRevList${user_rev.rev_num}">
									<hr/>
									<br/>
									<div id="host_user_rev">
										<div style="float: left;">
											<img alt="${user_rev.photo }" src="images/ih/${user_rev.photo }"
												 style="float: right; border-radius: 50%;" width="100px;" height="100px;" ><br/>
											<b>작성자: ${user_rev.name }</b>
										</div>
										<div>
											<div id="host_user_rev${user_rev.rev_num}">
												<label><b id="user_rev.rev_content${user_rev.rev_num}"> 
												${fn:replace(fn:replace(fn:replace(fn:replace(user_rev.rev_content,'<','&lt;' ),'>', '&gt;' ),nbsp, '&nbsp;'),enter , '<br/>' )}
												<%-- ${user_rev.rev_content } --%></b></label><br/>
											</div>
											<div>
												<c:forEach items="${revPhotos }" var="photo" varStatus="i">
													<c:if test="${user_rev.rev_num == photo.rev_num }">
													<label><img alt="" src="images/ih/${photo.rev_photo }" 
															 style="float: left; margin-top: 80px;" width="100px;" height="100px;"></label>
															<input type="image" value="images/ih/${photo.rev_photo }" hidden="" id="storeRevPhoto${i.index}">
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
											<c:if test="${mem_num == user_rev.mem_num }">
												<button onclick="userRevUpdate(${user_rev.rev_num})" 
														style="float: right; " class="btn btn-primary" id="userRevUpdate${user_rev.rev_num}" >리뷰수정</button>
												<button onclick="userRevDelete(${user_rev.rev_num})" 
														style="float: right;" class="btn btn-primary" id="userRevDelete${user_rev.rev_num}">리뷰삭제</button>
											</c:if>
										</div>
										<br/>
					   				</div>
					   				<!--답글  Start --><!-- 답글을 다는 리뷰의 번호로 기능동작구분 -->
						   				<div id="host_rev${user_rev.rev_num}">
						   					<div id="host_rev_select${user_rev.rev_num}">
													<c:forEach items="${revList }" var="step_rev" varStatus="h">
														<c:if test="${user_rev.rev_num == step_rev.ref && step_rev.re_step == 1}">
																<h6 hidden="" id="count">${count = 1}</h6>
																<br/>
																	<div style="margin-top: 50px;">
																		<div id="host_host_rev${step_rev.rev_num}">
																			<label style="float: right;"><b id="step_rev.rev_content${step_rev.rev_num}">
																			<%-- ${step_rev.rev_content } --%>
																			${fn:replace(fn:replace(fn:replace(fn:replace(step_rev.rev_content,'<','&lt;' ),'>', '&gt;' ),nbsp, '&nbsp;'),enter , '<br/>' )}
																			</b></label>
																			<label style="float: right;"><b>[답변] : </b></label>
																		</div>
																		<br/>
																		<c:if test="${mem_num == store.mem_num }">
																			<button onclick="hostRevUpdate(${step_rev.rev_num})" style="float: right;" class="btn btn-primary" id="hostRevUpdate${step_rev.rev_num}">답변수정</button>
																			<button onclick="hostRevDelete(${step_rev.rev_num})" style="float: right;" class="btn btn-primary" id="hostRevDelete${step_rev.rev_num}">답변삭제</button>
																			<input type="hidden" value="${step_rev.rev_num }" id="step_rev.rev_num${step_rev.rev_num }">
																			<input type="hidden" value="${user_rev.rev_num }" id="user_rev.rev_num${step_rev.rev_num }">
																		</c:if>
																	</div>
															</c:if>
													</c:forEach>
											</div>
											<c:if test="${mem_num == store.mem_num }">
												<div  id="host_rev_insert${user_rev.rev_num}">
													<c:if test="${count == 0 }">
														<label>
															<textarea rows="4px;" cols="155px;" style="float: right;" id="host_rev_content${user_rev.rev_num}" name="host_rev_content"></textarea>
														</label>
														<button onclick="hostRevInsert(${user_rev.rev_num})" style="float: right;" class="btn btn-primary">답변등록</button>
													</c:if>
												</div>
											</c:if>
										</div>
									<!--답글 End -->
								<br/>
								</div>
						</div>
						</c:if>
					</c:forEach>
					<br>
					<div style="text-align: center;">
						<button id="load" class="btn btn-primary" style="width: 300px;">더보기</button>
					</div>
	   		</div><!-- 리뷰 끝  -->
	   	</div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="js/ih/rater-js.js"></script>
	<script src="js/ih/rater-js2.js"></script>
	<script type="text/javascript" src="js/ih/pagePlus.js"></script>
	<script type="text/javascript" src="js/ih/storeMapApi.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>