package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.ProAccountVO;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginC {

    @Autowired
    private MainService mainService;

    @GetMapping("/login")
    public String login(Model model, HttpSession session) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("page", "login/loginPage.jsp");
        return "index";
    }

    @PostMapping("/login")
    public String login(HttpSession session, Model model, UserAccountVO userAccountVO) {
        UserAccountVO user = mainService.loginValid(userAccountVO);
        if (user != null) {
            // 로그인 성공: 세션에 사용자 정보 저장
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(1000);
            return "redirect:/";
        } else {
            // 로그인 실패: 에러 메시지와 함께 로그인 페이지 재출력
            model.addAttribute("error", "로그인 정보가 올바르지 않습니다.");
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            model.addAttribute("page", "login/loginPage.jsp");
            return "index";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        session.removeAttribute("mode");
        session.removeAttribute("checked");
        return "redirect:/";
    }

    @ResponseBody
    @PostMapping("/haspro")
    public int haspro(@RequestBody UserAccountVO userAccountVO) {

        System.out.println(mainService.proCheck(userAccountVO));
        return mainService.proCheck(userAccountVO);
    }

    @GetMapping("/account/pro")
    public String accountPro(Model model) {
        model.addAttribute("page", "sign/proAccount.jsp");
        model.addAttribute("loginCheck", "login/loginOK.jsp");
        return "index";
    }

    @PostMapping("/account/pro")
    public String accountPro(HttpSession session, Model model, ProAccountVO proAccountVO) {
        mainService.makeProAccount(proAccountVO);
        mainService.makeHasProOne(proAccountVO);
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        user.setUser_hasPro(1);
        session.setAttribute("user", user);
        session.setAttribute("mode", "on");
        return "redirect:/pro/main";
    }

}
