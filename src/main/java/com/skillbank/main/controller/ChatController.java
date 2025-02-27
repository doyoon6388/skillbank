package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.ChatMessage;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {

    @Autowired
    private MainService mainService;

    @GetMapping("/chat") // 사용자가 "/chat" 경로로 접근하면
    public String chatPage(HttpSession session, Model model) {
        Object mode = session.getAttribute("mode");
        System.out.println(mode);
        System.out.println(session.getAttribute("user"));
        if (mode.toString().equals("on")){
            model.addAttribute("loginCheck", "login/loginPro.jsp");
        model.addAttribute("page", "chater.jsp");
            return "indexPro";
        }else if (mode.toString().equals("off")){
            model.addAttribute("loginCheck", "login/loginOK.jsp");
            model.addAttribute("page", "chater.jsp");
            return "index";
        }else {
            model.addAttribute("loginCheck", "login/loginNO.jsp");
            model.addAttribute("page", "login/loginPage.jsp");
            return "index";
        }
    }

    @MessageMapping("/chat") // "/app/chat" 경로로 클라이언트가 메시지를 보낼 때 실행됨
    @SendTo("/topic/messages") // 메시지를 구독자에게 전달
    public ChatMessage sendMessage(ChatMessage message) {
        return message; // 메시지를 그대로 반환 (프론트에서 받을 수 있음)
    }
}