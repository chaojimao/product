package util;

import java.util.List;
import java.util.Map;

public class FormatEmpty {

    public static boolean isEmpty(Object str) {
        if (str == null || isEmpty(str.toString())) {
            return true;
        }
        return false;
    }

    /**
     * �ж��Ƿ�Ϊ�գ�null||length==0��
     * 
     * @param str
     * @return false��Ϊ�գ�trueΪ��
     */
    public static boolean isEmpty(String str) {
        if (str == null || str.trim().length() == 0) {// "".equals(str)
            return true;
        }
        return false;
    }

    /**
     * �ж��Ƿ�Ϊ�գ�null||isEmpty��
     * 
     * @param map
     * @return false��Ϊ�գ�trueΪ��
     */
    public static boolean isEmpty(Map<?, ?> map) {
        if (map == null || map.isEmpty()) {
            return true;
        }
        return false;
    }

    /**
     * �ж��Ƿ�Ϊ�գ�null||isEmpty��
     * 
     * @param list
     * @return false��Ϊ�գ�trueΪ��
     */
    public static boolean isEmpty(List<?> list) {
        if (list == null || list.isEmpty()) {
            return true;
        }
        return false;
    }

    /**
     * �ж��Ƿ�Ϊ�գ�null||length == 0��
     * 
     * @param array
     * @return false��Ϊ�գ�trueΪ��
     */
    public static boolean isEmpty(Object[] array) {
        if (array == null || array.length == 0) {
            return true;
        }
        return false;
    }

}