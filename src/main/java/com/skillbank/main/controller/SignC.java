package com.skillbank.main.controller;

import com.skillbank.main.service.SignService;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

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
                               @RequestParam("user_birth")
                               @DateTimeFormat(pattern = "yyyy-MM-dd") Date birth, // 변환 추가
                               @RequestParam("user_phone") String phone,
                               @RequestParam("user_profile_img") String profileImg,
                               @RequestParam("user_nickname") String nickname,
                               RedirectAttributes redirectAttributes) {

        System.out.println("회원가입 요청: user_birth = " + birth);

        UserAccountVO user = new UserAccountVO();
        user.setUser_email(email);
        user.setUser_pw(password);
        user.setUser_name(name);
        user.setUser_gender(gender);
        user.setUser_address(address);
        user.setUser_birth(birth); // Date 타입으로 저장
        user.setUser_phone(phone);
        user.setUser_profile_img(profileImg);
        user.setUser_nickname(nickname);
        user.setUser_hasPro(0);

        boolean isRegistered = signService.registerUser(user);
        if (isRegistered) {
            redirectAttributes.addFlashAttribute("message", "登録が完了しました。");
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("error", "登録に失敗しました。");
            return "redirect:/signin";
        }
    }
}
