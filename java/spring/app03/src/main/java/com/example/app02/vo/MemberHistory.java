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
                ", tueClass='" + tueClass + '\'' +
                ", tueClassTime='" + tueClassTime + '\'' +
                ", wenClass='" + wenClass + '\'' +
                ", wenClassTime='" + wenClassTime + '\'' +
                ", thrClass='" + thrClass + '\'' +
                ", thrClassTime='" + thrClassTime + '\'' +
                ", timeStamp=" + timeStamp +
                ", memberId='" + memberId + '\'' +
                '}';
    }
}
