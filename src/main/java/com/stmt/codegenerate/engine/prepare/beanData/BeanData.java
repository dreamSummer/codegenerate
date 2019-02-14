package com.stmt.codegenerate.engine.prepare.beanData;

import com.stmt.codegenerate.common.utils.FormatNameUtils;
import com.stmt.codegenerate.common.utils.PropertyUtils;
import com.stmt.codegenerate.dao.EntityDao;
import com.stmt.codegenerate.domain.bean.Entity;
import com.stmt.codegenerate.domain.bean.Property;
import com.stmt.codegenerate.domain.jsc.JscEntity;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
@Data
public class BeanData {

    @Autowired
    private EntityDao entityDao;

    public void setProperty(Entity entity, String tableName, String className, boolean isSum, String source) {

        List<Property> list = new ArrayList<>();
        List<Map<String, Object>> properties = entityDao.getProperty(tableName, source);
        properties.stream().forEach(p -> {
            Property property = new Property();
            property.setDbFieldName(p.get("name").toString());
            property.setDbFieldType(p.get("type").toString());
            property.setDbComments(StringUtils.isEmpty(p.get("comments")) ? "" : p.get("comments").toString());
            String name = FormatNameUtils.formatName(p.get("name").toString().toLowerCase());
            String javaType = PropertyUtils.sqlConcertJava(p.get("type").toString());
            String mapperGetType = PropertyUtils.mapperConcertBean(javaType);
            if ("Date".equals(javaType)) {
                if (isSum) {
                    entity.setSumHasDate(true);
                } else {
                    entity.setHasDate(true);
                }
            }
            property.setPropertyName(name);
            property.setJavaType(javaType);
            property.setMapperGetType(mapperGetType);
            list.add(property);
        });

        if (isSum) {
            entity.setSumTableName(tableName);
            entity.setSumProperties(list);
            entity.setSumClassName(className);
        } else {
            entity.setTableName(tableName);
            entity.setProperties(list);
            entity.setClassName(className);
        }
    }

    public void setProperty(Entity entity, String tableName, String className, String dateField, String orgCodeField, boolean isSum, String source) {
        setProperty(entity, tableName, className, isSum, source);
        if (isSum) {
            entity.setSumQueryDateField(dateField);
            entity.setSumQueryOrgCodeField(orgCodeField);
        } else {
            entity.setQueryDateField(dateField);
            entity.setQueryOrgCodeField(orgCodeField);
        }
    }

    public void setProperty(JscEntity entity, String tableName, String className, boolean isSum, String source) {

        List<Property> list = new ArrayList<>();
        List<Map<String, Object>> properties = entityDao.getProperty(tableName, source);
        properties.stream().forEach(p -> {
            Property property = new Property();
            property.setDbFieldName(p.get("name").toString());
            property.setDbFieldType(p.get("type").toString());
            property.setDbComments(StringUtils.isEmpty(p.get("comments")) ? "" : p.get("comments").toString());
            String name = FormatNameUtils.formatName(p.get("name").toString().toLowerCase());
            String javaType = PropertyUtils.sqlConcertJava(p.get("type").toString());
            String mapperGetType = PropertyUtils.mapperConcertBean(javaType);
            if ("Date".equals(javaType)) {
                if (isSum) {
                    entity.setSumHasDate(true);
                } else {
                    entity.setDetHasDate(true);
                }
            }
            property.setPropertyName(name);
            property.setJavaType(javaType);
            property.setMapperGetType(mapperGetType);
            list.add(property);
        });

        if (isSum) {
            entity.setSumTableName(tableName);
            entity.setSumProperties(list);
            entity.setSumBeanName(className + "Total");
        } else {
            entity.setDetTableName(tableName);
            entity.setDetProperties(list);
            entity.setDetBeanName(className + "Detail");
        }
        entity.setModel(className);
    }

    public void setProperty(JscEntity entity, String tableName, String className, String dateField, String orgCodeField, boolean isSum, String source) {
        setProperty(entity, tableName, className, isSum, source);
        if (isSum) {
            entity.setSumDateField(dateField);
            entity.setSumOrgCodeField(orgCodeField);
        } else {
            entity.setDetDateField(dateField);
            entity.setDetOrgCodeField(orgCodeField);
        }
    }

}
