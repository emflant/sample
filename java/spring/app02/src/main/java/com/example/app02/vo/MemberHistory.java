package com.example.app02.vo;

public class MemberHistory extends Member {

    private String memberId;

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    @Override
    public String toString() {
        return "MemberHistory{" +
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
                ", memberId='" + memberId + '\'' +
                '}';
    }
}
