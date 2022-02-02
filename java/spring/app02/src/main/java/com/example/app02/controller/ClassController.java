package com.example.app02.controller;

import com.example.app02.biz.ClassEventBiz;
import com.example.app02.repository.ClassEventHistoryRepository;
import com.example.app02.repository.ClassEventRepository;
import com.example.app02.repository.MemberRepository;
import com.example.app02.vo.ClassEvent;
import com.example.app02.vo.ClassEventHistory;
import com.example.app02.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
public class ClassController {

    private static final Logger log = LoggerFactory.getLogger(ClassController.class);

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private ClassEventRepository eventRepository;

    @Autowired
    private ClassEventHistoryRepository eventHistoryRepository;



    @GetMapping("/class")
    public String classCalendar(@RequestParam(value = "date", defaultValue = "") String date, Model model) {

        List<ClassEvent> events = eventRepository.findByDelYn(false);
        model.addAttribute("events", events);

        ClassEvent event = new ClassEvent();
        model.addAttribute("event", event);

        List<Member> members = memberRepository.findAll();
        model.addAttribute("members", members);

        //Datalists 를 이용해서 편리하게 classTime 선택할 수 있도록 하기.
        model.addAttribute("classTimes", eventRepository.groupByClassTime());

        model.addAttribute("memberClassTime", new Member());

        String strDate;

        if("".equals(date)){
            strDate = null;
        } else {
            strDate = date;
        }

        model.addAttribute("initialDate", strDate);

        return "class";
    }

    @GetMapping("/class2")
    public String classCalendar2(@RequestParam(value = "date", defaultValue = "") String date, Model model) {

        model.addAllAttributes(new ClassEventBiz().select(date));
        return "class";
    }

    @PostMapping("/class")
    public RedirectView classCalendar(@ModelAttribute ClassEvent event) {

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
            } else if("8".equals(event.getClassCount())){
                event.setTitle(member.getName() + "(체험)");
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
