package com.example.app02.controller;

import com.example.app02.repository.MemberRepository;
import com.example.app02.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ClassRestController {

    private static final Logger log = LoggerFactory.getLogger(ClassRestController.class);

    @Autowired
    private MemberRepository memberRepository;

    @PostMapping("/getClassTime")
    public Member greeting(@RequestBody Member member) {
        return memberRepository.findById(member.getId()).orElse(new Member());
    }
}
