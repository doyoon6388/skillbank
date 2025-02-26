package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityC {

    @Autowired
    private MainService mainService;

    @GetMapping("/community")
    public String community(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("page", "community/community.jsp");
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("page", "community/community.jsp");
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }
}
