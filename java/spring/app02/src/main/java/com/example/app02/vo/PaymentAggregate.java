package com.example.app02.vo;

import org.springframework.data.annotation.Id;

public class PaymentAggregate {

    @Id
    private String paymentMonth;
    private Long sumAmount;
    private Long cntMember;

    public String getPaymentMonth() {
        return paymentMonth;
    }

    public void setPaymentMonth(String paymentMonth) {
        this.paymentMonth = paymentMonth;
    }

    public Long getSumAmount() {
        return sumAmount;
    }

    public void setSumAmount(Long sumAmount) {
        this.sumAmount = sumAmount;
    }

    public Long getCntMember() {
        return cntMember;
    }

    public void setCntMember(Long cntMember) {
        this.cntMember = cntMember;
    }

    @Override
    public String toString() {
        return "PaymentAggregate{" +
                "paymentMonth='" + paymentMonth + '\'' +
                ", sumAmount=" + sumAmount +
                ", cntMember=" + cntMember +
                '}';
    }
}
