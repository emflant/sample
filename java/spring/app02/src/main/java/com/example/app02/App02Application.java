package com.example.app02;

import com.example.app02.repository.ClassEventHistoryRepository;
import com.example.app02.repository.ClassEventRepository;
import com.example.app02.repository.MemberHistoryRepository;
import com.example.app02.repository.MemberRepository;
import com.example.app02.vo.ClassEvent;
import com.example.app02.vo.ClassEventHistory;
import com.example.app02.vo.Member;
import com.example.app02.vo.MemberHistory;
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

    @Autowired
    private ClassEventHistoryRepository eventHistoryRepository;

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
        mh.setMemberId(result.getId());
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
    public String classCalendar(@RequestParam(value = "date", defaultValue = "") String date, Model model) {

        List<ClassEvent> events = eventRepository.findByDelYn(false);
        model.addAttribute("events", events);

        ClassEvent event = new ClassEvent();
        model.addAttribute("event", event);

        List<Member> members = memberRepository.findAll();
        model.addAttribute("members", members);

        if("".equals(date)){
            date = null;
        }

        model.addAttribute("initialDate", date);

        return "class";
    }

    @PostMapping("/class")
    public RedirectView classCalendar(@ModelAttribute ClassEvent event, Model model) {

        event.setTimeStamp(System.currentTimeMillis());

        if("".equals(event.getId())){
            event.setId(null);
        }

        if("reservation".equals(event.getMemberId())){
            event.setTitle("상담예약");
        } else {

            Member member = memberRepository.findById(event.getMemberId()).orElse(new Member());

            if(event.isAbsentYn()){
                event.setTitle(member.getName() + "(결석)");
            } else if("9".equals(event.getClassCount())){
                event.setTitle(member.getName() + "(보강)");
            } else {
                event.setTitle(member.getName() + "(" + event.getClassCount() + "회)");
            }

        }

        log.info(event.toString());
        ClassEvent result = eventRepository.save(event);

        ClassEventHistory classEventHistory = new ClassEventHistory();
        BeanUtils.copyProperties(event, classEventHistory);
        classEventHistory.setId(null);
        classEventHistory.setClassEventId(result.getId());
        eventHistoryRepository.insert(classEventHistory);

        return new RedirectView("/class?date="+event.getClassDate());
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
