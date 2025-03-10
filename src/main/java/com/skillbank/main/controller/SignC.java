package com.skillbank.main.controller;

import com.skillbank.main.service.SignService;
import com.skillbank.main.vo.UserAccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

@Controller
public class SignC {

    @Autowired
    private SignService signService;

    // ✅ 생성자 주입 방식 사용
    public SignC(SignService signService) {
        this.signService = signService;
    }

    @GetMapping("/signin")
    public String signin(Model model) {
        model.addAttribute("page", "sign/sign.jsp");
        model.addAttribute("loginCheck", "login/loginNO.jsp");

        System.out.println("DEBUG: /signin 호출됨");
        System.out.println("DEBUG: loginCheck = " + model.getAttribute("loginCheck"));

        return "index";
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam("user_email") String email,
                               @RequestParam("user_pw") String password,
                               @RequestParam("user_pw_confirm") String passwordConfirm,
                               @RequestParam("user_name") String name,
                               @RequestParam("user_nickname") String nickname,
                               RedirectAttributes redirectAttributes) {

        System.out.println("DEBUG: 회원가입 요청 - email: " + email + ", nickname: " + nickname);

        // ✅ 비밀번호 확인 실패 시 처리
        if (!password.equals(passwordConfirm)) {
            redirectAttributes.addFlashAttribute("error", "パスワードが一致しません。");
            System.out.println("ERROR: 비밀번호 불일치");
            return "redirect:/signin";
        }

        UserAccountVO user = new UserAccountVO();
        user.setUser_email(email);
        user.setUser_pw(password);
        user.setUser_name(name);
        user.setUser_nickname(nickname);
        user.setUser_hasPro(0);

        // ✅ 회원가입 실행
        boolean isRegistered = signService.registerUser(user);
        if (isRegistered) {
            redirectAttributes.addFlashAttribute("message", "登録が完了しました。");
            System.out.println("DEBUG: 회원가입 성공 - email: " + email);
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("error", "登録に失敗しました。");
            System.out.println("ERROR: 회원가입 실패 - email: " + email);
            return "redirect:/signin";
        }
    }

    @PostMapping("/check-email")
    @ResponseBody
    public Map<String, Object> checkEmail(@RequestBody String email) {
        System.out.println("DEBUG: 이메일 중복 확인 요청 - email: " + email);

        int isAvailable = signService.isEmailAvailable(email);
        Map<String, Object> response = new HashMap<>();
        response.put("status", isAvailable);

        System.out.println("DEBUG: 이메일 사용 가능 여부 - " + response);
        return response;
    }

    @PostMapping("/check-nickname")
    @ResponseBody
    public Map<String, Object> checkNickname(@RequestBody String nickname) {
        System.out.println("DEBUG: 이메일 중복 확인 요청 - nickname: " + nickname);

        int isAvailable = signService.isNicknameAvailable(nickname);
        Map<String, Object> response = new HashMap<>();
        response.put("status", isAvailable);

        System.out.println("DEBUG: 닉네임 사용 가능 여부 - " + response);
        return response;
    }
}