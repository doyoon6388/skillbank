package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RequestC {

    @Autowired
    private MainService mainService;

    @GetMapping("/request")
    public String request(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
            model.addAttribute("page", "request/request.jsp");
        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            model.addAttribute("ifYouPro","1");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }

    @GetMapping("/move")
    public String move(Model model, HttpSession session) {
        model.addAttribute("loginCheck", "login/loginOK.jsp");
        model.addAttribute("page", "request/move.jsp");
        return "index";
    }


@PostMapping("/my-request")
    public String myRequest(Model model, HttpSession session) {
        model.addAttribute("loginCheck", "login/loginOK.jsp");
        model.addAttribute("page", "request/myRequest.jsp");
        return "index";
    }
}
