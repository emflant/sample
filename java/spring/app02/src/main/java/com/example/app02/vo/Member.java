package com.example.app02.vo;

import org.springframework.data.annotation.Id;

public class Member {

    @Id
    protected String id;

    protected String parentsName; // 부모님 이름
    protected String parentsTel;  // 부모님 전화번호
    protected String name;    // 이름
    protected String gender;  // 성별
    protected String birth;   // 생년월일
    protected String membershipDate; // 가입일자
    protected String monClass;
    protected String monClassTime;
    protected String tueClass;
    protected String tueClassTime;
    protected String wenClass;
    protected String wenClassTime;
    protected String thrClass;
    protected String thrClassTime;
    protected String friClass;
    protected String friClassTime;
    protected String satClass;
    protected String satClassTime;
    protected long timeStamp;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentsName() {
        return parentsName;
    }

    public void setParentsName(String parentsName) {
        this.parentsName = parentsName;
    }

    public String getParentsTel() {
        return parentsTel;
    }

    public void setParentsTel(String parentsTel) {
        this.parentsTel = parentsTel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getMembershipDate() {
        return membershipDate;
    }

    public void setMembershipDate(String membershipDate) {
        this.membershipDate = membershipDate;
    }

    public String getMonClass() {
        return monClass;
    }

    public void setMonClass(String monClass) {
        this.monClass = monClass;
    }

    public String getMonClassTime() {
        return monClassTime;
    }

    public void setMonClassTime(String monClassTime) {
        this.monClassTime = monClassTime;
    }

    public String getTueClass() {
        return tueClass;
    }

    public void setTueClass(String tueClass) {
        this.tueClass = tueClass;
    }

    public String getTueClassTime() {
        return tueClassTime;
    }

    public void setTueClassTime(String tueClassTime) {
        this.tueClassTime = tueClassTime;
    }

    public String getWenClass() {
        return wenClass;
    }

    public void setWenClass(String wenClass) {
        this.wenClass = wenClass;
    }

    public String getWenClassTime() {
        return wenClassTime;
    }

    public void setWenClassTime(String wenClassTime) {
        this.wenClassTime = wenClassTime;
    }

    public String getThrClass() {
        return thrClass;
    }

    public void setThrClass(String thrClass) {
        this.thrClass = thrClass;
    }

    public String getThrClassTime() {
        return thrClassTime;
    }

    public void setThrClassTime(String thrClassTime) {
        this.thrClassTime = thrClassTime;
    }

    public String getFriClass() {
        return friClass;
    }

    public void setFriClass(String friClass) {
        this.friClass = friClass;
    }

    public String getFriClassTime() {
        return friClassTime;
    }

    public void setFriClassTime(String friClassTime) {
        this.friClassTime = friClassTime;
    }

    public String getSatClass() {
        return satClass;
    }

    public void setSatClass(String satClass) {
        this.satClass = satClass;
    }

    public String getSatClassTime() {
        return satClassTime;
    }

    public void setSatClassTime(String satClassTime) {
        this.satClassTime = satClassTime;
    }

    public long getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(long timeStamp) {
        this.timeStamp = timeStamp;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id='" + id + '\'' +
                ", parentsName='" + parentsName + '\'' +
                ", parentsTel='" + parentsTel + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", birth='" + birth + '\'' +
                ", membershipDate='" + membershipDate + '\'' +
                ", monClass='" + monClass + '\'' +
                ", monClassTime='" + monClassTime + '\'' +
                ", tueClass='" + tueClass + '\'' +
                ", tueClassTime='" + tueClassTime + '\'' +
                ", wenClass='" + wenClass + '\'' +
                ", wenClassTime='" + wenClassTime + '\'' +
                ", thrClass='" + thrClass + '\'' +
                ", thrClassTime='" + thrClassTime + '\'' +
                ", friClass='" + friClass + '\'' +
                ", friClassTime='" + friClassTime + '\'' +
                ", satClass='" + satClass + '\'' +
                ", satClassTime='" + satClassTime + '\'' +
                ", timeStamp=" + timeStamp +
                '}';
    }
}
