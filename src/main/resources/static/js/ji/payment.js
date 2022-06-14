//check2 클릭
function pay(){
 console.log("money");
 var IMP = window.IMP; 
    IMP.init('imp52482779'); 
    var res_name = $('#res_name').val();
    var payment = $("#payment-select option:selected").val();
    alert(res_name);
    alert(payment);
    IMP.request_pay({
    	pg : 'payment', 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '${room1.room_name }',
        amount: 1,
        buyer_email : 'kji0703@naver.com',
        buyer_name : 'res_name',
        buyer_tel : '${prof.phone }',
        buyer_addr : '경기도 부천시',
       // m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
           	alert(msg);
            //location.href='결제완료후 갈 url';
        } else {
            var msg = '결제에 실패하였습니다.';
            alert(rsp.error_msg);
           
            
        }
    });

}