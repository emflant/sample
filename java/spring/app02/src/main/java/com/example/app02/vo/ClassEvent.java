package com.example.app02.vo;

import org.springframework.data.annotation.Id;

public class ClassEvent {

    @Id
    protected String id;

    protected String classDate;
    protected String classTime;
    protected String title;
    protected String memberId;
    protected String classCount;
    protected boolean absentYn;
    protected String message;
    protected boolean delYn;
    protected long timeStamp;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClassDate() {
        return classDate;
    }

    public void setClassDate(String classDate) {
        this.classDate = classDate;
    }

    public String getClassTime() {
        return classTime;
    }

    public void setClassTime(String classTime) {
        this.classTime = classTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getClassCount() {
        return classCount;
    }

    public void setClassCount(String classCount) {
        this.classCount = classCount;
    }

    public boolean isAbsentYn() {
        return absentYn;
    }

    public void setAbsentYn(boolean absentYn) {
        this.absentYn = absentYn;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isDelYn() {
        return delYn;
    }

    public void setDelYn(boolean delYn) {
        this.delYn = delYn;
    }

    public long getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(long timeStamp) {
        this.timeStamp = timeStamp;
    }

    @Override
    public String toString() {
        return "ClassEvent{" +
                "id='" + id + '\'' +
                ", classDate='" + classDate + '\'' +
                ", classTime='" + classTime + '\'' +
                ", title='" + title + '\'' +
                ", memberId='" + memberId + '\'' +
                ", classCount='" + classCount + '\'' +
                ", absentYn=" + absentYn +
                ", message='" + message + '\'' +
                ", delYn=" + delYn +
                ", timeStamp=" + timeStamp +
                '}';
    }
}
