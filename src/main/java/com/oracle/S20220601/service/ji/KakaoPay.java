package com.oracle.S20220601.service.ji;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.oracle.S20220601.model.Pay;
import com.oracle.S20220601.model.Res;
import com.oracle.S20220601.model.ji.KakaoPayApprovalVO;
import com.oracle.S20220601.model.ji.KakaoPayReadyVO;


import lombok.extern.java.Log;

@Service
@Log
//서비스
public class KakaoPay {
private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
    public String kakaoPayReady(Model model) {
    	System.out.println("KakaoPay  kakaoPayReady 시작!");
    	
    	Map<String, Object> map = model.asMap();
    	Pay pay = (Pay) map.get("pay");
    	System.out.println("pay.getPrice()"+ Integer.toString(pay.getPrice()));
    	Res res = (Res) map.get("res");
    	String id =  (String) map.get("id");
    	String item =  (String) map.get("item");
   

        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK "+"251c268747ee0aaaefc7754c3a83ab8e");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", Integer.toString(pay.getPay_num()));		 // 결제 번호
        params.add("partner_user_id", id);	// 회원 id 
        params.add("item_name", item);	// 상품명
        params.add("quantity", "1");
        params.add("total_amount",  Integer.toString(pay.getPrice()));	// 실제 결제 금액 total_fee
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8908/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8908/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8908/kakaoPaySuccessFail");
        

         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token, Pay p_pay, String id) {
    	Pay pay = p_pay;
    	
    	System.out.println("KakaoPay  kakaoPayInfo 시작!");
        log.info("KakaoPayInfoVO............................................");
        log.info("-----------------------------");
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK "+"251c268747ee0aaaefc7754c3a83ab8e");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", Integer.toString(pay.getPay_num()));
        params.add("partner_user_id", id);
        params.add("pg_token", pg_token);
        params.add("total_amount", Integer.toString(pay.getPrice()));

        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }

    
}
