package com.skillbank.main.controller;

import com.skillbank.main.service.FindProService;
import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.FavoriteProVO;
import com.skillbank.main.vo.ProAccountVO;
import com.skillbank.main.vo.UserAccountVO;
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
    public ResponseEntity<Map<String, Object>> toggleFavorite(@RequestBody FavoriteProVO favoriteProVO) {
        // toggleFavorite: 찜이 되어있으면 제거, 안 되어있으면 추가 후 결과 상태를 반환
        boolean favorited = findProService.toggleFavorite(favoriteProVO.getUser_pk(), favoriteProVO.getPro_pk());
        // 변경된 찜 수를 가져옴 (favorite_pro 테이블에 해당 pro_pk의 건수를 조회)
        int favoriteCount = findProService.getFavoriteCount(favoriteProVO.getPro_pk());

        Map<String, Object> response = new HashMap<>();
        response.put("favorited", favorited);
        response.put("favoriteCount", favoriteCount);
        return ResponseEntity.ok(response);
    }


}

