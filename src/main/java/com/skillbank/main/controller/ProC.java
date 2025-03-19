package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.service.ProService;
import com.skillbank.main.vo.DeductCashVO;
import com.skillbank.main.vo.ProAccountVO;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/pro")
public class ProC {

    @Autowired
    private MainService mainService;

    @Autowired
    private ProService proService;

    @GetMapping("/main")
    public String proMain(Model model, HttpSession session) {

        UserAccountVO userSession = (UserAccountVO) session.getAttribute("user");
        int pk = userSession.getUser_pk();
        session.setAttribute("proSession", mainService.makeProSession(pk));
        System.out.println(mainService.makeProSession(pk));

        session.setAttribute("mode", "on");
        session.setAttribute("checked", "checked");
        model.addAttribute("loginCheck", mainService.loginCheck(session));


        if (!model.containsAttribute("page")) {
            model.addAttribute("page", "main/main.jsp");
        }

        System.out.println("프로모드");
        return "indexPro";
    }

    @GetMapping("/cash")
    public String cash(Model model, HttpSession session) {
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("page", "cash/cash.jsp");
        return "indexPro";
    }

    @ResponseBody
    @PostMapping("/deduct-cash")
    public Map<String, Object> deductCash(@RequestBody DeductCashVO deductCashVO, HttpSession session) {

        Map<String, Object> result = new HashMap<>();

        ProAccountVO proAccountVO = (ProAccountVO) session.getAttribute("proSession");

        if(proAccountVO.getPro_cash() < 50) {
            result.put("success", false);
            result.put("message", "잔액 부족");
            return result;
        }

        proService.deductCash(deductCashVO);
        proAccountVO.setPro_cash(proAccountVO.getPro_cash() - 50);
        session.setAttribute("proSession", proAccountVO);

        result.put("success", true);
        result.put("newCash", proAccountVO.getPro_cash());
        return result;
    }

}
