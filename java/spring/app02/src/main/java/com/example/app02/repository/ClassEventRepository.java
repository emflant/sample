package com.example.app02.repository;

import com.example.app02.vo.ClassEvent;
import com.example.app02.vo.ClassEventAggregate;
import org.springframework.data.mongodb.repository.Aggregation;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface ClassEventRepository extends MongoRepository<ClassEvent, String> {
    public List<ClassEvent> findByDelYn(boolean delYn);

    public List<ClassEvent> findByMemberIdAndDelYn(String memberId, boolean delYn);

    @Deprecated
    @Aggregation(pipeline = {"{ $match: { memberId : { $ne: \"reservation\" },  delYn: false } }",
            "{ $group: { _id: \"$classTime\" } }",
            "{ $sort : { _id: 1 } }"})
    public List<ClassEventAggregate> groupByClassTime1();

    @Aggregation(pipeline = {"{ $match: { memberId : { $ne: \"reservation\" },  classTime : { $ne: null }, delYn: false } }",
            "{ $sort : { classDate: -1 } }",
            "{ $limit : 20 }",
            "{ $group: { _id: \"$classTime\", count: { $sum : 1 } } }",
            "{ $sort : { _id: 1 } }"})
    public List<ClassEventAggregate> groupByClassTime();


}
