<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    <div class="col-8 mx-auto">
	<!-- <h2 class=myStoreList>내가 등록한 식당</h2> -->
    	 </div>
    	 <section class="wrapper">
		    <div class="container-fostrap">
		        <div class="content">
		        	<!-- <form action="myPickList" id="reset"></form> -->
		            <div class="container">
		                <div class="row">
		                	    
				    	<c:if test="${size != 0 }">
					       <c:forEach items="${myStoreList }" var="list">
	    	
		                    <div class="col-xs-12 col-sm-4">
		                        <div class="card">
		                            <a class="img-card" href="storeRead?host_num=${list.host_num }">
		                            	<img alt="업체사진" src="images/ih/${list.photoList[0].host_photo}" style="height:200px; width: 100%;">
		                            </a>
		                          <button type="button" class="btn-close btn-close-white close_button" aria-label="Close"
		                           onclick="deletePick('${list.host_name}',${list.host_num })"></button>
		                            <div class="card-content">
		                                	<i class="fa-solid fa-utensils icons" style="color: #d33d38;"></i>
		                                <h4 class="card-title">
		                                    <a href="storeRead?host_num=${list.host_num }"> 
		                                    	 ${list.host_name }
		                                  </a>
		                                </h4>
		                                <p class="">
		                                    ${list.host_addr }
		                                </p>
		                            </div>
		                            <div class="card-read-more">
		                                <a href="storeUpdateForm?host_num=${list.host_num }">
		                                    수정하기
		                                </a>
		                            </div>
		                             <div class="card-read-more">
		                                <a href="storeDeleteRequest?host_num=${list.host_num }&mem_num=${mem_num}">
		                                    삭제하기
		                                </a>
		                            </div>
		                        </div>
		                    </div>
		                      	
						    	</c:forEach>
					    	</c:if>
		                    <c:if test="${size == 0 }">
								등록한 업체가 없습니다.
					    	</c:if>
				        </div>
		            </div>
		        </div>
		    </div>
		</section>
    
    
    
    
    
    
    
    

	    	${list.host_name }<br>
	
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
</body>
</html>