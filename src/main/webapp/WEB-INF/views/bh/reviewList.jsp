<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
</head>
<body>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    <div style="text-align: center; margin-top: 100px;">

			<h1>리뷰</h1>
			<div>
				<h2>${hostreview.host_avg}</h2>
				<p />
				리뷰 : ${hostreview.rev_count }
			</div>
			<!-- start -->
			<div style="padding: 80px; border: 1px solid black;">
            <c:forEach items="${reviewList }" var="getList" varStatus="j">
            <div style="border: 1px solid black; margin-top: 20px;">
               <div style="text-align: left; padding-left: 70px; padding-top:30px;  " >
                      ${getList.room_name }
                </div>
                <div style="width: 40%; text-align: left; padding-left: 60px; padding-bottom: 30px; padding-top: 30px;">
                  ${getList.rev_content}</div>
               <div style="width: 100%; height: 200px; text-align: left; padding-left: 60px; margin-bottom: 30px; ">
                  <div id="carouselExampleControls${j.index }" class="carousel slide" data-bs-ride="carousel" style="width: 400px;">
                    <div class="carousel-inner">
                    <c:forEach items="${getList.revPhoto }" var="getPhoto" varStatus="i">
                       <c:if test="${i.index==0 }">
                          <div class="carousel-item active">
                           <img src="images/bh/${getPhoto.rev_photo}" class="d-block w-100" alt="리뷰사진" style="height: 250px;">
                         </div>
                       </c:if>
                       <c:if test="${i.index!=0 }">
                          <div class="carousel-item">
                           <img src="images/bh/${getPhoto.rev_photo}" class="d-block w-100" alt="리뷰사진" style="height: 250px;">
                         </div>
                       </c:if>
                  </c:forEach>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls${j.index }" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls${j.index }" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>
               </div>
            </div>
            </c:forEach> 
         </div>
			<!--end  -->
		</div>

		<div class="col-md-6">
			<div
				class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary">World</strong>
					<h3 class="mb-0">Featured post</h3>
					<div class="mb-1 text-muted">Nov 12</div>
					<p class="card-text mb-auto">This is a wider card with
						supporting text below as a natural lead-in to additional content.</p>
					<a href="#" class="stretched-link">Continue reading</a>
				</div>
				<div class="col-auto d-none d-lg-block">
					<svg class="bd-placeholder-img" width="200" height="250"
						xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: Thumbnail"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#55595c"></rect>
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
				</div>
			</div>
		</div>
    <!-- 여기 위로오 ============================================================ -->   
    </div>
</body>
</html>