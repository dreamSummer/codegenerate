package com.stmt.codegenerate.common.utils;

/**
 * @author Administrator
 * @create 2019/1/7 17:06
 * @desc todo
 **/

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtils {
    private static final String REGXPHTML = "<[^>]*>";

    public static String firstCharLower(String string) {
        return firstChar(string).toString().toLowerCase() + string.substring(1, string.length());
    }

    public static String firstCharUpper(String string) {
        return firstChar(string).toString().toUpperCase() + string.substring(1, string.length());
    }

    public static String firstCharUpperOrLower(String string) {
        if (EmptyUtils.isEmpty(string)) {
            return null;
        } else {
            Character ch = firstChar(string);
            if (Character.isLowerCase(ch.charValue())) {
                return firstCharUpper(string);
            } else {
                return Character.isUpperCase(ch.charValue()) ? firstCharLower(string) : string;
            }
        }
    }

    public static Character firstChar(String string) {
        return EmptyUtils.isEmpty(string) ? null : string.charAt(0);
    }

    public static String replaceHTML(String string, String oldString, String newString) {
        return EmptyUtils.isEmpty(string) ? null : string.replace(oldString, newString);
    }

    public static String replaceHTML(String string) {
        if (EmptyUtils.isEmpty(string)) {
            return null;
        } else {
            Pattern pattern = Pattern.compile("<[^>]*>");
            Matcher matcher = pattern.matcher(string);
            StringBuffer sb = new StringBuffer();

            for (boolean result1 = matcher.find(); result1; result1 = matcher.find()) {
                matcher.appendReplacement(sb, "");
            }

            matcher.appendTail(sb);
            return sb.toString();
        }
    }

    public static String replaceCharToNull(String string, String... replaceChars) {
        if (EmptyUtils.isEmpty(string)) {
            return null;
        } else {
            String[] var2 = replaceChars;
            int var3 = replaceChars.length;

            for (int var4 = 0; var4 < var3; ++var4) {
                String replaceChar = var2[var4];
                string = string.replace(replaceChar, "");
            }

            return string;
        }
    }

    public static int getLength(String string) {
        return EmptyUtils.isEmpty(string) ? 0 : string.length();
    }

    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    public static String camelhumpToUnderline(String str) {
        int size;
        char[] chars;
        StringBuilder sb = new StringBuilder((size = (chars = str.toCharArray()).length) * 3 / 2 + 1);

        for (int i = 0; i < size; ++i) {
            char c = chars[i];
            if (isUppercaseAlpha(c)) {
                sb.append('_').append(toLowerAscii(c));
            } else {
                sb.append(c);
            }
        }

        return sb.charAt(0) == '_' ? sb.substring(1) : sb.toString();
    }

    public static String underlineToCamelhump(String str) {
        Matcher matcher = Pattern.compile("_[a-z]").matcher(str);
        StringBuilder builder = new StringBuilder(str);

        for (int i = 0; matcher.find(); ++i) {
            builder.replace(matcher.start() - i, matcher.end() - i, matcher.group().substring(1).toUpperCase());
        }

        if (Character.isUpperCase(builder.charAt(0))) {
            builder.replace(0, 1, String.valueOf(Character.toLowerCase(builder.charAt(0))));
        }

        return builder.toString();
    }

    public static boolean isUppercaseAlpha(char c) {
        return c >= 'A' && c <= 'Z';
    }

    public static boolean isLowercaseAlpha(char c) {
        return c >= 'a' && c <= 'z';
    }

    public static char toUpperAscii(char c) {
        if (isLowercaseAlpha(c)) {
            c = (char) (c - 32);
        }

        return c;
    }

    public static char toLowerAscii(char c) {
        if (isUppercaseAlpha(c)) {
            c = (char) (c + 32);
        }

        return c;
    }

    public static String frontCompWithZore(int sourceData, int formatLength) {
        String newString = String.format("%0" + formatLength + "d", sourceData);
        return newString;
    }

    public static String captureName(String name) {
        char[] cs = name.toCharArray();
        cs[0] += 32;
        return String.valueOf(cs);
    }
}

