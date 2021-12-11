package com.example.app02;

import org.springframework.data.annotation.Id;

public class ClassEvent {

    @Id
    private String id;

    private String classDate;
    private String classTime;
    private String name;
    private String refId;
    private boolean absentYn;
    private String message;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRefId() {
        return refId;
    }

    public void setRefId(String refId) {
        this.refId = refId;
    }



    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isAbsentYn() {
        return absentYn;
    }

    public void setAbsentYn(boolean absentYn) {
        this.absentYn = absentYn;
    }


    @Override
    public String toString() {
        return "ClassEvent{" +
                "id='" + id + '\'' +
                ", classDate='" + classDate + '\'' +
                ", classTime='" + classTime + '\'' +
                ", name='" + name + '\'' +
                ", refId='" + refId + '\'' +
                ", absentYn=" + absentYn +
                ", message='" + message + '\'' +
                '}';
    }
}
