package com.example.app02.vo;

import org.springframework.data.annotation.Id;

public class ClassEventAggregate {

    @Id
    private String classTime;

    public String getClassTime() {
        return classTime;
    }

    public void setClassTime(String classTime) {
        this.classTime = classTime;
    }

    @Override
    public String toString() {
        return "ClassEventAggregate{" +
                "classTime='" + classTime + '\'' +
                '}';
    }
}
