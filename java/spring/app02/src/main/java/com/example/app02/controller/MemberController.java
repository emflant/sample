package com.example.app02.controller;

import com.example.app02.repository.MemberHistoryRepository;
import com.example.app02.repository.MemberRepository;
import com.example.app02.vo.Member;
import com.example.app02.vo.MemberHistory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
public class MemberController {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private MemberHistoryRepository memberHistoryRepository;

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

        List<Member> members = memberRepository.findAllByOrderByMembershipDateDesc();

        model.addAttribute("members", members);

        return "list";
    }

}
