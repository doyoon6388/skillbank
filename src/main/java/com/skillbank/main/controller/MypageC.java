package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.service.MypageService;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/mypage")
public class MypageC {

    @Autowired
    private MainService mainService;

    @Autowired
    private MypageService mypageService;

    @GetMapping
    public String mypage(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        if (session.getAttribute("user") == null) {
            model.addAttribute("loginCheck", "login/loginNO.jsp");
            model.addAttribute("page", "login/loginPage.jsp");
            return "index";
        }
        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("page", "mypage/mypagePro.jsp");
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("page", "mypage/mypage.jsp");
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }

    @PostMapping
    public String profileImgUpdate(int user_pk, MultipartFile user_profile_img, HttpSession session) {
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        } else {
            String newFileName;
            if (user_profile_img != null && !user_profile_img.isEmpty()) {
                newFileName = mypageService.updateProfileImg(user_pk, user_profile_img);
            } else {
                newFileName = "resources/icons/profile/default.png"; // 기본 이미지 설정
            }
            user.setUser_profile_img(newFileName);
            session.setAttribute("user", user);
            return "redirect:/mypage";
        }
    }

    // ✅ AJAX 요청을 처리하기 위해 @ResponseBody 추가
    @PostMapping("/update-info")
    @ResponseBody
    public Map<String, Object> updateUserInfo(@RequestBody Map<String, String> request, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            UserAccountVO user = (UserAccountVO) session.getAttribute("user");
            if (user == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return response;
            }

            int user_pk = user.getUser_pk();
            String field = request.get("field");
            String value = request.get("value");

            // ✅ 생년월일 처리 (String → Date 변환)
            if (field.equals("user_birth")) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date parsedDate = dateFormat.parse(value);
                    mypageService.updateUserInfo(user_pk, field, parsedDate);  // Date 타입 전달
                    user.setUser_birth(parsedDate);  // 세션 업데이트
                } catch (ParseException e) {
                    response.put("success", false);
                    response.put("message", "생년월일 형식이 올바르지 않습니다.");
                    return response;
                }
            } else {
                mypageService.updateUserInfo(user_pk, field, value);
                if (field.equals("user_name")) user.setUser_name(value);
                else if (field.equals("user_phone")) user.setUser_phone(value);
                else if (field.equals("user_gender")) user.setUser_gender(value);
                else if (field.equals("user_address")) user.setUser_address(value);
            }

            session.setAttribute("user", user);  // ✅ 세션 갱신
            response.put("success", true);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "서버 오류 발생");
        }
        return response;  // ✅ JSON 형태로 응답
    }

}   // MypageC 끝