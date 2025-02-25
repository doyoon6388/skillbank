package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.UserTestVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class HC {
    @Autowired
    private MainService mainService;

    @GetMapping("/")
    public String index(Model model, HttpSession session) {
        model.addAttribute("loginCheck", mainService.loginCheck(session)) ;
        model.addAttribute("page", "main/main.jsp");
        return "index";
    }
    @GetMapping("/seller-main")
    public String sellerMain(Model model, HttpSession session) {
        model.addAttribute("loginCheck", "login/loginSeller.jsp");
        model.addAttribute("page", "main/main.jsp");
        return "index";
    }


}