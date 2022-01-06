package com.example.app02;

import com.example.app02.repository.MemberRepository;
import com.example.app02.vo.Member;
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
import org.springframework.web.servlet.view.RedirectView;

@SpringBootApplication
@Controller
public class App02Application {

    private static final Logger log = LoggerFactory.getLogger(App02Application.class);

    @Autowired
    private MemberRepository memberRepository;


    public static void main(String[] args) {
        SpringApplication.run(App02Application.class, args);
    }

    @GetMapping("/signup")
    public String signupForm(@RequestParam(value = "id", defaultValue = "0") String id, Model model) {

        log.info("paramid : " +id);
        Member member = memberRepository.findById(Integer.parseInt(id)).orElse(new Member());
        model.addAttribute("member", member);

        return "member";
    }
    //SELECT * FROM information_schema.columns WHERE table_name = 'member';

    @PostMapping("/signup")
    public RedirectView signupSubmit(@ModelAttribute Member member, Model model) {

        // 아무것도 입력안될때는 null 로 바꿔줘서 새로 생성되도록 한다.
        if ("0".equals(member.getId())) {
            member.setId(null);
        }

        // master insert/update
        member.setTimeStamp(System.currentTimeMillis());
        Member result = memberRepository.save(member);

        // history insert

        return new RedirectView("/list");
    }


    @GetMapping("/list")
    public String memberList(Model model) {

        Iterable<Member> members = memberRepository.findAll();

        model.addAttribute("members", members);

        return "list";
    }



}
