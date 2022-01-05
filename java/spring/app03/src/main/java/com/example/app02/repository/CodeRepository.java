package com.example.app02.repository;

import com.example.app02.vo.Code;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface CodeRepository extends MongoRepository<Code, String> {
    public Code findByCodeTypeAndCode(String codeType, String code);
    public List<Code> findByCodeTypeAndDelYn(String codeType, boolean delYn);
}
