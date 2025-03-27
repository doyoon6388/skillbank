package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import com.skillbank.main.service.ReviewService;
import com.skillbank.main.vo.ReviewVO;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import java.io.File;
import java.util.UUID;

@Controller
public class ReviewC {

    @Autowired
    private MainService mainService;

    @Autowired
    private ReviewService reviewService;

    @Value("${upload}")
    private String uploadFolder;

    @PostMapping("/review")
    public String review(ReviewVO reviewVO, Model model, HttpSession session, int chatReqNo) {

        reviewService.completeRequest(chatReqNo);
        reviewService.completeChat(chatReqNo);

        if (reviewService.createReview(reviewVO) == 1) {
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
    public String updateReview(ReviewVO reviewVO, MultipartFile[] files, Model model, HttpSession session) {

        String fileNames = "";
        for (MultipartFile file : files) {
            String oriName = file.getOriginalFilename();
            if (oriName == null || oriName.isEmpty()) {
                continue;
            }
            // 파일 확장자 추출
            String fileExtension = oriName.substring(oriName.lastIndexOf("."));
            // UUID를 이용해 중복되지 않는 파일명 생성 (앞부분만 사용)
            UUID uuid = UUID.randomUUID();
            String fileName = uuid.toString().split("-")[0] + fileExtension;
            File saveFile = new File(uploadFolder + File.separator + fileName);
            fileNames += fileName + "!";
            try {
                file.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // ReviewVO에 파일명 설정 및 DB 저장 (파일명은 '!' 구분자로 연결된 문자열)
        reviewVO.setReview_file(fileNames);
        System.out.println(reviewVO);
        if (reviewService.updateReview(reviewVO) == 1) {
            reviewService.updateProReview(reviewVO);
            System.out.println("수정 완료 레전드");
        }
        return "redirect:/main";
    }

    @GetMapping("review/{review_pk}")
    public String reviewDetail(@PathVariable int review_pk, Model model, HttpSession session) {

        model.addAttribute("reviewVO", reviewService.getReviewByPk(review_pk));
        model.addAttribute("page", "review/reviewDetail.jsp");
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        return "index";
    }


}