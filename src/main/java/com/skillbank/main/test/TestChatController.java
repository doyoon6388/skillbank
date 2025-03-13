package com.skillbank.main.test;

import com.skillbank.main.service.MainService;
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
        UserAccountVO user = (UserAccountVO) session.getAttribute("user");
        model.addAttribute("chatRooms", testService.chatList(user.getUser_pk()));
        return "chat/list";
    }

    @GetMapping("/room/{no}")
    public String enterRoom(@PathVariable int no, Model model) {
        // 채팅방 정보 로드 및 채팅방 진입
        model.addAttribute("chatRoom", testService.getChatRoomById(no));
        log.info(testService.getChatMessagesByRoomId(no));
        model.addAttribute("chatLog", testService.getChatMessagesByRoomId(no));
        return "chat/room";
    }


    // 테스트용 로그인
    @Autowired
    private MainService mainService;

    @PostMapping("/login2")
    public String login(UserAccountVO userAccountVO, HttpSession session) {
        UserAccountVO user = mainService.loginValid(userAccountVO);
        if (user != null) {
            // 로그인 성공: 세션에 사용자 정보 저장
            session.setAttribute("user", user);

        }
        return "redirect:/test/chat";
    }
}
