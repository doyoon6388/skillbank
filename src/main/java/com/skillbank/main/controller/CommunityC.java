package com.skillbank.main.controller;

import com.skillbank.main.mapper.CommunityMapper;
import com.skillbank.main.service.CommunityService;
import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.CommunityCommentVO;
import com.skillbank.main.vo.CommunityPostVO;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;
import java.util.List;

@RequestMapping("/community")
@Controller
public class CommunityC {

    @Autowired
    private MainService mainService;

    @Autowired
    private CommunityService communityService;
    @Autowired
    private CommunityMapper communityMapper;

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
        model.addAttribute("page", "community/communityClient.jsp");
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
    public String together(CommunityPostVO communityPostVO, Model model, HttpSession session,
                           @RequestParam(name = "page", defaultValue = "1") int page) {

        System.out.println("Session mode: " + session.getAttribute("mode"));

        // セッションの mode でプロかどうかを判定する
        if (session.getAttribute("mode") != null && "on".equals(session.getAttribute("mode").toString())) {
            communityPostVO.setCommu_writer(0);
        } else {
            communityPostVO.setCommu_writer(1);
        }

        String category = "together";
        int totalCount = communityService.getPostCount(category);  // 29개

        List<CommunityPostVO> postList = communityService.getPostsByPage(model, category, totalCount, page);
        System.out.println(postList.size());
        model.addAttribute("communityPost", postList);
        model.addAttribute("currentPage", page);


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

        List<CommunityPostVO> postVOList = communityService.getPostsByPage(model, category, totalCount, page);
        model.addAttribute("communityPost", postVOList);
        model.addAttribute("currentPage", page);



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

    @GetMapping("appeal")
    public String appeal(Model model, HttpSession session,
                         @RequestParam(name = "page", defaultValue = "1") int page) {
        String category = "appeal";

        int totalCount = communityService.getPostCount(category);

        List<CommunityPostVO> postVOList = communityService.getPostsByPage(model, category, totalCount, page);
        model.addAttribute("communityPost", postVOList);
        model.addAttribute("currentPage", page);

        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "community/communityClient.jsp");
        model.addAttribute("communityPage", "proAppeal.jsp");

        if (mode != null && mode.toString().equals("on")) {
            model.addAttribute("loginCheck", "login/loginPro.jsp");
            return "indexPro";
        } else {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            return "index";
        }
    }

    @GetMapping("wisdom")
    public String wisdom(Model model, HttpSession session,
                         @RequestParam(name = "page", defaultValue = "1") int page) {
        String category = "wisdom";

        int totalCount = communityService.getPostCount(category);

        List<CommunityPostVO> postVOList = communityService.getPostsByPage(model, category, totalCount, page);
        model.addAttribute("communityPost", postVOList);
        model.addAttribute("currentPage", page);

        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "community/communityPrp.jsp");
        model.addAttribute("communityPage", "proWisdom.jsp");

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
    public String writePost(Model model, HttpSession session, @ModelAttribute CommunityPostVO communityPostVO, MultipartFile file) {
        String content = communityPostVO.getCommu_content();

        if (content != null) {
            content = content.trim();
            communityPostVO.setCommu_content(content);
        }

        communityService.createPost(communityPostVO, file);
        return "redirect:/community/" + communityPostVO.getCommu_post_category();
    }

    @GetMapping("search")
    public String searchByTag(@RequestParam("tag") String tag, Model model) {
        List<CommunityPostVO> posts = communityService.getPostsByTag(tag);
        model.addAttribute("communityPost", posts);
        model.addAttribute("currentPage", 1);

        // 投稿がある場合にカテゴリを取得してリダイレクト
        if (!posts.isEmpty()) {
            String category = posts.get(0).getCommu_post_category();
            return "redirect:/community/" + category;
        }

        // 投稿がない場合はメインページに戻る
        return "redirect:/community/main";

    }

//    @PostMapping("write")
//    public String writePost(Model model, HttpSession session, CommunityPostVO communityPostVO, MultipartFile file) {
//        // セッションの mode をデバッグ出力
//        System.out.println("Session mode: " + session.getAttribute("mode"));
//
//        // セッションの mode でプロかどうかを判定する
//        if (session.getAttribute("mode") != null && "on".equals(session.getAttribute("mode").toString())) {
//            communityPostVO.setCommu_writer(0);
//        } else {
//            communityPostVO.setCommu_writer(1);
//        }
//
//        String content = communityPostVO.getCommu_content();
//        if (content != null) {
//            communityPostVO.setCommu_content(content.trim());
//        }
//        communityService.createPost(communityPostVO, file);
//        return "redirect:/community/" + communityPostVO.getCommu_post_category();
//    }
//


    @GetMapping("detail")
    public String communityDetailPost(@RequestParam("postId") int postId,
                                      @RequestParam(name="mode", required=false) String mode,
                                      Model model, HttpSession session) {
        CommunityPostVO postVO = communityService.getPostById(postId);
        if (postVO == null) {

            return "redirect:/community/main";
        }

        if (postVO.getCommu_content() != null) {
            String originalContent = postVO.getCommu_content();
            if ("edit".equals(mode)) {
                // 編集モード: <br> を \n に戻す
                postVO.setCommu_content(originalContent.replaceAll("<br>", "\n"));
            } else {
                // 通常モード: \n を <br> に変換
                postVO.setCommu_content(originalContent.replaceAll("\\r?\\n", "<br>"));
            }
        }

        model.addAttribute("communityPost", postVO);
        List<CommunityCommentVO> commentList = communityService.getCommentsByPost(postId);
        model.addAttribute("commentList", commentList);
        model.addAttribute("page", "community/communityDetail.jsp");

        Object modeSession = session.getAttribute("mode");
        if (modeSession != null && "on".equals(modeSession.toString())) {
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
        if (postVO == null) {

            return "redirect:/community/main";
        }

        String category = postVO.getCommu_post_category();

        communityService.deletePostWithComments(postId);

        return "redirect:/community/" + category;
    }


    @PostMapping("update")
    public String communityUpdatePost(CommunityPostVO communityPostVO, @RequestParam(value = "file", required = false) MultipartFile file, HttpSession session) {
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        CommunityPostVO existing = communityService.getPostById(communityPostVO.getCommu_post_id());
        if (existing == null || user.getUser_pk() != existing.getCommu_user_id()) {
            return "redirect:/community/detail?postId=" + communityPostVO.getCommu_post_id();
        }

        communityService.communityUpdatePost(communityPostVO, file);
        return "redirect:/community/detail?postId=" + communityPostVO.getCommu_post_id();

    }

    @ResponseBody
    @PostMapping("comment")
    public List<CommunityCommentVO> addComment(@RequestBody CommunityCommentVO communityCommentVO, HttpSession session) {

        communityService.addComment(communityCommentVO);

        return communityService.getCommentsByPost(communityCommentVO.getComment_post_id());
    }






}
