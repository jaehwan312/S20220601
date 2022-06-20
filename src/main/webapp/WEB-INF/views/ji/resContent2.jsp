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
<title>제주 감수광</title>
</head>
<body>
<script type="text/javascript">


function fnDateGetSatSun(d1, d2) {
    var sDate=lcDateFormatDate(d1);
    var eDate=lcDateFormatDate(d2);
    alert(lcDateCountDay(sDate,eDate));

 var count = 0;
 
 count = lcDateCountDay(sDate,eDate);

 return count;
}
function lcDateFormatDate(d) {
    return new Date(d.substr(0,4),Number(d.substr(4,2))-1,Number(d.substr(6)));
}
function lcDateCountDay(d1,d2) {
    var count=0;
    var tmp;
    for (var i=0; i <= (d2-d1)/1000/60/60/24; i++) {
      tmp=new Date(d1);
      tmp.setDate(tmp.getDate()+i);
   //0(일요일), 5(금요일), 6(토요일)
      if (tmp.getDay()==0 || tmp.getDay()==5 || tmp.getDay()==6) {
        count++;
      }
    }
    return count;
}</script>
	<%@ include file="../header.jsp" %>
    <div class="container">
    <!-- 여기 밑으로 ============================================================ -->
    <button type="button" id="check1" onclick="pay()">테스트버튼</button>
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
  Launch demo modal
</button>
        <button type="button" class="btn btn-primary" onclick="fnDateGetSatSun('20220625','20220630')">Save changes</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

    <!-- 여기 위로오 ============================================================ -->   
    </div>
	<%@ include file="../footer.jsp" %>

	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="js/ji/payment.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>