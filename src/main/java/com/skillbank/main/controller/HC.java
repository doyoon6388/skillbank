package com.skillbank.main.controller;

import org.springframework.stereotype.Controller;

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
