package com.skillbank.main.chat.controller;

import com.skillbank.main.chat.service.ChatService;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import java.time.LocalTime;

@Controller
public class ChatC {

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatService sendMessage(ChatService message) {
        message.setTimestamp(LocalTime.now().toString());  // 현재 시간 추가
        return message;
    }
}