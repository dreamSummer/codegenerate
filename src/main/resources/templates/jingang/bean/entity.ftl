package cn.com.yto56.coresystem.module.logic.statement.domain;

<#if entity.hasList>import java.util.List;</#if>
<#if entity.hasDate>import java.util.Date;</#if>
  
public class ${entity.className} <#if entity.superClass?has_content> extends ${entity.superClass}</#if>{

<#if entity.properties?exists>
   <#list entity.properties as property>
   /**
   *  ${property.dbComments}
   */
   private ${property.javaType} ${property.propertyName};

   </#list>

   <#list entity.properties as property>
   public ${property.javaType} get${property.propertyName?cap_first}(){
      return ${property.propertyName};
   }
      
   public void set${property.propertyName?cap_first}(${property.javaType} ${property.propertyName}) {
      this.${property.propertyName} = ${property.propertyName};
   }

   </#list>
</#if>
}
