package com.skillbank.main.test;

import lombok.Data;

import java.util.Date;

@Data
public class ChatMessage {
    private String roomId;
    private String sender;
    private String receiver;
    private String message;
    private Date timestamp;
}
