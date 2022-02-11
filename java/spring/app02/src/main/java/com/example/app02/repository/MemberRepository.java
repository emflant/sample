package com.example.app02.repository;

import com.example.app02.vo.Member;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface MemberRepository extends MongoRepository<Member, String> {
    public List<Member> findAllByOrderByMembershipDateDesc();
}
