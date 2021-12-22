package com.example.app02.repository;

import com.example.app02.vo.PaymentHistory;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface PaymentHistoryRepository extends MongoRepository<PaymentHistory, String> {
}
