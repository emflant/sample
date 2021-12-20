package com.example.app02.vo;

import org.springframework.data.annotation.Id;

import java.math.BigDecimal;

public class Payment extends Common {

    @Id
    protected String id;

    protected String memberId;
    protected String paymentDate;
    protected BigDecimal amount;
    protected String paymentType;
    protected boolean cashReceiptYn;
    protected String messages;

    public Payment(){
        super();
    }

    public Payment(Payment payment) {
        super(payment.delYn, payment.timeStamp);
        this.id = payment.id;
        this.memberId = payment.memberId;
        this.paymentDate = payment.paymentDate;
        this.amount = payment.amount;
        this.paymentType = payment.paymentType;
        this.cashReceiptYn = payment.cashReceiptYn;
        this.messages = payment.messages;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public boolean isCashReceiptYn() {
        return cashReceiptYn;
    }

    public void setCashReceiptYn(boolean cashReceiptYn) {
        this.cashReceiptYn = cashReceiptYn;
    }

    public String getMessages() {
        return messages;
    }

    public void setMessages(String messages) {
        this.messages = messages;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "delYn=" + delYn +
                ", timeStamp=" + timeStamp +
                ", id='" + id + '\'' +
                ", memberId='" + memberId + '\'' +
                ", paymentDate='" + paymentDate + '\'' +
                ", amount=" + amount +
                ", paymentType='" + paymentType + '\'' +
                ", cashReceiptYn=" + cashReceiptYn +
                ", messages='" + messages + '\'' +
                '}';
    }
}
