package com.example.app02.repository;

import com.example.app02.vo.ClassEvent;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface ClassEventRepository extends MongoRepository<ClassEvent, String> {
    public List<ClassEvent> findByDelYn(boolean delYn);
}
