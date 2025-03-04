package com.skillbank.main.controller;

import com.skillbank.main.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignC {

    @Autowired
    private SignService signService;

    @GetMapping("/signin")
    public String signin() {
        return "sign";
    }

}
