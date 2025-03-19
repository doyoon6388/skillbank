package com.skillbank.main.vo;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommunityLikeVO {
    private int post_id;
    private int user_id;
    private Timestamp like_date;
}
