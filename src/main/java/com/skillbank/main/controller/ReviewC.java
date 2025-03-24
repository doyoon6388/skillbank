package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.service.ReviewService;
import com.skillbank.main.vo.ReviewVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class ReviewC {

    @Autowired
    private MainService mainService;

    @Autowired
    private ReviewService reviewService;

    @PostMapping("/review")
    public String review(ReviewVO reviewVO, Model model, HttpSession session) {

        if (reviewService.createReview(reviewVO) == 1){
        System.out.println("등록완료");
        }

        model.addAttribute("reviewVO", reviewService.getReview(reviewVO));
        model.addAttribute("page", "review/reviewWrite.jsp");
        model.addAttribute("loginCheck", mainService.loginCheck(session));

        return "index";
    }


}
