package com.skillbank.main.vo;

import lombok.Data;

@Data
public class ReviewVO {

    private int review_pk;
    private int review_complete;
    private int review_client;
    private int review_pro;
    private String review_category;
    private String review_title;
    private String review_txt;
    private double review_star;

}
