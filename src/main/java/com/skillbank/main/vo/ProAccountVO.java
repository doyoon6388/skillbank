package com.skillbank.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProAccountVO {

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
}
