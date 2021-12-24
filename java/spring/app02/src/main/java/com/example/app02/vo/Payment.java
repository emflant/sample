package com.example.app02.vo;

public class Payment extends Common {

    protected String memberId;
    protected String paymentDate;
    protected String classesPerWeek;
    protected String minutesPerSession;
    protected boolean amountModifyYn;
    protected int amount;
    protected String paymentType;
    protected Code paymentTypeInfo;
    protected boolean cashReceiptYn;
    protected String message;
    protected Member memberIdInfo;


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

    public String getClassesPerWeek() {
        return classesPerWeek;
    }

    public void setClassesPerWeek(String classesPerWeek) {
        this.classesPerWeek = classesPerWeek;
    }

    public String getMinutesPerSession() {
        return minutesPerSession;
    }

    public void setMinutesPerSession(String minutesPerSession) {
        this.minutesPerSession = minutesPerSession;
    }

    public boolean isAmountModifyYn() {
        return amountModifyYn;
    }

    public void setAmountModifyYn(boolean amountModifyYn) {
        this.amountModifyYn = amountModifyYn;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public Code getPaymentTypeInfo() {
        return paymentTypeInfo;
    }

    public void setPaymentTypeInfo(Code paymentTypeInfo) {
        this.paymentTypeInfo = paymentTypeInfo;
    }

    public boolean isCashReceiptYn() {
        return cashReceiptYn;
    }

    public void setCashReceiptYn(boolean cashReceiptYn) {
        this.cashReceiptYn = cashReceiptYn;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Member getMemberIdInfo() {
        return memberIdInfo;
    }

    public void setMemberIdInfo(Member memberIdInfo) {
        this.memberIdInfo = memberIdInfo;
    }

    @Override
    public String toString() {
        return "Payment{" +
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
                ", paymentTypeInfo=" + paymentTypeInfo +
                ", cashReceiptYn=" + cashReceiptYn +
                ", message='" + message + '\'' +
                ", memberIdInfo=" + memberIdInfo +
                '}';
    }
}
