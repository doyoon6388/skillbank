package com.skillbank.main.service;


import lombok.Data;

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