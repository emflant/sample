package com.example.app02.vo;

public class PaymentHistory extends Payment {

    protected String paymentId;

    public PaymentHistory(Payment payment) {
        super(payment);
        this.paymentId = payment.id;
        this.id = null;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    @Override
    public String toString() {
        return "PaymentHistory{" +
                "delYn=" + delYn +
                ", timeStamp=" + timeStamp +
                ", id='" + id + '\'' +
                ", memberId='" + memberId + '\'' +
                ", paymentDate='" + paymentDate + '\'' +
                ", amount=" + amount +
                ", paymentType='" + paymentType + '\'' +
                ", cashReceiptYn=" + cashReceiptYn +
                ", messages='" + messages + '\'' +
                ", paymentId='" + paymentId + '\'' +
                '}';
    }
}
