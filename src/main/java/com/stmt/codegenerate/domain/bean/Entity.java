package com.stmt.codegenerate.domain.bean;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class Entity {

    private String javaPackage;

    private String tableName;

    private String sumTableName;

    private String className;

    private String sumClassName;

    private String superClass;

    private List<Property> properties;

    private List<Property> sumProperties;

    private String queryDateField;

    private String sumQueryDateField;

    private String queryOrgCodeField;

    private String sumQueryOrgCodeField;

    private boolean constructors = false;

    private boolean hasList = false;

    private boolean hasDate = false;

    private boolean sumHasList = false;

    private boolean sumHasDate = false;

}
