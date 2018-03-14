package cn.com.konyo.util;

import java.util.ArrayList;
import java.util.List;

public class LuckyUtils {

    /**
     * 根据给出的奖品池数量生成字符串 例如 num=3 则返回的数据1,2,3
     * 
     * @param num
     * @return
     */
    public static String getPoolnums(int num) {
        String str = "";
        for (int i = 1; i < num + 1; i++) {
            if (i == num) {
                str += i;
            }
            else {
                str += i + ",";
            }
        }
        return str;
    }

    /**
     * 根据给出的奖品池数量生成字符串（不包括list里的） 例如 num=3 则返回的数据1,2,3
     * 
     * @param num
     * @return
     */
    public static String getNewPoolnums(int num, List<String> list) {
        String str = "";
        for (int i = 1; i < num + 1; i++) {
            if (list.indexOf(i + "") < 0) {
                if (i == num) {
                    str += i;
                }
                else {
                    str += i + ",";
                }
            }
        }
        return str;
    }

    /**
     * 根据以“，”隔开的字符数字转换list集合 例如 1,2,3... 返回的数据为 [1,2,3...]
     * 
     * @param obj
     * @return
     */
    public static List<Object> stringToList(String str) {
        Object[] obj = str.split(",");
        List<Object> _slist = java.util.Arrays.asList(obj);
        List<Object> list = new ArrayList<Object>(_slist);
        return list;
    }

    public static boolean isExist(String str, String strs) {
        boolean flag = false;
        flag = strs.contains("," + str + ",");
        return flag;
    }
}
