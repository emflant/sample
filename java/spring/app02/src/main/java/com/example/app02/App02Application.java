package com.example.app02;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@SpringBootApplication
@Controller
public class App02Application {

    public static void main(String[] args) {
        SpringApplication.run(App02Application.class, args);
    }
    private static final Logger log = LoggerFactory.getLogger(App02Application.class);

    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("member", new Member());
        return "member";
    }

    @PostMapping("/signup")
    public String signupSubmit(@ModelAttribute Member member, Model model) {
        log.info(member.toString());
        model.addAttribute("member", member);
        return "member";
    }
}
