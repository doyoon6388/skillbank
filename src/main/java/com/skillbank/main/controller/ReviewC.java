package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.service.ReviewService;
import com.skillbank.main.vo.ReviewVO;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class ReviewC {

    @Autowired
    private MainService mainService;

    @Autowired
    private ReviewService reviewService;

    @PostMapping("/review")
    public String review(ReviewVO reviewVO, Model model, HttpSession session, int chatReqNo) {

        reviewService.completeRequest(chatReqNo);
        reviewService.completeChat(chatReqNo);

        if (reviewService.createReview(reviewVO) == 1){
        System.out.println("등록완료");
        }

        model.addAttribute("reviewVO", reviewService.getReview(reviewVO));
        model.addAttribute("page", "review/reviewWrite.jsp");
        model.addAttribute("loginCheck", mainService.loginCheck(session));

        return "index";
    }
    @GetMapping("mypage/review")
    public String reviewList(Model model, HttpSession session) {
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        model.addAttribute("page", "review/reviewList.jsp");
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("incompleteReview", reviewService.incompleteReviewList(user.getUser_pk()));
        model.addAttribute("completeReview", reviewService.completeReviewList(user.getUser_pk()));

        return "index";
    }
    @GetMapping("mypage/reviewUpdate/{reviewPk}")
    public String reviewUpdate(@PathVariable int reviewPk, Model model, HttpSession session) {
        model.addAttribute("reviewVO", reviewService.getReviewByPk(reviewPk));
        model.addAttribute("page", "review/reviewUpdate.jsp");
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        return "index";
    }
    @PostMapping("mypage/updateReview")
    public String updateReview(ReviewVO reviewVO, Model model, HttpSession session) {
        return "index";
    }


}
