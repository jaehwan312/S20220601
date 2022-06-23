<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/jj/myPickList.css" rel="stylesheet">    

<title>제주 감수광</title>

</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    	 <section class="wrapper">
		    <div class="container-fostrap">
		        <div>
		            <h1 class="heading">
		                나의 찜 목록
		            </h1>
		        </div>
		        <div class="content">
		            <div class="container">
		                <div class="row">
		                	<c:forEach var="store" items="${host.store }">
		                    <div class="col-xs-12 col-sm-4">
		                        <div class="card">
		                            <a class="img-card" href="storeRead?host_num=${store.host_num }">
		                            <img src="images/jj/${store.host_photo }" />
		                          </a>
		                          <button type="button" class="btn-close btn-close-white close_button" aria-label="Close"></button>
		                            <div class="card-content">
		                                <h4 class="card-title">
		                                    <a href="storeRead?host_num=${store.host_num }"> ${store.host_name }
		                                  </a>
		                                </h4>
		                                <p class="">
		                                    ${store.host_addr }
		                                </p>
		                            </div>
		                            <div class="card-read-more">
		                                <a href="storeRead?host_num=${store.host_num }">
		                                    이동하기
		                                </a>
		                            </div>
		                        </div>
		                    </div>
		                    </c:forEach>
		                    
		                    <c:forEach var="stay" items="${host.stay }">
		                    <div class="col-xs-12 col-sm-4">
		                        <div class="card">
		                            <a class="img-card" href="stayRead?host_num=${stay.host_num }">
		                            <img src="images/jj/${stay.host_photo }" />
		                          </a>
		                          <button type="button" class="btn-close btn-close-white close_button" aria-label="Close"></button>
		                            <div class="card-content">
		                                <h4 class="card-title">
		                                    <a href="stayRead?host_num=${stay.host_num }"> ${stay.host_name }
		                                  </a>
		                                </h4>
		                                <p class="">
		                                    ${stay.host_addr }
		                                </p>
		                            </div>
		                            <div class="card-read-more">
		                                <a href="stayRead?host_num=${stay.host_num }">
		                                    이동하기
		                                </a>
		                            </div>
		                        </div>
		                    </div>
		                    </c:forEach>
		                    
		                </div>
		            </div>
		        </div>
		    </div>
		</section>
    
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="js/jj/myPickList.js"></script>
</body>
</html>