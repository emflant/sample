package com.example.app02.controller;

import com.example.app02.App02Application;
import com.example.app02.vo.Member;
import com.example.app02.vo.Payment;
import com.example.app02.vo.PaymentHistory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PaymentController {

    private static final Logger log = LoggerFactory.getLogger(PaymentController.class);

    @GetMapping("/payment")
    public String memberList(Model model) {

        Payment p = new Payment();
        p.setId("1");
        p.setAmount(new BigDecimal("123"));
        p.setPaymentDate("2012-11-01");
        p.setPaymentType("9");
        p.setMessages("message");
        p.setCashReceiptYn(false);
        p.setDelYn(true);
        p.setTimeStamp(123456);

        log.info(p.toString());

        PaymentHistory hist = new PaymentHistory(p);

        log.info(hist.toString());

        List<Member> members = new ArrayList<Member>();
        model.addAttribute("payments", members);

        return "list";
    }
}
