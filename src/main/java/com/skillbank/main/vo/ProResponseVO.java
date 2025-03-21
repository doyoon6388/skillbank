package com.skillbank.main.vo;

import lombok.Data;

@Data
public class ProResponseVO {
    private int pro_pk;
    private String pro_category;
    private String pro_profile_img;
    private int pro_cash;
    private int pro_favorite;
    private int pro_review;
    private String pro_name;
    private String pro_address;
    private String pro_description;
    private String pro_phone;
    private int r_no;
    private String r_price_type;
    private int r_price;
    private String r_comment;

    private int r_request_no;

    private int r_pro_pk;
}
