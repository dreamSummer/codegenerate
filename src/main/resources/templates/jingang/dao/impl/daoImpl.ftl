package cn.com.yto56.coresystem.module.logic.statement.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.ibm.gbs.ai.portal.framework.server.dao.jdbc.BaseJdbcDao;
import com.ibm.gbs.ai.portal.framework.server.metadata.IPage;
import com.ibm.gbs.ai.portal.framework.server.metadata.Page;
import com.ibm.gbs.ai.portal.framework.server.metadata.QueryPage;

public class ${entity.className}DaoImpl extends BaseJdbcDao implements I${entity.className}Dao {

    // 汇总mapper
    private class SumRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int i) throws SQLException {
            ${entity.sumClassName} ${entity.sumClassName?uncap_first} = new ${entity.sumClassName}();
            DecimalFormat df = new DecimalFormat();
            <#list entity.sumProperties as property>
            ${entity.sumClassName?uncap_first}.set${property.propertyName?cap_first}(StringUtils.isBlank(rs.${property.mapperGetType}("${property.propertyName}"))?"":rs.${property.mapperGetType}("${property.propertyName}"));
            </#list>

            return ${entity.sumClassName?uncap_first};
        }
    }

    // 明细mapper
    private class DetailRowMapper implements RowMapper {

        @Override
        public Object mapRow(ResultSet rs, int i) throws SQLException {
            ${entity.className} ${entity.className?uncap_first} = new ${entity.className}();
            DecimalFormat df = new DecimalFormat();
            <#list entity.properties as property>
            ${entity.className?uncap_first}.set${property.propertyName?cap_first}(StringUtils.isBlank(rs.${property.mapperGetType}("${property.propertyName}"))?"":rs.${property.mapperGetType}("${property.propertyName}"));
            </#list>

            return ${entity.className?uncap_first};
        }
    }

    @Override
    public IPage<?> querySum(QueryPage queryPage, Map<String, String> searchFields){
        String currentOrgCode = searchFields.get("currentOrgCode");
        String startTime = searchFields.get("startTime");
        String endTime = searchFields.get("endTime");
        String orgCode = searchFields.get("orgCode");
        StringBuffer sql = new StringBuffer();
        sql.append("select ");
        sql.append(" <#list entity.sumProperties as property>a.${property.dbFieldName} as ${property.propertyName}<#if property_has_next>, </#if></#list> ");
        sql.append(" from YTRPT.${entity.sumTableName} a left join ytmdm.mv_mdm_org_rpt m on m.code = a.${entity.sumQueryOrgCodeField} "
                    + " where a.${entity.sumQueryDateField} >= TO_DATE('" + startTime + "','yyyy-MM-dd') and "
                    + " a.${entity.sumQueryDateField} < TO_DATE('" + endTime + "','yyyy-MM-dd') + 1 ");
        if(StringUtils.isNotBlank(orgCode)){
            sql.append(" and a.${entity.sumQueryOrgCodeField} = '"+orgCode+"' " );
        }
        sql.append(" and (  m.hq = '" + currentOrgCode + "' or "
        + " m.management_area = '" + currentOrgCode + "' or "
        + " m.region_manage = '" + currentOrgCode + "' or "
        + " m.transport_center = '" + currentOrgCode + "' or "
        + " m.branch = '" + currentOrgCode + "' or "
        + " m.sub_department = '" + currentOrgCode + "' or "
        + " m.level6 = '" + currentOrgCode + "' or "
        + " m.level7 = '" + currentOrgCode + "') ");
        sql.append(" and 1=1 ");
        System.out.println("sql--"+ sql.toString());

        queryPage.setSqlString(sql.toString());
        queryPage.setRowMapper(new SumRowMapper());

        return  this.queryByPage(queryPage);
    }

    @Override
    public IPage<?> queryDatail(QueryPage queryPage, Map<String, String> searchFields){
        String currentOrgCode = searchFields.get("currentOrgCode");
        String startTime = searchFields.get("startTime");
        String endTime = searchFields.get("endTime");
        String orgCode = searchFields.get("orgCode");
        StringBuffer sql = new StringBuffer();
        sql.append("select ");
        sql.append(" <#list entity.properties as property>a.${property.dbFieldName} as ${property.propertyName}<#if property_has_next>, </#if></#list> ");
        sql.append(" from YTRPT.${entity.tableName} a left join ytmdm.mv_mdm_org_rpt m on m.code = a.${entity.queryOrgCodeField} "
        + " where a.${entity.queryDateField} >= TO_DATE('" + startTime + "','yyyy-MM-dd') and "
        + " a.${entity.queryDateField} < TO_DATE('" + endTime + "','yyyy-MM-dd') + 1 ");
        if(StringUtils.isNotBlank(orgCode)){
            sql.append(" and a.${entity.queryOrgCodeField} = '"+orgCode+"' " );
        }
        sql.append(" and (  m.hq = '" + currentOrgCode + "' or "
        + " m.management_area = '" + currentOrgCode + "' or "
        + " m.region_manage = '" + currentOrgCode + "' or "
        + " m.transport_center = '" + currentOrgCode + "' or "
        + " m.branch = '" + currentOrgCode + "' or "
        + " m.sub_department = '" + currentOrgCode + "' or "
        + " m.level6 = '" + currentOrgCode + "' or "
        + " m.level7 = '" + currentOrgCode + "') ");
        sql.append(" and 1=1 ");
        System.out.println("sql--"+ sql.toString());

        queryPage.setSqlString(sql.toString());
        queryPage.setRowMapper(new DetailRowMapper());

        return  this.queryByPage(queryPage);
    }

}

