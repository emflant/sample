package com.example.app02.repository;

import com.example.app02.vo.Member;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface MemberRepository extends MongoRepository<Member, String> {
    
}
