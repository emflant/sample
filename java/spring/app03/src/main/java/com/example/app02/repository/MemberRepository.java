package com.example.app02.repository;

import com.example.app02.vo.Member;
import org.springframework.data.repository.CrudRepository;

public interface MemberRepository extends CrudRepository<Member, Integer> {
    
}
