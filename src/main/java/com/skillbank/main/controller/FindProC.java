package com.skillbank.main.controller;

import com.skillbank.main.service.FindProService;
import com.skillbank.main.service.MainService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class FindProC {

    @Autowired
    private MainService mainService;
    @Autowired
    private FindProService findProService;

    @GetMapping("/findpro")
    public String findPro(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "findpro/findPro.jsp");
        model.addAttribute("services", findProService.getProServices()); // 추가

        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }


    @GetMapping("/findpro-result")
    public String findProResult(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "findpro/findPro.jsp");
        model.addAttribute("services",findProService.getProServices());
        if (mode != null && mode.toString().equals("on")){
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        }else{
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }



    @GetMapping("/findprotomap")
    public String findProtoMap(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "findpro/findProtoMap.jsp");
        if (mode != null && mode.toString().equals("on")) {
            // mode가 널이 아니고, mode 세션이 on이면
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }

    @GetMapping("/findproredirect")
    public String findProRedirect(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "findpro/findPro.jsp");
        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }


    }
}

