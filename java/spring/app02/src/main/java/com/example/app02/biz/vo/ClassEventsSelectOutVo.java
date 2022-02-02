package com.example.app02.biz.vo;

import com.example.app02.vo.ClassEvent;
import com.example.app02.vo.ClassEventAggregate;
import com.example.app02.vo.Member;
import org.springframework.ui.Model;

import java.util.List;

public class ClassEventsSelectOutVo {

    private List<ClassEvent> events;
    private ClassEvent event;
    private List<Member> members;
    private List<ClassEventAggregate> classTimes;
    private Member memberClassTime;
    private String initialDate;

    public List<ClassEvent> getEvents() {
        return events;
    }

    public void setEvents(List<ClassEvent> events) {
        this.events = events;
    }

    public ClassEvent getEvent() {
        return event;
    }

    public void setEvent(ClassEvent event) {
        this.event = event;
    }

    public List<Member> getMembers() {
        return members;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
    }

    public List<ClassEventAggregate> getClassTimes() {
        return classTimes;
    }

    public void setClassTimes(List<ClassEventAggregate> classTimes) {
        this.classTimes = classTimes;
    }

    public Member getMemberClassTime() {
        return memberClassTime;
    }

    public void setMemberClassTime(Member memberClassTime) {
        this.memberClassTime = memberClassTime;
    }

    public String getInitialDate() {
        return initialDate;
    }

    public void setInitialDate(String initialDate) {
        this.initialDate = initialDate;
    }

}
