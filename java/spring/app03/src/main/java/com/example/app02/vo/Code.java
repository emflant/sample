package com.example.app02.vo;

import org.springframework.data.annotation.Id;

public class Code {

    @Id
    private String id;

    private String codeType;
    private String code;
    private String name;
    private boolean delYn;

    public Code(String codeType, String code, String name) {
        this.codeType = codeType;
        this.code = code;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCodeType() {
        return codeType;
    }

    public void setCodeType(String codeType) {
        this.codeType = codeType;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isDelYn() {
        return delYn;
    }

    public void setDelYn(boolean delYn) {
        this.delYn = delYn;
    }

    @Override
    public String toString() {
        return "Code{" +
                "id='" + id + '\'' +
                ", codeType='" + codeType + '\'' +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", delYn=" + delYn +
                '}';
    }
}
