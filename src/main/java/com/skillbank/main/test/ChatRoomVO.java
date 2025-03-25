package com.skillbank.main.test;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ChatRoomVO {
    private int chat_room_no;
    private int chat_user_id;
    private String chat_user_name;
    private int chat_pro_id;
    private String chat_pro_name;
    private int chat_req_no;
    private String cloneReqHTML;
    private Timestamp chat_created_at;
    private int chat_complete;
}
