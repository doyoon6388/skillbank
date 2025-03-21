package com.skillbank.main.test;

import com.skillbank.main.service.MainService;
import com.skillbank.main.vo.ProAccountVO;
import com.skillbank.main.vo.ReqeustVO;
import com.skillbank.main.vo.UserAccountVO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/test/chat")
@Controller
@Log4j2
public class TestChatController {

    @Autowired
    private TestService testService;

    @Autowired
    private MainService mainService;

    @GetMapping
    public String chat(Model model) {
        List<ReqeustVO> reqList = testService.selectAllRequest();
//        log.info(reqList);
        model.addAttribute("reqList", reqList);
        return "chat/test";
    }


    @PostMapping("/open")
    public ResponseEntity<Map<String, Object>> createRoom(@RequestBody ChatRoomVO chatRoomVO) {
        log.info(chatRoomVO);
        Map<String, Object> response = testService.createChatRoom(chatRoomVO);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/list")
    public String chatList(HttpSession session, Model model) {
        if (session.getAttribute("user") != null) {
            model.addAttribute("loginCheck", mainService.loginCheck(session));
            model.addAttribute("page", "chat/list.jsp");
            Object mode = session.getAttribute("mode");
            if (mode != null && mode.toString().equals("on")) {
                ProAccountVO pro = (ProAccountVO) session.getAttribute("proSession");
                model.addAttribute("chatRooms", testService.chatListPro(pro.getPro_pk()));
                return "indexPro";
            } else {
                UserAccountVO user = (UserAccountVO) session.getAttribute("user");
                model.addAttribute("chatRooms", testService.chatList(user.getUser_pk()));
                return "index";
            }
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/room/{no}")
    public String enterRoom(@PathVariable int no, Model model, HttpSession session) {
        // 채팅방 정보 로드 및 채팅방 진입
        model.addAttribute("loginCheck", mainService.loginCheck(session));
        model.addAttribute("chatRoom", testService.getChatRoomById(no));
        log.info(testService.getChatMessagesByRoomId(no));
        model.addAttribute("chatLog", testService.getChatMessagesByRoomId(no));
        model.addAttribute("page", "chat/room.jsp");
        Object mode = session.getAttribute("mode");
        if (mode != null && mode.toString().equals("on")) {
            return "indexPro";
        } else {
            return "index";
        }
    }

    @ResponseBody
    @PostMapping("/client-info")
    public UserAccountVO clientInfo(@RequestBody UserAccountVO userAccountVO) {
        return testService.getClientInfo(userAccountVO);
    }
    @ResponseBody
    @PostMapping("/pro-info")
    public ProAccountVO proInfo(@RequestBody ProAccountVO proAccountVO) {
        return testService.getProInfo(proAccountVO);
    }



}
