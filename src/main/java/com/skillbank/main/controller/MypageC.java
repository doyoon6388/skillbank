package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.UserTestVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageC {

    @Autowired
    private MainService mainService;

    @GetMapping("/mypage")
    public String mypage(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("page", "mypage/mypage.jsp");
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("page", "mypage/mypage.jsp");
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }
}
