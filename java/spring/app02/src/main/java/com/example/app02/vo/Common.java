package com.example.app02.vo;

import org.springframework.data.annotation.Id;

public class Common {

    protected boolean delYn;
    protected long timeStamp;

    public Common() {
    }

    public Common(boolean delYn, long timeStamp) {
        this.delYn = delYn;
        this.timeStamp = timeStamp;
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
