package com.skillbank.main.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ReqeustVO {
    private int request_no;
    private Integer r_user_id;  // int → Integer 변경    private String request_type;
    private String request_type;  // 🚀 request_type 추가!
    private Date r_date;
    private String request1;
    private String request2;
    private String request3;
    private String request4;
    private String request5;
    private String request6;
    private String request7;
    private String request8;
    private String request9;
    private String request10;
    private String request11;
    private String request12;
    private String request13;
    private String request14;
    private int r_pro_pk;
    private int r_request_no;
    private int r_complete;
/*//------------------------------------
    private int r_no;
    private String r_price_type;
    private int r_price;
    private String r_comment;

    private int r_request_no;

//------------------------------------------
private int pro_pk;
    private String pro_category;
    private String pro_profile_img;
    private int pro_cash;
    private int pro_favorite;
    private int pro_review;
    private String pro_name;
    private String pro_address;
    private String pro_description;
    private String pro_phone;*/
}
