<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("nbsp", " "); %>
<% pageContext.setAttribute("enter", "\n"); %>
<% pageContext.setAttribute("left", "<"); %>
<% pageContext.setAttribute("right", ">"); %>
<%int count = 0; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/ih/storePhotoSlide.css">
<script type="text/javascript" src="js/ih/storePhotoSlide.js"></script>
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	<input type="hidden" value="${store.host_num}">
    	<input type="hidden" value="${store.host_code}">
    	<input type="hidden" value="${store.mem_num}">
    	<div>
			<input type="checkbox" style="float: right;">    	
    	</div>
    	
    	
<!-- 사진 테스트  스타트-->  
    	<div style="text-align: center; margin-top: 100px;">
	    	<c:forEach items="${storePhoto }" var="photo">
					<img alt="업체사진" src="images/ih/${photo.host_photo}" width="300px;" height="300px;">
	    	</c:forEach>
    	</div>
    	
<!-- 사진 테스트  끝-->   	
    	<%-- <div style="text-align: center; margin-top: 100px;">
	    	<c:forEach items="${storePhoto }" var="photo">
					<img alt="업체사진" src="images/ih/${photo.host_photo}" width="300px;" height="300px;">
	    	</c:forEach>
    	</div> --%>
    
    	<div>
    		<label style="font-size: 40px;">
    			<b>${store.host_name}</b>
    		</label>
    		<label style="font-size: 25px; color: orange;">
    			<b>${store.host_avg}</b>
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
    	<div>
	   		<label>
					<img alt="업체사진" src="images/ih/스시호시카이.jpg"
						 style="float: right;" width="100px;" height="100px;"><br/>
					<b>홍길동</b>
	   		</label>
	   		<label>
	   			<textarea rows="4px;" cols="155px;" style="float: right;"></textarea>
	   		</label>
			<button onclick="" style="float: right;" class="btn btn-primary">리뷰등록</button>
			<br/>
			<br/>
			<label>현재 리뷰 ${store.rev_count }개</label>
			<hr/>
			<br/>
			<c:forEach items="${revList }" var="user_rev" varStatus="u">
			<%-- ${count = 0 } --%>
			<h6 hidden=""><%=count = 0 %></h6>
				<c:if test="${user_rev.re_step == 0 }">
					<div>
						<div style="float: left;">
							<img alt="업체사진" src="images/ih/스시호시카이.jpg"
								 style="float: right;" width="100px;" height="100px;"><br/>
							<b>작성자:홍길동</b>
						</div>
						<div>
							<b>${user_rev.rev_content }</b>
						</div>
							<button onclick="userRevUpdate(${u.index});" style="float: right; size: " class="btn btn-primary" >리뷰수정</button>
							<button onclick="userRevDelete(${u.index});" style="float: right;" class="btn btn-primary">리뷰삭제</button>
						<br/>
						
	   				</div>
	   				<div>
						<c:forEach items="${revList }" var="step_rev" varStatus="h">
								<c:if test="${user_rev.rev_num == step_rev.ref && step_rev.re_step == 1}">
									<%-- ${count = 1 } --%>
									<h6 hidden=""><%=count = 1 %></h6>
									<br/>
									<label style="float: right;">[답변] : ${step_rev.rev_content }</label>
									<br/>
									<button onclick="hostRevUpdate(${h.index});" style="float: right;" class="btn btn-primary">답변수정</button>
									<button onclick="hostRevDelete(${h.index});" style="float: right;" class="btn btn-primary">답변삭제</button>
								</c:if>
						</c:forEach>
						<%-- <c:if test="${count == 0}"> --%>
						<c:if test="<%=count == 0 %>">
							<br/>
							<label>
								<textarea rows="4px;" cols="155px;" style="float: right;"></textarea>
							</label>
							<button onclick="" style="float: right;" class="btn btn-primary">답변등록</button>
						</c:if>
					</div>
					<br/>
					<hr/>
				</c:if>
			</c:forEach>
   		</div>
    	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>