package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.service.RequestService;
import com.skillbank.main.vo.*;
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
        if (mode != null && mode.toString().equals("on")) {
            session.removeAttribute("mode");
            session.removeAttribute("proSession");
            session.removeAttribute("checked");
        }
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("page", "request/request.jsp");
            return "index";
    }

    @GetMapping("/move")
    public String move(Model model, HttpSession session) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));

        model.addAttribute("page", "request/move.jsp");
        return "index";
    }
    @GetMapping("/clean")
    public String clean(Model model, HttpSession session) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("page", "request/clean.jsp");
        return "index";
    }

    @GetMapping("/my-request")
    public String myRequestRedirect(HttpSession session) {
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        return "redirect:/my-request/" + user.getUser_pk();
    }

    @GetMapping("/my-request/{r_user_id}")
    public String myRequest2(Model model, HttpSession session, @PathVariable int r_user_id) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        System.out.println(r_user_id);
        model.addAttribute("request", requestService.requestList(r_user_id));
        model.addAttribute("page", "request/myRequest.jsp");

        return "index";
    }

    @GetMapping("/my-request2")
    public String myRequest3(Model model, HttpSession session, int no) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("request", requestService.requestList2(no));
        model.addAttribute("proResponse", requestService.proResponse(no));
        model.addAttribute("page", "request/myRequest2.jsp");
        return "index";
    }

    @PostMapping("/my-request")
    public String myRequest(Model model, HttpSession session, @ModelAttribute ReqeustVO reqeustVO) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));

        // 🛠 r_user_id가 null이면 세션에서 가져와서 설정
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        if (reqeustVO.getR_user_id() == null && user != null) {
            reqeustVO.setR_user_id(user.getUser_pk());
        }

        requestService.requestReg(reqeustVO);
        return "redirect:/my-request?id=" + reqeustVO.getR_user_id();
    }




    @ResponseBody
    @GetMapping("/my-request-detail")
    public ReqeustVO myRequestDetail(@RequestParam int pk) {
        return requestService.getDetail(pk);
    }

    @ResponseBody
    @GetMapping("/my-response-detail")
    public ProResponseVO myResponseDetail(@RequestParam int pk) {
        return requestService.proResponseDetail(pk);
    }



    @GetMapping("/request-delete")
    public String requestDelete(int pk, HttpSession session) {
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        requestService.requestDelete(pk);
        return "redirect:/my-request?id=" + user.getUser_pk();
    }

    @GetMapping("/my-receive")
    public String myReceive(Model model, HttpSession session) {
        ProAccountVO proAccountVO = (ProAccountVO) session.getAttribute("proSession");
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("page", "request/myReceive.jsp");
        model.addAttribute("proRequest", requestService.proRequestList(proAccountVO));

        return "indexPro";
    }

    @GetMapping("/request-send")
    public String requestSend(Model model, HttpSession session, int no, String userId) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("page", "request/requestSend.jsp");
        model.addAttribute("proRequest", requestService.proRequestDetail(no));

        return "indexPro";
    }

    @PostMapping("/request-send")
    public void requestSend(@RequestBody RequestSendVO requestVO) {
        System.out.println("받은 데이터: " + requestVO);
        requestService.requestSend(requestVO);
    }


}
