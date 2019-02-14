package com.stmt.codegenerate.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

/**
 * @author Administrator
 * @create 2019/1/14 10:15
 * @desc todo
 **/

@Component
public class BaseDataSource {

    @Autowired
    @Qualifier("jingang")
    private JdbcTemplate jdbcTemplate_jingang;

    @Autowired
    @Qualifier("jsc")
    private JdbcTemplate jdbcTemplate_jsc;

    public JdbcTemplate getJdbcTemplate(String source) {
        if ("jingang".equals(source)) return jdbcTemplate_jingang;
        else if ("jsc".equals(source)) return jdbcTemplate_jsc;
        else return jdbcTemplate_jingang;
    }


}
