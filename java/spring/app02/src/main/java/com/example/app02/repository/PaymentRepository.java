package com.example.app02.repository;

import com.example.app02.vo.Payment;
import com.example.app02.vo.PaymentAggregate;
import org.springframework.data.mongodb.repository.Aggregation;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface PaymentRepository extends MongoRepository<Payment, String> {
    public List<Payment> findByDelYn(boolean delYn);
}
