package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pro")
public class ProC {

    @Autowired
    private MainService mainService;

    @GetMapping("/main")
    public String proMain(Model model, HttpSession session) {
        session.setAttribute("mode", "on");
        session.setAttribute("checked", "checked");
        model.addAttribute("loginCheck", mainService.loginCheck(session));

        if (!model.containsAttribute("page")) {
            model.addAttribute("page", "main/main.jsp");
        }

        System.out.println("프로모드");
        return "indexPro";
    }

    @GetMapping("/cash")
    public String cash(Model model, HttpSession session) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("page", "cash/cash.jsp");
        return "indexPro";
    }

}
