package com.example.app02.controller;

import com.example.app02.repository.CodeRepository;
import com.example.app02.repository.MemberRepository;
import com.example.app02.repository.PaymentHistoryRepository;
import com.example.app02.repository.PaymentRepository;
import com.example.app02.vo.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PaymentController {

    private static final Logger log = LoggerFactory.getLogger(PaymentController.class);

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private PaymentHistoryRepository paymentHistoryRepository;

    @Autowired
    private CodeRepository codeRepository;

    @GetMapping("/payment")
    public String memberList(Model model) {

        if(codeRepository.count() == 0){
            insertCode();
        }

        model.addAttribute("members", memberRepository.findAll());
        model.addAttribute("payment", new Payment());
        model.addAttribute("payments", paymentRepository.findAll());
        model.addAttribute("paymentTypeCodes", codeRepository.findByCodeTypeAndDelYn("paymentType", false));

        return "paylist";
    }

    @PostMapping("/payment")
    public RedirectView memberList(@ModelAttribute Payment payment, Model model) {

        this.preProcess(payment);
        Member member = memberRepository.findById(payment.getMemberId()).orElse(new Member());
        payment.setMember(member);

        Code resultCode = codeRepository.findByCodeTypeAndCode("paymentType", payment.getPaymentType());
        payment.setPaymentTypeCode(resultCode);

        log.info(payment.toString());

        Payment result = paymentRepository.save(payment);
        paymentHistoryRepository.save(new PaymentHistory(payment, result.getId()));

        return new RedirectView("/payment");
    }

    private void preProcess(Common common){
        common.setTimeStamp(System.currentTimeMillis());

        if("".equals(common.getId())){
            common.setId(null);
        }
    }

    private void insertCode(){
        List<Code> codes = new ArrayList<Code>();

        codes.add(new Code("paymentType", "1", "현금"));
        codes.add(new Code("paymentType", "2", "제로페이"));
        codes.add(new Code("paymentType", "3", "신용카드"));

        codeRepository.insert(codes);
    }
}
