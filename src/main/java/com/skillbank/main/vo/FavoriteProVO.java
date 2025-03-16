package com.skillbank.main.vo;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class FavoriteProVO {
    private int user_pk;
    private int pro_pk;
    private Timestamp created_at;
}
