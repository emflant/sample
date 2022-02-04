package com.example.app02.repository;

import com.example.app02.vo.Payment;
import com.example.app02.vo.PaymentAggregate;
import org.springframework.data.mongodb.repository.Aggregation;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface PaymentRepository extends MongoRepository<Payment, String> {

    // 처음에는 N 인것만 찾다보니, null 인 케이스가 안나오는 상황이었음.
    public List<Payment> findByDelYnOrderByPaymentDateDesc(boolean delYn);

    // del <> Y 인 걸 보여주면 될듯함.
    public List<Payment> findByDelYnNotOrderByPaymentDateDesc(boolean delYn);

    //https://stackoverflow.com/questions/59697496/how-to-do-a-mongo-aggregation-query-in-spring-data
    @Aggregation(pipeline = {"{ $match: { delYn: false } }",
            "{ $project: { paymentMonth: { $substr: [ \"$paymentDate\", 0, 7 ] }, memberId : 1, amount : 1 } }",
            "{ $group: { _id: { paymentMonth : \"$paymentMonth\", memberId : \"$memberId\" }, amount: { $sum: \"$amount\" } } }",
            "{ $group: { _id: \"$_id.paymentMonth\", sumAmount: { $sum: \"$amount\" }, cntMember: { $sum : 1 } } }",
            "{ $sort : { _id: 1 } }"})
    public List<PaymentAggregate> groupByPaymentMonth();
}
