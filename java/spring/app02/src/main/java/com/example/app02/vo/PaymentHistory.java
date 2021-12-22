package com.example.app02.vo;

public class PaymentHistory extends Payment {

    private String paymentId;

    public PaymentHistory(Payment payment, String paymentId){
        this.id = null;
        this.delYn = payment.isDelYn();
        this.timeStamp = payment.getTimeStamp();
        this.memberId = payment.getMemberId();
        this.paymentDate = payment.getPaymentDate();
        this.classesPerWeek = payment.getClassesPerWeek();
        this.minutesPerSession = payment.getMinutesPerSession();
        this.amountModifyYn = payment.isAmountModifyYn();
        this.amount = payment.getAmount();
        this.paymentType = payment.getPaymentType();
        this.cashReceiptYn = payment.isCashReceiptYn();
        this.message = payment.getMessage();
        this.paymentId = paymentId;
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
                "id='" + id + '\'' +
                ", delYn=" + delYn +
                ", timeStamp=" + timeStamp +
                ", memberId='" + memberId + '\'' +
                ", paymentDate='" + paymentDate + '\'' +
                ", classesPerWeek='" + classesPerWeek + '\'' +
                ", minutesPerSession='" + minutesPerSession + '\'' +
                ", amountModifyYn=" + amountModifyYn +
                ", amount=" + amount +
                ", paymentType='" + paymentType + '\'' +
                ", cashReceiptYn=" + cashReceiptYn +
                ", message='" + message + '\'' +
                ", paymentId='" + paymentId + '\'' +
                '}';
    }
}
