package com.stmt.codegenerate.domain.jsc;

import com.stmt.codegenerate.domain.bean.Property;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Administrator
 * @create 2019/1/8 10:32
 * @desc todo
 **/

@Data
@NoArgsConstructor
public class JscEntity {

    private String javaPackage;

    private String detTableName;

    private String sumTableName;

    private String model;

    private String jsonName = "Object2json";

    private String string = "String";

    private String sumBeanName;

    private String detBeanName;

    private String superClass;

    private String now;

    private List<Property> detProperties;

    private List<Property> sumProperties;

    private String detDateField;

    private String sumDateField;

    private String detOrgCodeField;

    private String sumOrgCodeField;

    private boolean constructors = false;

    private boolean detHasList = false;

    private boolean detHasDate = false;

    private boolean sumHasList = false;

    private boolean sumHasDate = false;

}
