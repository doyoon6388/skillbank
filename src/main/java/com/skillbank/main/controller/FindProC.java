package com.skillbank.main.controller;

import com.skillbank.main.service.FindProService;
import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.FavoriteProVO;
import com.skillbank.main.vo.ProAccountVO;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
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

        boolean isLoggedIn = (session.getAttribute("user") != null);
        model.addAttribute("isLoggedIn", isLoggedIn);

        Object mode = session.getAttribute("mode");
        model.addAttribute("page", "findpro/findProDetail.jsp");
        model.addAttribute("proDetail", findProService.getDetail(pro_pk));
        model.addAttribute("loginCheck", mainService.loginCheck(session));

        int user_pk = (session.getAttribute("user") != null) ? ((UserAccountVO) session.getAttribute("user")).getUser_pk() : 0;
        boolean favorited = false;
        if(user_pk != 0) {
            favorited = findProService.isFavorited(user_pk, pro_pk);
        }
        model.addAttribute("favorited", favorited);


        if (mode != null && mode.toString().equals("on")) {
            return "indexPro";
        } else {
            return "index";
        }
    }

    @ResponseBody
    @PostMapping("/favorite")
    public Map<String, Object> addFavorite(@RequestBody FavoriteProVO favoriteVO,
                                           HttpSession session, HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        if (user == null) {
            String referer = request.getHeader("referer");  // 이전 페이지 URL
            session.setAttribute("prevPage", referer);      // 로그인 성공 후 복귀 URL 저장
            response.put("loginRequired", true);
            return response;
        }

        // 로그인 된 경우
        boolean favorited = findProService.toggleFavorite(favoriteVO.getUser_pk(), favoriteVO.getPro_pk());
        int favoriteCount = findProService.getFavoriteCount(favoriteVO.getPro_pk());

        response.put("favorited", favorited);
        response.put("favoriteCount", favoriteCount);
        return response;
    }


}

