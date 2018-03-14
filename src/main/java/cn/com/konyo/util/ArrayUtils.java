package cn.com.konyo.util;

import java.util.List;

public class ArrayUtils {
    /**
     * 去除字符数组重复值
     * 
     * @param array
     * @return
     */
    public static String[] removeRepeat(String[] array) {
        StringBuffer sb = new StringBuffer(",");
        for (String s : array) {
            if ("".equals(s.trim()))
                continue;
            if (!sb.toString().contains("," + s + ","))
                sb.append(s).append(",");
        }
        sb.deleteCharAt(0);
        sb.deleteCharAt(sb.lastIndexOf(","));
        return sb.toString().split(",");
    }

    /**
     * 集合拼接
     * 
     * @param list 集合
     * @param split 分隔符
     * @return
     */
    public static String join(List<String> list, String split) {
        if (list.size() > 0) {
            StringBuilder result = new StringBuilder();
            for (String s : list) {
                result.append(split).append(s);
            }
            if (result.length() > 0)
                result.deleteCharAt(0);
            return result.toString();
        }
        else {
            return null;
        }
    }

    /**
     * 集合拼接成字符串
     * 
     * @param array 集合
     * @param split 分隔符
     * @return
     */
    public static String join(String[] array, String split) {
        if (array != null && array.length > 0) {
            StringBuilder result = new StringBuilder();
            for (String s : array) {
                result.append(split).append(s);
            }
            if (result.length() > 0)
                result.deleteCharAt(0);
            return result.toString();
        }
        else {
            return null;
        }
    }

    /**
     * 字符串拼接结果如（'asd','ddd','23'）
     * 
     * @param array
     * @return
     */
    public static String join(String[] array) {
        if (array != null && array.length > 0) {
            StringBuilder result = new StringBuilder();
            for (String s : array) {
                result.append(",'").append(s).append("'");
            }
            if (result.length() > 0)
                result.deleteCharAt(0);
            return result.toString();
        }
        else {
            return null;
        }
    }

    /**
     * 字符串拼接结果如（'asd','ddd','23'）
     * 
     * @param array
     * @return
     */
    public static String join(List<String> list) {
        if (list.size() > 0) {
            StringBuilder result = new StringBuilder();
            for (String s : list) {
                result.append(",'").append(s).append("'");
            }
            if (result.length() > 0)
                result.deleteCharAt(0);
            return result.toString();
        }
        else {
            return null;
        }
    }

}
