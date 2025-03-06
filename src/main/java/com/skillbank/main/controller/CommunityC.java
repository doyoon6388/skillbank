package com.skillbank.main.controller;

import com.skillbank.main.service.CommunityService;
import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.CommunityPostVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/community")
@Controller
public class CommunityC {

    @Autowired
    private MainService mainService;

    @Autowired
    private CommunityService communityService;

    @GetMapping("main")
    public String community(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
            model.addAttribute("page", "community/communityClient.jsp");
            model.addAttribute("communityPage", "clientMain.jsp");
        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }

    @GetMapping("pro/main")
    public String communityPro(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "community/communityPro.jsp");
        model.addAttribute("communityPage", "proMain.jsp");
        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }

    @GetMapping("together")
    public String together(Model model, HttpSession session) {

        model.addAttribute("communityPost", communityService.getAllTogePost());

        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "community/communityClient.jsp");
        model.addAttribute("communityPage", "clientAction.jsp");
        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }
    @GetMapping("askpro")
    public String askpro(Model model, HttpSession session) {

        model.addAttribute("communityPost", communityService.getAllAskproPost());

        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "community/communityClient.jsp");
        model.addAttribute("communityPage", "clientAskpro.jsp");
        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }
    @GetMapping("write")
    public String writePost(Model model, HttpSession session) {
        if (session.getAttribute("user") == null){
            model.addAttribute("loginCheck", "login/loginNO.jsp");
            model.addAttribute("page", "login/loginPage.jsp");
            return "index";
        } else {
            model.addAttribute("loginCheck", "login/loginOK.jsp");
            model.addAttribute("page", "community/communityClientWrite.jsp");
            return "index";
        }
    }
    @PostMapping("write")
    public String writePost(Model model, HttpSession session, CommunityPostVO communityPostVO) {
      communityService.createPost(communityPostVO);
    return "redirect:/community/" + communityPostVO.getCommu_post_category();
    }



}
