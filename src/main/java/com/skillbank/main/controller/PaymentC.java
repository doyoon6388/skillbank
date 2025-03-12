package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.service.PaymentService;
import com.skillbank.main.vo.ProAccountVO;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

@Controller
public class PaymentC {

    @Autowired
    private MainService mainService;

    @Autowired
    private PaymentService paymentService;

    // 테스트용 Secret Key (샌드박스)
    private static final String KAKAO_SECRET_KEY = "DEV58FF3EEF76FE45023042AEBB3E2710E8FCEC1";

    @PostMapping("/pro/cash")
    public String simulatePayment(int pro_cash, HttpSession session, Model model /*int pro_pk*/) {
        try {
            // 세션에서 ProAccountVO 객체를 가져옴 (Lombok @Data 사용)
            ProAccountVO proSession = (ProAccountVO) session.getAttribute("proSession");
            if (proSession == null) {
                model.addAttribute("error", "세션 정보가 없습니다.");
                model.addAttribute("page", "cash/paymentError.jsp");
                model.addAttribute("loginCheck", mainService.loginCheck(session));
                return "indexPro";
            }

            // JSON 형식의 요청 바디 생성 (필요한 파라미터는 카카오페이 문서 참고)
            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("cid", "TC0ONETIME");
            requestBody.put("partner_order_id", "ORDER12345");
            requestBody.put("partner_user_id", "USER67890");
            requestBody.put("item_name", "Test Virtual Cash");
            requestBody.put("quantity", 1);
            requestBody.put("total_amount", pro_cash);
            requestBody.put("tax_free_amount", 0);
            // 승인/취소/실패 URL은 카카오 개발자 센터에 등록된 도메인과 일치해야 합니다.
            requestBody.put("approval_url", "http://localhost/paymentSuccess");
            requestBody.put("cancel_url", "http://localhost/payment-cancel");
            requestBody.put("fail_url", "http://localhost/payment-error");

            // 헤더 설정: Content-Type은 application/json, Authorization은 "SECRET_KEY" 방식 사용
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", "SECRET_KEY " + KAKAO_SECRET_KEY);

            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

            // 카카오페이 API 엔드포인트 (테스트용)
            String url = "https://open-api.kakaopay.com/online/v1/payment/ready";

            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<String> responseEntity = restTemplate.postForEntity(url, requestEntity, String.class);

            if (responseEntity.getStatusCode() == HttpStatus.OK) {
                // 응답 JSON 파싱 (org.json 사용)
                JSONObject jsonObject = new JSONObject(responseEntity.getBody());
                String redirectUrl = jsonObject.getString("next_redirect_pc_url");
                System.out.println("Redirect URL (테스트용): " + redirectUrl);

/*                paymentService.addCash(pro_pk);*/


                // 가상 충전 로직: 선택한 금액만큼 현재 보유 금액 업데이트
                proSession.setPro_cash(proSession.getPro_cash() + pro_cash);

                // 여기서 바로 redirectUrl로 리다이렉트하면, 카카오페이 UI가 표시됩니다.
                return "redirect:" + redirectUrl;
                // 테스트 환경에서는 실제 결제창 대신 성공 페이지로 리다이렉트
/*                model.addAttribute("page", "cash/paymentSuccess.jsp");
                model.addAttribute("loginCheck", mainService.loginCheck(session));
                return "indexPro";*/
            } else {
                model.addAttribute("error", "결제 준비 중 오류가 발생했습니다.");
                model.addAttribute("page", "cash/paymentError.jsp");
                model.addAttribute("loginCheck", mainService.loginCheck(session));
                return "indexPro";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "결제 처리 중 예외가 발생했습니다.");
            model.addAttribute("page", "cash/paymentError.jsp");
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "indexPro";
        }
    }

    @GetMapping("/paymentSuccess")
    public String PaymentSuccess(HttpSession session, Model model) {
        model.addAttribute("page", "cash/paymentSuccess.jsp");
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        return "indexPro";
    }

    @GetMapping("/payment-error")
    public String PaymentError(HttpSession session, Model model) {
        model.addAttribute("page", "cash/paymentError.jsp");
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        return "indexPro";
    }

}
