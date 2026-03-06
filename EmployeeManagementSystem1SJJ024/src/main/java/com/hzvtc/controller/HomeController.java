package com.hzvtc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    
    @GetMapping("/")
    public String home() {
        return "redirect:/index.jsp";
    }
    
    @GetMapping("/index")
    public String index() {
        return "redirect:/index.jsp";
    }
}
