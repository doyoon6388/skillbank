package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pro")
public class ProC {
    private MainService mainService;

    @GetMapping("/main")
    public String proMain(Model model, HttpSession session) {
        session.setAttribute("mode", "on");
        System.out.println("프로모드");
        model.addAttribute("loginCheck", "login/loginPro.jsp");
        model.addAttribute("page", "main/main.jsp");
        return "indexPro";
    }


}
