package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class FindProC {

    @Autowired
    private MainService mainService;

    @GetMapping("/findPro")
    public String findPro(Model model, HttpSession session) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("page", "findpro/findPro.jsp");
        return "findpro/findPro";

    }
}

