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
}
