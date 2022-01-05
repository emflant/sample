package com.example.app02.repository;

import com.example.app02.vo.ClassEventHistory;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ClassEventHistoryRepository  extends MongoRepository<ClassEventHistory, String> {
}
