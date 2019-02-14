package cn.com.yto56.cockpit.entity.dto.${entity.model};

import cn.com.yto56.cockpit.entity.dto.cognos.VueTableHeaderLabel;
import lombok.Data;
import lombok.NoArgsConstructor;
<#if entity.sumHasList>import java.util.List;</#if>
<#if entity.sumHasDate>import java.util.Date;</#if>
@Data
@NoArgsConstructor
public class ${entity.sumBeanName} {

<#if entity.sumProperties?exists>
    <#list entity.sumProperties as property>
    /**
    *  ${property.dbComments}
    */
    @VueTableHeaderLabel(value = "${property.dbComments}")
    private ${property.javaType} ${property.propertyName};

    </#list>
</#if>
}