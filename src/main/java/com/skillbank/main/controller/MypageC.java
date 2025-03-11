package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.service.MypageService;
import com.skillbank.main.vo.ProAccountVO;
import com.skillbank.main.vo.UserAccountVO;
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
                newFileName = mypageService.profileImgUpdate(user_pk, user_profile_img);
            } else {
                newFileName = "resources/icons/profile/default.png"; // 기본 이미지 설정
            }
            user.setUser_profile_img(newFileName);
            session.setAttribute("user", user);
            return "redirect:/mypage";
        }
    }

    @PostMapping("/pro")
    public String profileImgUpdatePro(int pro_pk, MultipartFile pro_profile_img, HttpSession session) {
        ProAccountVO pro = (ProAccountVO) session.getAttribute("proSession");
        if (pro == null) {
            return "redirect:/login";
        } else {
            String newFileName;
            if (pro_profile_img != null && !pro_profile_img.isEmpty()) {
                newFileName = mypageService.updateProfileImg(pro_pk, pro_profile_img);
            } else {
                newFileName = "resources/icons/profile/default.png";
            }
            pro.setPro_profile_img(newFileName);
            session.setAttribute("proSession", pro);
            return "redirect:/mypage";
        }
    }


}   // MypageC 끝
