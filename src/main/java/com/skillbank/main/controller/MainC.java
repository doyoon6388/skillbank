package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.UserAccountVO;
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
        Object mode = session.getAttribute("mode");
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        if (user == null) {
            model.addAttribute("page", "login/loginPage.jsp");
            return "index";
        } else {
            model.addAttribute("page", "main/main.jsp");
            if (mode != null && mode.toString().equals("on")) {
                return "indexPro";
            } else {
                return "index";
            }
        }
    }
}
