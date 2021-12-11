package com.example.app02;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
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

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@SpringBootApplication
@Controller
public class App02Application {

    private static final Logger log = LoggerFactory.getLogger(App02Application.class);
    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private MemberHistoryRepository memberHistoryRepository;

    @Autowired
    private ClassEventRepository eventRepository;

    public static void main(String[] args) {
        SpringApplication.run(App02Application.class, args);
    }

    @GetMapping("/signup")
    public String signupForm(@RequestParam(value = "id", defaultValue = "") String id, Model model) {

        Member member = memberRepository.findById(id).orElse(new Member());
        model.addAttribute("member", member);

        return "member";
    }

    @PostMapping("/signup")
    public RedirectView signupSubmit(@ModelAttribute Member member, Model model) {

        // 아무것도 입력안될때는 null 로 바꿔줘서 새로 생성되도록 한다.
        if("".equals(member.getId())){
            member.setId(null);
        }

        // master insert/update
        member.setTimeStamp(System.currentTimeMillis());
        Member result = memberRepository.save(member);

        MemberHistory mh = new MemberHistory();
        BeanUtils.copyProperties(member, mh);

        // history insert
        mh.setId(null);
        mh.setRefId(result.getId());
        memberHistoryRepository.save(mh);

        return new RedirectView("/list");
    }


    @GetMapping("/list")
    public String memberList(Model model) {

        List<Member> members = memberRepository.findAll();
        model.addAttribute("members", members);

        return "list";
    }



    @GetMapping("/class")
    public String classCalendar(Model model) {

        List<ClassEvent> events = eventRepository.findAll();
        model.addAttribute("events", events);

        return "class";
    }


    private String generateKey(String name) throws NoSuchAlgorithmException {

        String key = name + System.currentTimeMillis();
        log.info("key : " + key);

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(key.getBytes());

        StringBuilder builder = new StringBuilder();
        for (byte b : md.digest()) {
            builder.append(String.format("%02x", b));
        }

        log.info(builder.toString());

        return builder.toString();
    }
}
