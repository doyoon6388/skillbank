package com.skillbank.main.controller;

import com.skillbank.main.service.SignService;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SignC {

    @Autowired
    private SignService signService;

    @GetMapping("/signin")
    public String signin(Model model, HttpSession session) {
        model.addAttribute("page", "sign/sign.jsp");
        model.addAttribute("loginCheck", "login/loginNO.jsp"); // 로그인하지 않은 상태 전달
        return "index"; // index.jsp를 렌더링
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam("user_email") String email,
                               @RequestParam("user_pw") String password,
                               @RequestParam("user_name") String name,
                               @RequestParam("user_gender") String gender,
                               @RequestParam("user_address") String address,
                               @RequestParam("user_phone") String phone,
                               RedirectAttributes redirectAttributes) {

        UserAccountVO user = new UserAccountVO();
        user.setUser_email(email);
        user.setUser_pw(password);
        user.setUser_name(name);
        user.setUser_gender(gender);
        user.setUser_address(address);
        user.setUser_phone(phone);
        user.setUser_hasPro(0); // 기본값: 일반 사용자

        boolean isRegistered = signService.registerUser(user);
        if (isRegistered) {
            redirectAttributes.addFlashAttribute("message", "登録が完了しました。");
            return "redirect:/login/loginPage";  // 성공 시 로그인 페이지로 이동
        } else {
            redirectAttributes.addFlashAttribute("error", "登録に失敗しました。");
            return "redirect:/signin";  // 실패 시 간단한 경로로 이동
        }
    }
}
