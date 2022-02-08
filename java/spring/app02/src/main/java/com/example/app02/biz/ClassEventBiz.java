package com.example.app02.biz;

import com.example.app02.repository.ClassEventHistoryRepository;
import com.example.app02.repository.ClassEventRepository;
import com.example.app02.repository.MemberRepository;
import com.example.app02.vo.ClassEvent;
import com.example.app02.vo.ClassEventHistory;
import com.example.app02.vo.Member;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ClassEventBiz {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private ClassEventRepository classEventRepository;

    @Autowired
    private ClassEventHistoryRepository classEventHistoryRepository;

    public Map<String, Object> select(String date, String searchMemberId){

        String strDate;

        if("".equals(date)){
            strDate = null;
        } else {
            strDate = date;
        }

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("event", new ClassEvent());

        if("".equals(searchMemberId)){
            result.put("events", classEventRepository.findByDelYn(false));
        } else {
            result.put("events", classEventRepository.findByMemberIdAndDelYn(searchMemberId, false));
        }

        result.put("members", memberRepository.findAll());
        result.put("classTimes", classEventRepository.groupByClassTime());
        result.put("memberClassTime", new Member());
        result.put("initialDate", strDate);
        result.put("searchMemberId", searchMemberId);

        return result;
    }

    public void save(ClassEvent event){

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

//        log.info(event.toString());
        ClassEvent result = classEventRepository.save(event);

        ClassEventHistory classEventHistory = new ClassEventHistory();
        BeanUtils.copyProperties(event, classEventHistory);
        classEventHistory.setId(null);
        classEventHistory.setClassEventId(result.getId());
        classEventHistoryRepository.insert(classEventHistory);
    }
}
