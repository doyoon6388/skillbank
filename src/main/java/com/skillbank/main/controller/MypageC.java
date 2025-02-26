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
        if (session != null && session.getAttribute("user") != null) {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            model.addAttribute("page", "mypage/mypage.jsp");
            return "index";
        } else {
            model.addAttribute("loginCheck", "login/loginNO.jsp");
            model.addAttribute("page", "login/loginPage.jsp");
            return "index";
        }


    }
}
