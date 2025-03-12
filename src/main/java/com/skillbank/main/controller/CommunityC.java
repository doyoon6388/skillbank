package com.skillbank.main.controller;

import com.skillbank.main.service.CommunityService;
import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.CommunityPostVO;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
    public String together(Model model, HttpSession session,
                           @RequestParam(name = "page", defaultValue = "1") int page) {
        String category = "together";
        int totalCount = communityService.getPostCount(category);
        int pageSize = 2;
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);
        if (totalPage < 1) {
            totalPage = 1;
        }
        if (page < 1) {
            page = 1;
        }
        if (page > totalPage) {
            page = totalPage;
        }

        List<CommunityPostVO> postList = communityService.getPostsByPage(category, page);
        model.addAttribute("communityPost", postList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPage", totalPage);

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
    public String askpro(Model model, HttpSession session,
                         @RequestParam(name = "page", defaultValue = "1") int page) {
        String category = "askpro";

        int totalCount = communityService.getPostCount(category);

        int pageSize = 2;

        int totalPage = (int) Math.ceil((double) totalCount / pageSize);
        if (totalPage < 1) {
            totalPage = 1;
        }

        if (page < 1) {
            page = 1;
        }
        if (page > totalPage) {
            page = totalPage;
        }

        List<CommunityPostVO> postVOList = communityService.getPostsByPage(category, page);
        model.addAttribute("communityPost", postVOList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPage", totalPage);


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
        Object user = session.getAttribute("user");
        Object mode = session.getAttribute("mode");
        if (user == null) {
            model.addAttribute("loginCheck", "login/loginNO.jsp");
            model.addAttribute("page", "login/loginPage.jsp");
            return "index";
        } else if (user != null && mode != null && mode.toString().equals("on")) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            model.addAttribute("page", "community/communityProWrite.jsp");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", "login/loginOK.jsp");
            model.addAttribute("page", "community/communityClientWrite.jsp");
            return "index";
        }
    }

    @PostMapping("write")
    public String writePost(Model model, HttpSession session, CommunityPostVO communityPostVO, MultipartFile file) {
        String content = communityPostVO.getCommu_content();
//        System.out.println(communityPostVO);
        if (content != null) {
            content = content.trim();
//            content = content.replaceAll("\\r?\\n+", "\n");
//            content = content.replaceAll("^\\s+", ""); // 文字列の先頭にある全空白文字を消す
            communityPostVO.setCommu_content(content);
//            System.out.println(content);
        }

        communityService.createPost(communityPostVO, file);
        return "redirect:/community/" + communityPostVO.getCommu_post_category();
    }

    @GetMapping("detail")
    public String communityDetailPost(@RequestParam("postId") int postId, Model model, HttpSession session) {
        CommunityPostVO postVO = communityService.getPostById(postId);
        if (postVO.getCommu_content() != null) {
            String replaced = postVO.getCommu_content().replaceAll("\\r?\\n", "<br>");
            postVO.setCommu_content(replaced);
            System.out.println(postVO.getCommu_content());
        }
        model.addAttribute("communityPost", postVO);
        model.addAttribute("page", "community/communityDetail.jsp");

        Object mode = session.getAttribute("mode");
        if (mode != null && "on".equals(mode.toString())) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }

    }

    @PostMapping("delete")
    public String communityDeletePost(@RequestParam("postId") int postId, Model model, HttpSession session) {
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        CommunityPostVO postVO = communityService.getPostById(postId);

        if (user.getUser_pk() != postVO.getCommu_user_id()) {

            model.addAttribute("communityPost", postVO);
            return "redirect:/community/" + postVO.getCommu_post_category();
        }

        communityService.commuDeletePost(postId);
        return "redirect:/community/" + postVO.getCommu_post_category();
    }


//    @PostMapping("update")
//    public String communityUpdatePost(CommunityPostVO communityPostVO, @RequestParam("file") MultipartFile file, HttpSession session) {
//        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
//        if (user == null) {
//            return "redirect:/login";
//        }
//
//
//    }













}
