package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainC {

    @Autowired
    private MainService mainService;

    @GetMapping("/main")
    public String main(Model model, HttpSession session) {
        model.addAttribute("page", "main/main.jsp");
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        return "index";
    }
}
