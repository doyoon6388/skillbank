package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.service.MypageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/mypage")
@Controller
public class MypageC {

    @Autowired
    private MainService mainService;

    @Autowired
    private MypageService mypageService;

    @GetMapping("/")
    public String mypage(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        if (session.getAttribute("user") == null){
            model.addAttribute("loginCheck","login/loginNO.jsp");
            model.addAttribute("page","login/loginPage.jsp");
            return "index";
        }
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

    @PostMapping("/")
    public String profileImgUpdate(int user_pk, MultipartFile newImg, HttpSession session) {
        mypageService.updateProfileImg(user_pk, newImg);
        return "redirect:/mypage";
    }

}
