package com.example.app02.vo;

import org.springframework.data.annotation.Id;

public class PaymentAggregate {

    private @Id String paymentMonth;
    private Long sumAmount;

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

    @Override
    public String toString() {
        return "PaymentAggregate{" +
                "paymentMonth='" + paymentMonth + '\'' +
                ", sumAmount=" + sumAmount +
                '}';
    }
}
