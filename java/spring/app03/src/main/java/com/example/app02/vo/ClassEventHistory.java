package com.example.app02.vo;

public class ClassEventHistory extends ClassEvent {

    private String classEventId;

    public String getClassEventId() {
        return classEventId;
    }

    public void setClassEventId(String classEventId) {
        this.classEventId = classEventId;
    }

    @Override
    public String toString() {
        return "ClassEventHistory{" +
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
                ", classEventId='" + classEventId + '\'' +
                '}';
    }
}
