package com.stmt.codegenerate.dao.impl;

import com.stmt.codegenerate.dao.BaseDataSource;
import com.stmt.codegenerate.dao.EntityDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("EntityDao")
public class EntityDaoImpl extends BaseDataSource implements EntityDao {

    @Override
    public List<Map<String, Object>> getProperty(String tableName,String source) {
        JdbcTemplate jdbcTemplate = super.getJdbcTemplate(source);
        String sql = "select a.column_name as name, a.data_type as type, b.comments as comments from all_tab_columns " +
                " a INNER JOIN all_col_comments b on a.table_name = b.table_name and a.column_name = b.column_name where a.table_name = ?" +
                " and a.owner = 'YTRPT' ORDER BY a.COLUMN_ID asc";
        return jdbcTemplate.queryForList(sql,new Object[]{tableName});
    }
}
