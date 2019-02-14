package com.stmt.codegenerate.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface EntityDao {

    List<Map<String,Object>> getProperty(String tableName, String source);

}
