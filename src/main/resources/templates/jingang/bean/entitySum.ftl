package cn.com.yto56.coresystem.module.logic.statement.domain;

<#if entity.sumHasList>import java.util.List;</#if>
<#if entity.sumHasDate>import java.util.Date;</#if>

public class ${entity.sumClassName} <#if entity.superClass?has_content> extends ${entity.superClass}</#if>{

<#if entity.sumProperties?exists>
    <#list entity.sumProperties as property>
    /**
    *  ${property.dbComments}
    */
    private ${property.javaType} ${property.propertyName};

    </#list>

    <#list entity.sumProperties as property>
    public ${property.javaType} get${property.propertyName?cap_first}(){
    return ${property.propertyName};
    }

    public void set${property.propertyName?cap_first}(${property.javaType} ${property.propertyName}) {
    this.${property.propertyName} = ${property.propertyName};
    }

    </#list>
</#if>
}
