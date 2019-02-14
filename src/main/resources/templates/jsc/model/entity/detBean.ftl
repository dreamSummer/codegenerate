package cn.com.yto56.cockpit.entity.dto.${entity.model};

import cn.com.yto56.cockpit.entity.dto.cognos.VueTableHeaderLabel;
import lombok.Data;
import lombok.NoArgsConstructor;
<#if entity.detHasList>import java.util.List;</#if>
<#if entity.detHasDate>import java.util.Date;</#if>
@Data
@NoArgsConstructor
public class ${entity.detBeanName} {

<#if entity.detProperties?exists>
    <#list entity.detProperties as property>
    /**
    *  ${property.dbComments}
    */
    @VueTableHeaderLabel(value = "${property.dbComments}")
    private ${property.javaType} ${property.propertyName};

    </#list>
</#if>
}