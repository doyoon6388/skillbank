package com.skillbank.main.controller;

import com.skillbank.main.service.MainService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j2
public class ChatController {
   @Autowired
    private MainService mainService;
    @GetMapping("/chat")
    public String chatGET(Model model, HttpSession session) {

        log.info("@ChatController, chat GET()");
        model.addAttribute("page","chater.jsp" );
        model.addAttribute("loginCheck", mainService.loginCheck(session));

        return "index";
    }
}