package com.stmt.codegenerate.common.utils;

public class PropertyUtils {

	/**
	 * oracle 映射 Java 类型
	 * 
	 * @param sqlType
	 * @return
	 */
	public static String sqlConcertJava(String sqlType) {

		if (sqlType.equalsIgnoreCase("BIT")) {
			return "boolean";
		} else if (sqlType.equalsIgnoreCase("TINYINT")) {
			return "byte";
		} else if (sqlType.equalsIgnoreCase("SMALLINT")) {
			return "short";
		} else if (sqlType.equalsIgnoreCase("NUMBER")) {
			return "int";
		} else if (sqlType.equalsIgnoreCase("BIGINT")) {
			return "long";
		}else if (sqlType.equalsIgnoreCase("NUMERIC")||
				sqlType.equalsIgnoreCase("DECIMAL")) {
			return "BigDecimal";
		}else if (sqlType.equalsIgnoreCase("REAL")) {
			return "float";
		} else if (sqlType.equalsIgnoreCase("FLOAT")
				|| sqlType.equalsIgnoreCase("DOUBLE")) {
			return "double";
		} else if (sqlType.startsWith("VARCHAR")||sqlType.startsWith("NVARCHAR")
				|| sqlType.equalsIgnoreCase("CHAR")
				|| sqlType.equalsIgnoreCase("LONGVARCHAR")
				) {
			return "String";
		} else if (sqlType.startsWith("TIMESTAMP")) {
			return "Timestamp";
		} else if (sqlType.equalsIgnoreCase("BLOB")||sqlType.equalsIgnoreCase("CLOB")) {
			return "byte []";
		}else if(sqlType.equalsIgnoreCase("DATE")){
			return "Date";
		}

		return "String";
	}

	/**
	 * oracle 映射 String 类型
	 *
	 * @param sqlType
	 * @return
	 */
	public static String sqlConcertString(String sqlType) {

		return "String";
	}

	/**
	 * mapper 映射 取值类型
	 *
	 * @param javaType
	 * @return
	 */
	public static String mapperConcertBean(String javaType) {

		if (javaType.equalsIgnoreCase("boolean")) {
			return "getBoolean";
		} else if (javaType.equalsIgnoreCase("byte")) {
			return "getByte";
		} else if (javaType.equalsIgnoreCase("short")) {
			return "getShort";
		} else if (javaType.equalsIgnoreCase("int")) {
			return "getInt";
		} else if (javaType.equalsIgnoreCase("long")) {
			return "getLong";
		}else if (javaType.equalsIgnoreCase("BigDecimal")) {
			return "getBigDecimal";
		}else if (javaType.equalsIgnoreCase("float")) {
			return "getFloat";
		} else if (javaType.equalsIgnoreCase("double")) {
			return "getDouble";
		} else if (javaType.equalsIgnoreCase("String")){
			return "getString";
		} else if (javaType.equalsIgnoreCase("Timestamp")) {
			return "getTimestamp";
		}else if(javaType.equalsIgnoreCase("Date")){
			return "getDate";
		}

		return "getString";
	}

}
