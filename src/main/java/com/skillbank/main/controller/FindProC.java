package com.skillbank.main.controller;

import com.skillbank.main.service.FindProService;
import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.ProAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RequestMapping("/findpro")
@Controller
public class FindProC {

    @Autowired
    private MainService mainService;

    @Autowired
    private FindProService findProService;

    @GetMapping
    public String findPro(Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "findpro/findPro.jsp");
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        if (mode != null && mode.toString().equals("on")) {
            return "indexPro";
        } else {
            return "index";
        }
    }
    @ResponseBody
    @PostMapping
    public List<ProAccountVO> findProList(@RequestBody Map<String, String> params) {
        String category = params.get("category");
        String sort = params.get("sort");
        return findProService.getPros(category, sort);
    }

    @GetMapping("detail/{pro_pk}")
    public String FindproDetail(@PathVariable("pro_pk") int pro_pk, Model model, HttpSession session) {
        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "findpro/findProDetail.jsp");
        model.addAttribute("proDetail", findProService.getDetail(pro_pk));
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        if (mode != null && mode.toString().equals("on")) {
            return "indexPro";
        } else {
            return "index";
        }
    }


}

