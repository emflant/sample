package com.example.app02.repository;

import com.example.app02.vo.MemberHistory;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface MemberHistoryRepository extends MongoRepository<MemberHistory, String> {
}
