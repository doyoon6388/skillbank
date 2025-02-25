package com.skillbank.chat.controller;

import com.skillbank.chat.service.ChatService;
import com.skillbank.main.service.MainService;
import jakarta.servlet.http.HttpSession;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class ChatC {
    private MainService mainService;
    public String chat(Model model, HttpSession session) {
        model.addAttribute("page", "community/community.jsp");
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        return "chat";
    }

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatService sendMessage(ChatService chatService) {
        return chatService;
    }

    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public ChatService addUser(ChatService chatService) {
        chatService.setContent(chatService.getSender() + "님이 입장하셨습니다.");
        return chatService;
    }
}