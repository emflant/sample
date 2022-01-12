package com.example.app02.repository;

import com.example.app02.vo.Payment;
import com.example.app02.vo.PaymentAggregate;
import org.springframework.data.mongodb.repository.Aggregation;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface PaymentRepository extends MongoRepository<Payment, String> {
    public List<Payment> findByDelYn(boolean delYn);


    //https://stackoverflow.com/questions/59697496/how-to-do-a-mongo-aggregation-query-in-spring-data
    @Aggregation(pipeline = {"{ $match: { delYn: false } }",
    "{ $project: { paymentMonth: { $substr: [ $paymentDate, 0, 7 ] }, amount : 1 } }",
    "{ $group: { _id: $paymentMonth, sumAmount: { $sum: $amount }, cntMember: { $sum : 1 } } }",
    "{ $sort : { _id: 1 } }"})
    public List<PaymentAggregate> groupByPaymentMonth();
}
