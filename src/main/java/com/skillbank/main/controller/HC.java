package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HC {

    @Autowired
    private MainService mainService;

    @GetMapping("/")
    public String index(Model model, HttpSession session) {
        session.setAttribute("checked", "");
        model.addAttribute("loginCheck", mainService.loginCheck(session));

        if (!model.containsAttribute("page")) {
            model.addAttribute("page", "main/main.jsp");
        }

        return "index";
    }

    @GetMapping("/usermode")
    public String userMode(HttpSession session) {
        session.setAttribute("mode", "off");
        System.out.println("유저모드");
        return "redirect:/";
    }

}