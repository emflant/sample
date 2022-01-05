package com.example.app02.controller;

import com.example.app02.repository.PaymentRepository;
import com.example.app02.vo.Payment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PaymentRestController {
    private static final Logger log = LoggerFactory.getLogger(PaymentRestController.class);

    @Autowired
    private PaymentRepository paymentRepository;

    @PostMapping("/paymentRest")
    public Payment greeting(@RequestBody Payment payment) {

        Payment result = paymentRepository.findById(payment.getId()).orElse(new Payment());
//        log.info(result.toString());
        return result;
    }
}
