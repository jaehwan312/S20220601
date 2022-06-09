<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="css/template.css">
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<link href="css/jj/searchList.css" rel="stylesheet">    

<title>제주 감수광</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->

           <div class="container">
              <div class="row">
                  <div class="col-lg-12 text-center mb100">
                      <h2 class="section-heading">숙박<span class="theme-accent-color">&</span>맛집</h2>
                      <hr class="thin-hr">
                      <h3 class="section-subheading secondary-font">'${keyword }'에 대한 검색 결과</h3>
                  </div>
              </div>
          </div>
          
          <div class="container">

              <div class="row">
                  <div class="col-md-6">
                      <h2 class="mb50"><span class="heading-font text-uppercase">맛집</span></h2>
                      <div class="host-item">
                          <div class="row">
                              <div class="col-xs-3">
                                  <img src="images/jj/hotel1.jpg" class="img-responsive">
                              </div>
                              <div class="col-xs-9">
                                  <h3>Lorem Ipsum <span class="theme-accent-color">$8.95</span></h3>
                                  <p>No phone no lights no motor car not a single luxury. Like Robinson Crusoe it's primitive as can be. Like Robinson Crusoe it's primitive as can be</p>
                              </div>
                          </div>
                      </div>
                      <div class="host-item">
                          <div class="row">
                              <div class="col-xs-3">
                                  <img src="images/jj/hotel2.jpg" class="img-responsive">
                              </div>
                              <div class="col-xs-9">
                                  <h3>Lorem Ipsum <span class="theme-accent-color">$8.95</span></h3>
                                  <p>No phone no lights no motor car not a single luxury. Like Robinson Crusoe it's primitive as can be. Like Robinson Crusoe it's primitive as can be</p>
                              </div>
                          </div>
                      </div>
                      <div class="host-item">
                          <div class="row">
                              <div class="col-xs-3">
                                  <img src="images/jj/hotel3.jpg" class="img-responsive">
                              </div>
                              <div class="col-xs-9">
                                  <h3>Lorem Ipsum <span class="theme-accent-color">$8.95</span></h3>
                                  <p>No phone no lights no motor car not a single luxury. Like Robinson Crusoe it's primitive as can be. Like Robinson Crusoe it's primitive as can be</p>
                              </div>
                          </div>
                      </div>
                      <div class="host-item">
                          <div class="row">
                              <div class="col-xs-3">
                                  <img src="images/jj/hotel4.jpg" class="img-responsive">
                              </div>
                              <div class="col-xs-9">
                                  <h3>Lorem Ipsum <span class="theme-accent-color">$8.95</span></h3>
                                  <p>No phone no lights no motor car not a single luxury. Like Robinson Crusoe it's primitive as can be. Like Robinson Crusoe it's primitive as can be</p>
                              </div>
                          </div>
                      </div>
                  </div>

                  <div class="col-md-6">
                      <h2 class="mb50"><span class="heading-font text-uppercase">숙박</span></h2>
                      <div class="host-item">
                          <div class="row">
                              <div class="col-xs-3">
                                  <img src="images/jj/hotel5.jpg" class="img-responsive">
                              </div>
                              <div class="col-xs-9">
                                  <h3>Lorem Ipsum <span class="theme-accent-color">$8.95</span></h3>
                                  <p>No phone no lights no motor car not a single luxury. Like Robinson Crusoe it's primitive as can be. Like Robinson Crusoe it's primitive as can be</p>
                              </div>
                          </div>
                      </div>
                      <div class="food-menu-item">
                          <div class="row">
                              <div class="col-xs-3">
                                  <img src="images/jj/hotel6.jpg" class="img-responsive">
                              </div>
                              <div class="col-xs-9">
                                  <h3>Lorem Ipsum <span class="theme-accent-color">$8.95</span></h3>
                                  <p>No phone no lights no motor car not a single luxury. Like Robinson Crusoe it's primitive as can be. Like Robinson Crusoe it's primitive as can be</p>
                              </div>
                          </div>
                      </div>
                      <div class="food-menu-item">
                          <div class="row">
                              <div class="col-xs-3">
                                  <img src="images/jj/hotel7.jpg" class="img-responsive">
                              </div>
                              <div class="col-xs-9">
                                  <h3>Lorem Ipsum <span class="theme-accent-color">$8.95</span></h3>
                                  <p>No phone no lights no motor car not a single luxury. Like Robinson Crusoe it's primitive as can be. Like Robinson Crusoe it's primitive as can be</p>
                              </div>
                          </div>
                      </div>
                      <div class="food-menu-item">
                          <div class="row">
                              <div class="col-xs-3">
                                  <img src="images/jj/hotel8.jpg" class="img-responsive">
                              </div>
                              <div class="col-xs-9">
                                  <h3>Lorem Ipsum <span class="theme-accent-color">$8.95</span></h3>
                                  <p>No phone no lights no motor car not a single luxury. Like Robinson Crusoe it's primitive as can be. Like Robinson Crusoe it's primitive as can be</p>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
    
    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>