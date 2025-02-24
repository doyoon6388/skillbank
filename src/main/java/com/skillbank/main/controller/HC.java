package com.skillbank.main.controller;

import com.skillbank.main.service.SampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HC {
    public static void main(String[] args) {


        @Autowired
        private SampleService sampleService;

        @GetMapping("/")
        public String index(Model model) {
                model.addAttribute("page", "main/main.jsp");
            return "index";
        }
}
