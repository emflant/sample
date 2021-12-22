package com.example.app02.vo;

import org.springframework.data.annotation.Id;

public class Common {

    @Id
    protected String id;

    protected boolean delYn;
    protected long timeStamp;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
}
