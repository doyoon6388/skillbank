package com.skillbank.main.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserTestVO {
    private int id;
    private String username;
    private String password;
    private String email;
}
