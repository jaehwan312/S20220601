<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>야호</h2>
결제일시:     ${info.approved_at}<br/>
주문번호:   ${info.partner_order_id}<br/>
상품명:    ${info.item_name}<br/>
상품수량:    ${info.quantity}<br/>
결제금액:    ${info.amount.total}<br/>
결제방법:    ${info.payment_method_type}<br/>

예약이 완료되었습니다 메시지 뿌리고 -> 예약내역(마이페이지)
예약완료시 RES테이블에 예약건 추가
PAY테이블에 결제건 추가
</body>
</html>