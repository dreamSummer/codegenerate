package cn.com.yto56.cockpit.dao.${entity.model};

import cn.com.yto56.cockpit.entity.dto.${entity.model}.${entity.model}Request;
import org.apache.commons.lang3.StringUtils;

/**
* 动态生成查询sql
*/
public class ${entity.model}SqlProvider {

    public String listQueryTotal(${entity.model}Request request) {
        StringBuffer sql = new StringBuffer();

        sql.append("select ");
        sql.append(" <#list entity.sumProperties as property>a.${property.dbFieldName} as ${property.propertyName}<#if property_has_next>, </#if></#list> ");
        sql.append(" from YTRPT.${entity.sumTableName} a "
        + " where a.${entity.sumDateField} >= to_date(${r"#{sumStartDate}"},'yyyy-mm-dd') and "
        + " a.${entity.sumDateField} < to_date(${r"#{sumEndDate}"},'yyyy-mm-dd') + 1 ");
        if(StringUtils.isNotBlank(request.getOrgCode())){
            sql.append(" and a.${entity.sumOrgCodeField} = ${r"#{orgCode}"} " );
        }

        return sql.toString();
    }

    public String listQueryDetail(${entity.model}Request request) {
        StringBuffer sql = new StringBuffer();

        sql.append("select ");
        sql.append(" <#list entity.detProperties as property>a.${property.dbFieldName} as ${property.propertyName}<#if property_has_next>, </#if></#list> ");
        sql.append(" from YTRPT.${entity.detTableName} a "
        + " where a.${entity.detDateField} >= to_date(${r"#{detStartDate}"},'yyyy-mm-dd') and "
        + " a.${entity.detDateField} < to_date(${r"#{detEndDate}"},'yyyy-mm-dd') + 1 ");
        if(StringUtils.isNotBlank(request.getOrgCode())){
        sql.append(" and a.${entity.detOrgCodeField} = ${r"#{orgCode}"} " );
        }

        return sql.toString();
    }

}