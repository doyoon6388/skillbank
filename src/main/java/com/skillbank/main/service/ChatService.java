package com.skillbank.main.chat.service;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class ChatService {
    private String sender;
    private String content;
    private MessageType type;

    public void setTimestamp(String string) {
    }

    public enum MessageType {
        CHAT, JOIN, LEAVE
    }
}