package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.service.RequestService;
import com.skillbank.main.vo.ReqeustVO;
import com.skillbank.main.vo.RequestSendVO;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RequestC {

    @Autowired
    private MainService mainService;
    @Autowired
    private RequestService requestService;


    @GetMapping("/request")
    public String request(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
            model.addAttribute("page", "request/request.jsp");
        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            model.addAttribute("ifYouPro","1");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }



    @GetMapping("/move")
    public String move(Model model, HttpSession session) {
        model.addAttribute("loginCheck", "login/loginOK.jsp");
        model.addAttribute("page", "request/move.jsp");
        return "index";
    }

    @GetMapping("/my-request")
    public String myRequest2(Model model, HttpSession session, int id) {
        model.addAttribute("loginCheck", "login/loginOK.jsp");
      model.addAttribute("request", requestService.requestList(id));
        model.addAttribute("page", "request/myRequest.jsp");
        return "index";
    }

    @PostMapping("/my-request")
    public String myRequest(Model model, HttpSession session, ReqeustVO reqeustVO) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));

        requestService.requestReg(reqeustVO);
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        return "redirect:/my-request?id=" + user.getUser_pk();

    }

    @ResponseBody
    @GetMapping("/my-request-detail")
    public ReqeustVO myRequestDetail(@RequestParam int pk) {
       return requestService.getDetail(pk);
    }

    @GetMapping("/request-delete")
    public String requestDelete(int pk, HttpSession session) {
            requestService.requestDelete(pk);
            UserAccountVO user = (UserAccountVO) session.getAttribute("user");
                return "redirect:/my-request?id=" + user.getUser_pk();
    }

    @GetMapping("/my-receive")
    public String myReceive(Model model, HttpSession session) {
        model.addAttribute("loginCheck", "login/loginOK.jsp");
        model.addAttribute("page", "request/myReceive.jsp");
       model.addAttribute("proRequest", requestService.proRequestList());

        return "indexPro";
    }

    @GetMapping("/request-send")
    public String requestSend(Model model, HttpSession session, int no) {
        model.addAttribute("loginCheck", "login/loginOK.jsp");
        model.addAttribute("page", "request/requestSend.jsp");
        model.addAttribute("proRequest", requestService.proRequestDetail(no));

        return "indexPro";
    }

    @PostMapping("/request-send")
    public String requestSend(Model model, HttpSession session, RequestSendVO reqeustVO) {
        model.addAttribute("loginCheck", "login/loginOK.jsp");
        model.addAttribute("page", "request/requestSend.jsp");


        requestService.requestSend(reqeustVO);
        return "redirect:/my-receive";
    }


}
