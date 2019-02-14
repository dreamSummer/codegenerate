package com.stmt.codegenerate.common.utils;

public class FormatNameUtils {

    public static String formatName(String columName) {

        if (-1 == columName.indexOf("_")) {
            return columName;
        } else {
            int index = columName.indexOf("_");
            Character c = columName.charAt(index + 1);
            Character u = Character.toUpperCase(c);
            StringBuilder sb = new StringBuilder(columName);
            String name = sb.replace(index+1,index+2,u.toString()).replace(index,index+1,"").toString();
            return formatName(name);
        }
    }

}
