package com.example.app02;

import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface ClassEventRepository extends MongoRepository<ClassEvent, String> {
    public List<ClassEvent> findByDelYn(boolean delYn);

}
