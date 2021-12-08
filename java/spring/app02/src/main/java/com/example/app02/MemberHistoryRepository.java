package com.example.app02;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface MemberHistoryRepository extends MongoRepository<MemberHistory, String> {
}
