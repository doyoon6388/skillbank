package com.skillbank.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserAccountVO {
    private int user_pk;
    private String user_email;
    private String user_pw;
    private String user_name;
    private String user_gender;
    private String user_address;
    private Date user_birth;
    private String user_phone;
    private String user_profile_img;
    private String user_nickname;
    private int user_hasPro;
}
