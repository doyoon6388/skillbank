package com.skillbank.main.controller;

import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LineLoginC {

    private final String channelId;
    private final String redirectUri;

    public LineLoginC(Environment env) {
        this.channelId = env.getProperty("line.login.channel-id");
        this.redirectUri = env.getProperty("line.login.redirect-uri");
    }

    @GetMapping("/login/line")
    public String redirectToLineLogin() {
        String lineLoginUrl = "https://access.line.me/oauth2/v2.1/authorize" +
                "?response_type=code" +
                "&client_id=" + channelId +
                "&redirect_uri=" + redirectUri +
                "&scope=profile%20openid%20email" +
                "&state=randomString";

        return "redirect:" + lineLoginUrl;
    }

    @GetMapping("/login/line/callback")
    public String handleLineCallback(@RequestParam("code") String code) {
        System.out.println("✅ handleLineCallback 실행됨! 받은 코드: " + code);
        return "redirect:/";  // 이후 회원가입 또는 로그인 처리 로직 추가 예정
    }
}