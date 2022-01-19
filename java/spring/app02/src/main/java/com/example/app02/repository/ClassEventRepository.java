package com.example.app02.repository;

import com.example.app02.vo.ClassEvent;
import com.example.app02.vo.ClassEventAggregate;
import org.springframework.data.mongodb.repository.Aggregation;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface ClassEventRepository extends MongoRepository<ClassEvent, String> {
    public List<ClassEvent> findByDelYn(boolean delYn);


    @Aggregation(pipeline = {"{ $match: { memberId : { $ne: \"reservation\" },  delYn: false } }",
            "{ $group: { _id: \"$classTime\" } }",
            "{ $sort : { _id: 1 } }"})
    public List<ClassEventAggregate> groupByClassTime();
}
