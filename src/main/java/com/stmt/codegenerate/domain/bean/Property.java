package com.stmt.codegenerate.domain.bean;

import com.stmt.codegenerate.common.constan.PropertyType;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Property {

	private String dbFieldName;

	private String dbFieldType;

	private String dbComments;

	private String javaType;
	
	private String propertyName;

	private String mapperGetType;
	
	private PropertyType propertyType;

}
