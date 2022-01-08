package com.example.app02.repository;

import com.example.app02.vo.MemberHistory;
import org.springframework.data.repository.CrudRepository;

public interface MemberHistoryRepository extends CrudRepository<MemberHistory, Long> {
}
