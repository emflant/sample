package com.example.app02;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@SpringBootApplication
@Controller
public class App02Application {

    public static void main(String[] args) {
        SpringApplication.run(App02Application.class, args);
    }
    private static final Logger log = LoggerFactory.getLogger(App02Application.class);

    @Autowired
    private MemberRepository memberRepository;

    @GetMapping("/signup")
    public String signupForm(@RequestParam(value = "id", defaultValue = "") String id, Model model) {
        log.info(id);
//        log.info(memberRepository.findById("61ac6d954936253a4f40e4de").toString());
        Member member = memberRepository.findById(id).orElse(new Member());

//        log.info("123213 : "+ member.getId());
//        member.setMemberId(member.getId());
        log.info(member.toString());
        model.addAttribute("member", member);
        return "member";
    }

    @PostMapping("/signup")
    public String signupSubmit(@ModelAttribute Member member, Model model) {
        //member.setTimeStamp(System.currentTimeMillis());
//        log.info(member.toString());
//        memberRepository.save(member);
        model.addAttribute("member", member);
        return "member";
    }

    private String generateKey(String name) throws NoSuchAlgorithmException {

        String key = name + System.currentTimeMillis();
        log.info("key : "+ key);

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(key.getBytes());

        StringBuilder builder = new StringBuilder();
        for (byte b: md.digest()) {
            builder.append(String.format("%02x", b));
        }

        log.info(builder.toString());

        return builder.toString();
    }
}
