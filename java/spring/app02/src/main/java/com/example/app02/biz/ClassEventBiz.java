package com.example.app02.biz;

import com.example.app02.biz.vo.ClassEventsSelectOutVo;
import com.example.app02.repository.ClassEventHistoryRepository;
import com.example.app02.repository.ClassEventRepository;
import com.example.app02.repository.MemberRepository;
import com.example.app02.vo.ClassEvent;
import com.example.app02.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.Map;

public class ClassEventBiz {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private ClassEventRepository classEventRepository;

    @Autowired
    private ClassEventHistoryRepository classEventHistoryRepository;

    public Map<String, Object> select(String date){

        String strDate;

        if("".equals(date)){
            strDate = null;
        } else {
            strDate = date;
        }

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("event", new ClassEvent());
        result.put("events", classEventRepository.findByDelYn(false));

        result.put("members", memberRepository.findAll());
        result.put("classTimes", classEventRepository.groupByClassTime());
        result.put("memberClassTime", new Member());
        result.put("initialDate", strDate);

        return result;
    }
}
