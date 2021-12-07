package com.example.app02;

import org.springframework.data.annotation.Id;

public class Member {

    @Id
    public String id;

    private String parentsName; // 부모님 이름
    private String parentsTel;  // 부모님 전화번호
    private String name;    // 이름
    private String gender;  // 성별
    private String birth;   // 생년월일
    private String membershipDate; // 가입일자
    private String tueClass;
    private String tueClassTime;
    private String wenClass;
    private String wenClassTime;
    private String thrClass;
    private String thrClassTime;
    private long timeStamp;


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
                ", tueClass='" + tueClass + '\'' +
                ", tueClassTime='" + tueClassTime + '\'' +
                ", wenClass='" + wenClass + '\'' +
                ", wenClassTime='" + wenClassTime + '\'' +
                ", thrClass='" + thrClass + '\'' +
                ", thrClassTime='" + thrClassTime + '\'' +
                ", timeStamp=" + timeStamp +
                '}';
    }
}
